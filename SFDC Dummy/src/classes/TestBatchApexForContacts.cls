global class TestBatchApexForContacts implements Database.Batchable<Sobject>{

    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='select id, name,BatchField__c from Contact';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Contact> scope){
        List<Contact> contactListToUpdate= new List<Contact>();
        for(Contact con:scope){
            if(String.isBlank(con.BatchField__c)){
                con.BatchField__c='Updated Batch Field at '+System.now();
            	contactListToUpdate.add(con);
            }
            
            try{
                if(contactListToUpdate!=null && !contactListToUpdate.isEmpty())
                    Database.update(contactListToUpdate);
            }
            catch(Exception e){
                System.debug('Error occured -->'+e.getMessage());
            }
        }
    }
    
    global void finish(Database.BatchableContext bc){
        AsyncApexJob aaj = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                            TotalJobItems, ExtendedStatus from AsyncApexJob where Id = :bc.getJobId()];
        String body;
        List<String> sendAddresses = new List<String>();
		sendAddresses.add('nishanuroyal@gmail.com');
        sendAddresses.add('sanwarmal1964@gmail.com');
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
        mail.setToAddresses(sendAddresses);
        

        mail.setSubject('Contact Batch Field status update'); 
        
        if(aaj.Status == 'Completed') {
            body = 'Contact Batch Field has completed successfully with ' +
                   aaj.TotalJobItems + ' batches processed where ' + aaj.NumberOfErrors +
                   ' records have failed. ExtendedStatus is ' + aaj.ExtendedStatus;
        }
        mail.setPlainTextBody(body);
        Messaging.sendEmail (new Messaging.singleEmailMessage[] {mail});       
    }
    
}