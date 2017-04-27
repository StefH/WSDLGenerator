using System;
using System.ServiceModel;

namespace WCFService
{
   [ServiceContract]
    public class WCFService
    {
        [OperationContract]
        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        [OperationContract]
        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
