public class PolicySurveyClass {

    public Feedback__c survey{get;set;} //policy object refernce
    public PolicySurveyClass(){
     	survey= new Feedback__c();   //object creation
    	}
    
    public void submitfeedback(){	
        //on clicking submit button feedback fields will be updated.
        	String cus = Apexpages.currentpage().getparameters().get('custid');//getting the customer id from  parameter on vf page
        	String polid = [SELECT Id FROM Policy__c WHERE Customer_Name__c=:cus].Id;
        	List<Feedback__c> fobj=[SELECT Id FROM Feedback__c WHERE Policy_Number_Ref__c=:polid];
        
        try{
            if(fobj.isEmpty()){          
            survey.Policy_Number_Ref__c =polid;
			/* score field update in feedback */
            survey.Score_band__c= Integer.valueOf(survey.Fq1__c.substring(0,1))+Integer.valueOf(survey.Fq2__c.substring(0,1))+
                				  Integer.valueOf(survey.Fq3__c.substring(0,1))+Integer.valueOf(survey.Fq4__c.substring(0,1))+
            					  Integer.valueOf(survey.Fq5__c.substring(0,1))+Integer.valueOf(survey.Fq6__c.substring(0,1))+
                                  Integer.valueOf(survey.Fq7__c.substring(0,1))+Integer.valueOf(survey.Fq8__c.substring(0,1))+
                                  Integer.valueOf(survey.Fq9__c.substring(0,1));
            
            insert survey;		//inserting
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'THANK YOU FOR YOUR FEEDBACK')); // vf page message on success
            survey= new Feedback__c();
            }
            else{
                            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'You have already submitted the feedback'));//error message
            }
        }    
        catch(DmlException e){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Please fill the survey properly'));//error message
        
            
    }
    
    }
}