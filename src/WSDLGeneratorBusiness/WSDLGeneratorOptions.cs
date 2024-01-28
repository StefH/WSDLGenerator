using System.IO;

namespace WSDLGeneratorBusiness
{
    public class WSDLGeneratorOptions
    {
        public DirectoryInfo OutputFolder { get; set; }

        public bool GenerateWSDL { get; set; }

        public bool GenerateSPWSDL { get; set; }

        public bool GenerateSPDisco { get; set; }
    }
}