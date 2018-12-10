global class Batchdelete implements Database.Batchable <sObject>{
    public String query;
     global Batchdelete(){}
        global Batchdelete(String q ){
            query= q;     
        }        
            global Database.QueryLocator start(Database.BatchableContext BC){
                return Database.getQueryLocator(query);
            }
                global void execute (Database.BatchableContext BC, List<sObject> fdel){
                    List <Feedback__c> fdd = (List<Feedback__c>)fdel;          
                    delete fdd;                      
                }         
                    global void finish(Database.BatchableContext BC){
                    }
}