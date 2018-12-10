@RestResource(urlMapping='/getallaccountname/*')
global class UserRegistration{
    @HttpGET
    global static List<wrapup> Get(){
        List<Account> accname=[Select id,AccountNumber,Name from Account];
        List<wrapup> accwr= new List<wrapup>();
                for(Account a: accname){
                    wrapup w= new wrapup();
                    w.id=a.id;
                    w.name=a.Name;
                    w.accnum=a.AccountNumber;
                    accwr.add(w);
                    }
        
        return accwr;
        }
        
                
            global class wrapup{
                String id;
                String name;
                string accnum;
            }
            
      @HttpPOST      
      global static List<wrapup> receivedate(String rating){
      
      List<Account> acc=[select Id,name,AccountNumber from Account where Annual_revenue_rating__c=:rating];
      List<wrapup> accwr= new List<wrapup>();
                for(Account a: acc){
                    wrapup w= new wrapup();
                    w.id=a.id;
                    w.name=a.Name;
                    w.accnum=a.AccountNumber;
                    accwr.add(w);
                    }
        
        return accwr;
      }

}