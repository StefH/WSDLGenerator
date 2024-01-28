using System.IO;
using System.Reflection;

namespace WSDLGeneratorBusiness
{
    internal static class Utils
    {
        /// <summary>
        /// Get the string content from an embedded resource file.
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        public static string GetResource(string filename)
        {
            var stream = Assembly.GetExecutingAssembly().GetManifestResourceStream("WSDLGeneratorBusiness.BuildingBlocks." + filename);

            if (stream != null)
            {
                using (var sr = new StreamReader(stream))
                {
                    return sr.ReadToEnd();
                }
            }

            return null;
        }
    }
}