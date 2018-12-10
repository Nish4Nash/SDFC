public class ListOfApexController{

  public List<ApexClass> myAccList{get;set;}

    public  ListOfApexController()
    {
        for(apexclass c:[select Id,name,Status from apexclass order by name asc Limit 100 ]) {
            try {
                system.type t = system.type.forname(c.name);
                if(t != null && t.newinstance() instanceof database.batchable<sobject>) 
                    myAccList.add(c);                
                } 
            catch(exception e) { }
    }
    System.debug('accountlist is---->'+myAccList);
     }

    public void run(){

    }
}