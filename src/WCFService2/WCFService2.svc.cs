using System;
using System.ServiceModel;

namespace WCFService2
{
    [ServiceContract]
    public class WCFService2 : WCFService.WCFService
    {
        [OperationContract]
        public string GetData2(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        [OperationContract]
        public CompositeType2 GetDataUsingDataContract2(CompositeType2 composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite2");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
