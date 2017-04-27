using System.Web.Services;
using WebApplication_ASMXTest;

namespace WebApplication_ASMXTest2
{
	/// <summary>
	/// Summary description for AnotherWebService2
	/// </summary>
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	[System.ComponentModel.ToolboxItem(false)]
	public class AnotherWebService2 : AnotherWebService
	{
		[WebMethod]
		public string HiWorld()
		{
			return "Hi World";
		}
	}
}