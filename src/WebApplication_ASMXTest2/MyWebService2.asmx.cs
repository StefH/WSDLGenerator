using System.Web.Services;
using WebApplication_ASMXTest;
using WebApplication_ASMXTest.DataModel;

namespace WebApplication_ASMXTest2
{
	/// <summary>
	/// Summary description for MyWebService2
	/// </summary>
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	public class MyWebService2 : MyWebService
	{
		[WebMethod]
		public MyComplexType4 GetMyComplexType4()
		{
			return new MyComplexType4();
		}
	}
}