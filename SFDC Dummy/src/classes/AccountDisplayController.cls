public class AccountDisplayController{

  public List<ApexClass> myAccList{get;set;}
    public  AccountDisplayController()
    {
        myAccList=[SELECT Id,Name,Status FROM Apexclass];
        }

    public void run(){

    }
}