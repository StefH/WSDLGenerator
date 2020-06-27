using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web.Services;
using System.Web.Services.Description;
using System.Xml;
using WSDLGenerator;

namespace WSDLGeneratorBusiness
{
    public class Generator
    {
        private readonly List<KeyValuePair<WebServiceType, Type>> serviceTypes = new List<KeyValuePair<WebServiceType, Type>>();
        private readonly bool verbose;
        private readonly string applicationPath;

        public Generator(string path, string servicename, bool verbose)
        {
            this.verbose = verbose;

            applicationPath = Path.GetDirectoryName(path);

            AppDomain.CurrentDomain.AssemblyResolve += CurrentDomain_AssemblyResolve;

            Assembly assembly;
            try
            {
                assembly = Assembly.LoadFrom(path);
            }
            catch (Exception assemblyEx)
            {
                throw new Exception("There was an error while opening assembly '" + path + "'", assemblyEx);
            }
            /*
			var dependencies = new List<Assembly>();
			foreach (var referencedAssembly in assembly.GetReferencedAssemblies())
			{
				try
				{
					dependencies.Add(AppDomain.CurrentDomain.Load(referencedAssembly));
				}
				catch (Exception assemblyEx)
				{
					throw new Exception("There was an error loading dependency '" + referencedAssembly.Name + "'", assemblyEx);
				}
			}*/

            var services = assembly
                .GetWebServiceTypes()
                //.Union(dependencies.SelectMany(x => x.GetWebServiceTypes()))
                .ToList();

            if (services.Count == 0)
            {
                services = assembly.GetWCFServiceTypes().ToList();

                if (services.Count > 0)
                {
                    Console.WriteLine("WCF Service(s) found in assembly '" + path + "', use SvcUtil.exe to generate wsdl");
                    return;
                }
            }

            if (services.Count == 0)
            {
                Console.WriteLine("No WCF/WebService(s) found in assembly '" + path + "'");
                return;
            }

            if (!string.IsNullOrEmpty(servicename))
            {
                foreach (var kvType in services)
                {
                    if (kvType.Value.FullName == servicename)
                    {
                        serviceTypes.Add(kvType);
                    }
                }

                if (serviceTypes.Count == 0)
                {
                    Console.WriteLine("Service '" + servicename + "'not found in assembly '" + path + "'");
                }
            }
            else
            {
                serviceTypes = services;
            }
        }

        Assembly CurrentDomain_AssemblyResolve(object sender, ResolveEventArgs args)
        {
            var assemblyName = new AssemblyName(args.Name);

            string dllPath = Path.Combine(applicationPath, $"{assemblyName.Name}.dll");

            bool fileExists = File.Exists(dllPath);

            return fileExists ? Assembly.LoadFrom(dllPath) : null;
        }

        public void GenerateFiles(GeneratorOptions generatorOptions)
        {
            string outputFolder = generatorOptions.OutputFolder.FullName;

            foreach (var kvType in serviceTypes)
            {
                WebServiceType serviceType = kvType.Key;
                Type type = kvType.Value;
                if (generatorOptions.GenerateWSDL)
                {
                    string wsdl = Path.Combine(outputFolder, type.Name + ".wsdl");
                    GenerateWSDL(serviceType, type, wsdl, false);
                }

                if (generatorOptions.GenerateSPWSDL)
                {
                    string spwsdl = Path.Combine(outputFolder, type.Name + "wsdl.aspx");
                    GenerateWSDL(serviceType, type, spwsdl, true);
                }

                if (generatorOptions.GenerateSPDisco)
                {
                    string spdisco = Path.Combine(outputFolder, type.Name + "disco.aspx");

                    var wsAttr = type.GetCustomAttribute<WebServiceAttribute>();
                    string ns = wsAttr.Namespace;

                    string xml = string.Format(Utils.GetResource("SP2007Disco.xml"), ns, type.Name);

                    if (WriteFile(spdisco, xml))
                    {
                        Console.WriteLine("Disco has been generated : '" + spdisco + "'");
                    }
                }
            }
        }

        private void GenerateWSDL(WebServiceType serviceType, Type type, string filepath, bool generateSPFile)
        {
            if (serviceType == WebServiceType.ASMX)
            {
                var wsAttr = type.GetCustomAttribute<WebServiceAttribute>();

                string ns = wsAttr.Namespace;
                string asmx = "http://localhost/" + type.Name + ".asmx";

                if (!string.IsNullOrEmpty(ns) && ns[ns.Length - 1] != '/')
                {
                    Console.WriteLine($"Invalid namespace, '{ns}' does not end with a /");
                    return;
                }

                var reflector = new ServiceDescriptionReflector();
                reflector.Reflect(type, asmx);

                if (reflector.ServiceDescriptions.Count > 1)
                {
                    Console.WriteLine("Multiple service descriptions not supported.");
                    return;
                }

                var stream = new MemoryStream();
                var xmlWriter = new XmlTextWriter(stream, Encoding.UTF8) { Formatting = Formatting.Indented };
                reflector.ServiceDescriptions[0].Write(xmlWriter);

                var textReader = new StreamReader(stream);
                stream.Seek(0, SeekOrigin.Begin);
                string xml = textReader.ReadToEnd();

                if (generateSPFile && serviceType == WebServiceType.ASMX)
                {
                    // Replace header
                    xml = xml.Replace("<?xml version=\"1.0\" encoding=\"utf-8\"?>", Utils.GetResource("SP2007Header.xml"));

                    // Fix services
                    xml = xml.Replace("location=\"" + asmx + "\"", "location=<% SPHttpUtility.AddQuote(SPHttpUtility.HtmlEncode(SPWeb.OriginalBaseUrl(Request)),Response.Output); %>");
                }

                if (WriteFile(filepath, xml))
                {
                    Console.WriteLine("WSDL has been generated : '" + filepath + "'");
                }
            }
        }

        private bool WriteFile(string filepath, string data)
        {
            try
            {
                File.WriteAllText(filepath, data);
            }
            catch (Exception fileEx)
            {
                Console.WriteLine("There was an error while writing file '" + filepath + "'");
                if (verbose)
                {
                    Console.WriteLine(fileEx.Message);
                }

                return false;
            }

            return true;
        }
    }
}