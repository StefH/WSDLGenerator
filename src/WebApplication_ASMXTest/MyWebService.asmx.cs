using System;
using System.Collections.Generic;
using System.Web.Services;
using WebApplication_ASMXTest.DataModel;

namespace WebApplication_ASMXTest
{
    /// <summary>
    /// Summary description for MyWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class MyWebService : WebService
    {
        [WebMethod]
        public MyParentType GetParentType(MyParentType pt)
        {
            return new MyParentType();
        }

        [WebMethod]
        public MyComplexType GetComplexType(MyComplexType ct)
        {
            return new MyComplexType();
        }

        [WebMethod]
        public List<MyComplexType2> GetComplexTypeList(List<MyComplexType2> ctList)
        {
            return new List<MyComplexType2>();
        }

        [WebMethod]
        public MyComplexType3[] GetComplexTypeArray(MyComplexType3[] ctArray)
        {
            return new MyComplexType3[0];
        }

        [WebMethod]
        public MyEmptyType GetMyEmptyType(MyEmptyType ct)
        {
            return new MyEmptyType();
        }

        [WebMethod]
        public void NoParam()
        {
        }

        [WebMethod]
        public void AddStringList(List<string> user)
        {
        }

        [WebMethod]
        public void AddStringArray(string[] user)
        {
        }

        [WebMethod]
        public void AddString(string user)
        {
        }

        [WebMethod]
        public void AddChar(char chr)
        {
        }

        [WebMethod]
        public void AddLongListArrays(List<long> longList, long[] longArray)
        {
        }

        [WebMethod]
        public void AddIntListArrays(List<int> intlist, int[] intArray)
        {
        }

        [WebMethod]
        public void AddCharListArrays(List<char> charlist, char[] charArray)
        {
        }

        [WebMethod]
        public void AddBoolListArrays(List<bool> boollist, bool[] boolArray)
        {
        }

        [WebMethod]
        public void AddShortListArrays(List<short> shortlist, short[] shortArray)
        {
        }

        [WebMethod]
        public bool AddUser(string user, long id, int number, bool valid)
        {
            return true;
        }

        [WebMethod]
        public long GetLong()
        {
            return 42L;
        }

        [WebMethod]
        public int GetInt()
        {
            return 1977;
        }

        [WebMethod]
        public bool GetBool()
        {
            return false;
        }

        [WebMethod]
        public String GetString()
        {
            return "str";
        }

        [WebMethod]
        public List<string> GetStringList()
        {
            return new List<string>();
        }

        [WebMethod]
        public string[] GetStringArray()
        {
            return new string[2];
        }
    }
}
