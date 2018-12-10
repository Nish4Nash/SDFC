public with sharing class searchresult {
  public String a{get;set;}
    public searchresult(ApexPages.StandardController controller) {

    }

  
  public List<Account> myAccList{get;set;}
    public void search()
    {
        if(a == '')
        {
      
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'PLEASE ENTER THE NAME'));
           
        }
        else{
        myAccList=[select Id,Name from Account where Name=:a];
        }
        }

}