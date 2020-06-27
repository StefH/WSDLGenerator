using System.IO;

namespace WSDLGenerator
{
    public class GeneratorOptions
    {
        public DirectoryInfo OutputFolder { get; set; }
        public bool GenerateWSDL { get; set; }
        public bool GenerateSPWSDL { get; set; }
        public bool GenerateSPDisco { get; set; }
    }
}