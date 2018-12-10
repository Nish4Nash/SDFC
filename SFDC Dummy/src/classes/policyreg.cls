public class policyreg {
    
    public Policy__c policy	{get;set;}
    
    		public policyreg() {
	 				 
    				policy=new policy__c();
            }

    public void submit(){
        try{
         String cuid=Apexpages.currentpage().getparameters().get('id');
       		policy.Customer_Name__c = [select Id  FROM Customer__c WHERE Id=:cuid].Id;
                insert policy;
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record saved successfully'));
        }        
         catch(DmlException e){
              ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Record not found'));
            }
    }
}