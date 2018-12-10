global class EmailDemoReceive implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,  Messaging.Inboundenvelope envelope){                                                     
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        try{
            Account acc=  new Account();
            acc.Name=email.subject;
            acc.External_id__c='New'+email.subject;
            insert acc;
            result.success=true;
            System.debug('Inside try');
        } catch(Exception e){
            result.success=false;
            result.message='fail';
            System.debug('Inside catch'+ e.getMessage());
        }
        return result;
    }
}