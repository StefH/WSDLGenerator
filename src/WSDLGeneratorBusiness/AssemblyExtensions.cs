using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.ServiceModel;
using System.Web.Services;

namespace WSDLGeneratorBusiness
{
    internal static class AssemblyExtensions
	{
		/// <summary>
		/// Get all WebServices from an Assembly
		/// </summary>
		/// <param name="assembly">The Assembly</param>
		/// <returns>List</returns>
		public static IEnumerable<KeyValuePair<WebServiceType, Type>> GetWebServiceTypes(this Assembly assembly)
		{
			try
			{
				return assembly.GetTypes()
                    .Where(t => t.IsSubclassOf(typeof(WebService)))
					.Select(t => new KeyValuePair<WebServiceType, Type>(WebServiceType.ASMX, t));
			}
			catch (Exception ex)
			{
				if (ex is ReflectionTypeLoadException reflectionTypeLoadException)
				{
                    foreach (var loaderEx in reflectionTypeLoadException.LoaderExceptions)
					{
						Console.WriteLine(loaderEx.ToString());
					}
				}

				throw;
			}
		}

		/// <summary>
		/// Get all WCFWebServices from an Assembly
		/// </summary>
		/// <param name="assembly">The Assembly</param>
		/// <returns>List</returns>
		public static IEnumerable<KeyValuePair<WebServiceType, Type>> GetWCFServiceTypes(this Assembly assembly)
		{
			foreach (var type in assembly.GetTypes())
			{
				var attribute = type.GetCustomAttribute<ServiceContractAttribute>();

				if (attribute != null)
				{
					yield return new KeyValuePair<WebServiceType, Type>(WebServiceType.WCF, type);
				}
			}
		}
	}
}