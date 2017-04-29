using System;

namespace WSDLTest
{
	class Program
	{
		static void Main(string[] args)
		{
			TestMyWebService();
			TestMyWebService2();
		}

		private static void TestMyWebService()
		{
			const string url = "http://localhost:1139/MyWebService.asmx";

			// .NET 2.0
			var service20 = new MyNamespaceForMyWebService_DotNet20.MyWebService { Url = url };
			Console.WriteLine(".NET 2.0 = " + service20.GetLong());

			// .NET 4.0
			var service40 = new MyNamespaceForMyWebService_DotNet40.MyWebService { Url = url };
			Console.WriteLine(".NET 4.0 = " + service40.GetLong());

		    // .NET 4.6
		    var service46 = new MyNamespaceForMyWebService_DotNet46.MyWebService { Url = url };
		    Console.WriteLine(".NET 4.6 = " + service46.GetLong());
        }

		private static void TestMyWebService2()
		{
			const string url = "http://localhost:49242/MyWebService.asmx";

			// .NET 2.0
			var service20 = new MyNamespaceForMyWebService2_DotNet20.MyWebService2 { Url = url };
			Console.WriteLine(".NET 2.0 = " + service20.GetLong());

			// .NET 4.0
			var service40 = new MyNamespaceForMyWebService2_DotNet40.MyWebService2 { Url = url };
			Console.WriteLine(".NET 4.0 = " + service40.GetLong());

		    // .NET 4.6
		    var service46 = new MyNamespaceForMyWebService2_DotNet46.MyWebService2 { Url = url };
		    Console.WriteLine(".NET 4.0 = " + service46.GetLong());
        }
	}
}