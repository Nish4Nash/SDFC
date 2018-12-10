@RestResource(urlMapping='/FetchAccounts')  
global with sharing class Poc_Fetch_Accounts_Rest_WS
{      
     @HttpGet    
     global static list<AccountWrapper> postRestMethodFetchAccount()     
     {          
          System.debug('Response returened');
          List<AccountWrapper> wrapperList= new List<AccountWrapper>();
          try{
              List<Account> acc=[Select id,Name,(Select id,Name from Contacts) from Account Limit 20];
              for(Account ob:acc){
                AccountWrapper accwrap= new AccountWrapper();
                accwrap.id=ob.id;
                accwrap.Name=ob.Name;
                List<ContactWrraper> contwrapList = new  List<ContactWrraper>();
                  for(Contact c: ob.Contacts){
                      ContactWrraper con= new ContactWrraper();
                      con.id=c.Id;
                      con.Name=c.Name;
                      contwrapList.add(con);
                  }
                accwrap.conwrapper=contwrapList;
                wrapperList.add(accwrap);
              }
            }
          catch(Exception e){
              System.debug('Exception ocured'+e.getMessage());
          }
          return wrapperList;   
     }
     
   /* @HttpGet    
     global static list<Account> postRestMethodFetchAccount()     
     {          
          System.debug('Response returened');
          List<Account> accList= new List<Account>();
          try{
              accList=[Select External_id__c,Name,(Select Name from Contacts) from Account where AccountNumber='212124141' Limit 20];
              
            }
          catch(Exception e){
              System.debug('Exception ocured'+e.getMessage());
          }
          return accList;   
     }
     */
     global class AccountWrapper{
         String id;
         String Name;
         List<ContactWrraper> conwrapper;
     }
    global class ContactWrraper{
         String id;
         String Name;
    }
}