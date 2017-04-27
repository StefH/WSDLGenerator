using WSDLGeneratorBusiness;

namespace WSDLGeneratorTest
{
	class Program
	{
		static void Main(string[] args)
		{
			new WSDLGenerator(null, null, false).GenerateFiles(null);
		}
	}
}
