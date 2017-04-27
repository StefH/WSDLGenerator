using System.Runtime.Serialization;

namespace WCFService2
{
    [DataContract]
    public class CompositeType2
    {
        bool boolValue = true;
        string stringValue = "Hi ";

        [DataMember]
        public bool BoolValue
        {
            get { return boolValue; }
            set { boolValue = value; }
        }

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
