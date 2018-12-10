@isTest
public class Testclass{
    List<Contact> lstContact=new List<Contact>();
    static testmethod void testing()
    {
        Account a= new Account(Name='ajtyouyhsf');
        try{
        insert a;
        }
        catch(DmlException e)
        {
            System.debug('hello');
        }
       }
        
   }