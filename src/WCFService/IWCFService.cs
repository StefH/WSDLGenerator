namespace WCFService
{

    //[ServiceContract]
    public interface IWCFService
    {
        //[OperationContract]
        string GetData(int value);

        //[OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);
    }
}