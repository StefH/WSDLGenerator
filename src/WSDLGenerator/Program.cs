using System;
using System.IO;
using CommandLineParser.Arguments;
using CommandLineParser.Exceptions;
using WSDLGeneratorBusiness;
using WSDLVersionInfo;

namespace WSDLGeneratorCmd
{
    class Program
    {
        /// <summary>
        /// An object that should recieve the commandline arguments.
        /// </summary>
        class Args
        {
            [FileArgument('i', "input", Description = "Input assembly or file which contains the WebServices", FileMustExist = true, Optional = false)]
            public FileInfo InputFile;

            [DirectoryArgument('o', "outputfolder", Description = "Output directory", DirectoryMustExist = true, Optional = false)]
            public DirectoryInfo OutputFolder;

            [SwitchArgument('w', "wsdl", false, Description = "Generate wsdl file")]
            public bool GenerateWSDL;

            [SwitchArgument('s', "spwsdl", false, Description = "Generate SharePoint compatible *wsdl.aspx file")]
            public bool GenerateSPWSDL;

            [SwitchArgument('d', "spdisco", false, Description = "Generate SharePoint compatible *disco.aspx file")]
            public bool GenerateSPDisco;

            //[SwitchArgument('u', "url", false, Description = "Webservice URL (needed for disco)")]
            public bool SPDiscoUrl;

            [ValueArgument(typeof(string), 'n', "servicename", Description = "Specifies the fully qualified name of a service to be exported (when omitted, all services are exported)")]
            public string ServiceName;

            [SwitchArgument('v', "verbose", false, Description = "Verbose messages")]
            public bool Verbose;
        }

        private static void ShowUsage(CommandLineParser.CommandLineParser parser)
        {
            Console.WriteLine($"WSDLGenerator ({VersionInfo.Version})");
            parser.ShowUsage();
        }

        static void Main(string[] commandArgs)
        {
            var parser = new CommandLineParser.CommandLineParser();
            var args = new Args();
            parser.ExtractArgumentAttributes(args);

            if (commandArgs.Length == 0)
            {
                ShowUsage(parser);
                return;
            }

            try
            {
                parser.ParseCommandLine(commandArgs);

                var options = new WSDLOptions
                {
                    OutputFolder = args.OutputFolder,
                    GenerateWSDL = args.GenerateWSDL,
                    GenerateSPWSDL = args.GenerateSPWSDL,
                    GenerateSPDisco = args.GenerateSPDisco
                };

                if (args.Verbose)
                {
                    parser.ShowParsedArguments();
                }

                new WSDLGenerator(args.InputFile.FullName, args.ServiceName, args.Verbose).GenerateFiles(options);
            }
            catch (CommandLineException e)
            {
                Console.WriteLine(e.Message);
                ShowUsage(parser);
            }
        }
    }
}