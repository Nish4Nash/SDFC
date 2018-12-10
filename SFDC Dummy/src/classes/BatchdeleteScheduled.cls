global class BatchdeleteScheduled implements Schedulable{
    global void execute(SchedulableContext SC){
        String query = 'select Id,Name,OwnerId,feedback_quality__c	from Feedback__c where Score_band__c< 24';
        Batchdelete del = new Batchdelete(query);          
        ID batchprocessid = Database.executeBatch(del,2000);
        
     }
}