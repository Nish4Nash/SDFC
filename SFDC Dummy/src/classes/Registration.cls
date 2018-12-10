public class Registration {
    
    public Customer__c customer {get;set;}
    public Policy__c policy {get;set;}
    public Boolean flag {get;set;}
    
    public Registration() {
    }
    
    
    
    //public ApexPages.StandardController controller; 
    
    public Registration(ApexPages.StandardController controller){
        customer= new Customer__c(); 
        policy=new policy__c();
        
        flag= false;
        
        string cus = Apexpages.currentpage().getparameters().get('id');
        if(cus!=null && cus!=' '){
            flag= true;
            
            List<Customer__c> cusob=[select Name,Age__c,Annual_Income__c,City__c,Email_Id__c,
                                     Gender__c,Last_Name__c,Phone_Mobile__c,Policy_Number__c,Qualification__c,
                                     Resident_Street_Address__c,State__c,Zip_Code__c from Customer__c where id=:cus];
            customer.Name=cusob[0].Name;
            customer.Age__c=cusob[0].Age__c;
            customer.Last_Name__c=cusob[0].Last_Name__c;
            customer.Gender__c=cusob[0].Gender__c;
            customer.Email_Id__c=cusob[0].Email_Id__c;
            customer.Phone_Mobile__c=cusob[0].Phone_Mobile__c;
            customer.Annual_Income__c=cusob[0].Annual_Income__c;
            customer.Qualification__c=cusob[0].Qualification__c;
            customer.Resident_Street_Address__c=cusob[0]. Resident_Street_Address__c;
            customer.State__c=cusob[0].State__c;
            customer.City__c=cusob[0].City__c;
            customer.Zip_Code__c=cusob[0].Zip_Code__c;
            
            String polid=[SELECT Id FROM Policy__c WHERE Customer_Name__c=:cus].Id;
            List<Policy__c> pol=[select Insured_First_Name__c,Insured_Last_Name__c,
                                 Policy_Inception_Date_Risk_Start_Date__c,
                                 Policy_Maturity_Date_Risk_End_Date__c,Policy_Name__c,Policy_Owner_First_Name__c,
                                 Policy_Owner_Last_Name__c,Premium__c,Premium_Due_date__c,Premium_Mode__c,Source_Agency_Name__c
                                 from Policy__c where id=:polid];
            
            policy.Policy_Name__c= pol[0].Policy_Name__c;
            policy.Insured_First_Name__c=pol[0].Insured_First_Name__c;
            policy.Insured_Last_Name__c=pol[0].Insured_Last_Name__c;
            policy.Policy_Inception_Date_Risk_Start_Date__c=pol[0].Policy_Inception_Date_Risk_Start_Date__c;
            policy.Policy_Maturity_Date_Risk_End_Date__c=pol[0].Policy_Maturity_Date_Risk_End_Date__c;
            policy.Policy_Owner_First_Name__c=pol[0].Policy_Owner_First_Name__c;
            policy.Policy_Owner_Last_Name__c=pol[0].Policy_Owner_Last_Name__c;
            policy.Premium__c=pol[0].Premium__c;
            policy.Premium_Due_date__c=pol[0].Premium_Due_date__c;
            policy.Premium_Mode__c=pol[0].Premium_Mode__c;
            policy.Source_Agency_Name__c=pol[0].Source_Agency_Name__c;
        }
    }
    
   /* public PageReference back() {
        PageReference pg = new PageReference(Apexpages.currentpage().getparameters().get('id'));
        return pg;
    }*/
    public PageReference updt() {
        string cuid = Apexpages.currentpage().getparameters().get('id');
        List<Customer__c> cus=[select Id from Customer__c where Id=:cuid];
        /*String eml=cus[0].Email_Id__c;
        system.debug('email got='+eml);
        List <Customer__c> muser=[Select Id,Email_Id__c from Customer__c where Email_Id__c=:customer.Email_Id__c];*/
        
        try{
                if(customer.Age__c  <18 || customer.Age__c>65)
                    throw new MyException('The Age of the customer must be in 18-65 years to hold a policy');
                if(!Pattern.matches( '\\D*?(\\d\\D*?){10}',customer.Phone_Mobile__c))
                    throw new MyException('This is not a valid phone number.it should be of 10 digits');
                if(Policy.Premium__c > customer.Annual_Income__c)
                    throw new MyException('Customers premium exceeding the annual income');
                    
                for(Customer__c cu : cus){
                   cu.Age__c=customer.Age__c;
                   cu.Annual_Income__c=customer.Annual_Income__c;
                   cu.City__c=customer.City__c;
                   cu.Phone_Mobile__c=customer.Phone_Mobile__c;
                   cu.Qualification__c=customer.Qualification__c;
                   cu.Resident_Street_Address__c=customer.Resident_Street_Address__c;
                   cu.State__c=customer.State__c;
                   cu.Zip_Code__c=customer.Zip_Code__c;
                }
                    update cus;
                    PageReference np = new PageReference('/'+cuid);
                    return np;
            }
           
            catch(MyException me) {  
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,me.getMessage()));   
                return null;
            }
            
            catch(DmlException e) { 
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'update failed'));
                return null;
            }    
            
            
            
        }
        
        
        public PageReference submit() {            
            try{
                
                //Pagereference pg = new PageReference('/apex/success_Page'); 
                if(customer.Age__c  <18 || customer.Age__c>65)
                    throw new MyException('The Age of the customer must be in 18-65 years to hold a policy');
                if(!Pattern.matches( '\\D*?(\\d\\D*?){10}',customer.Phone_Mobile__c))
                    throw new MyException('This is not a valid phone number.it should be of 10 digits');
                if ( customer.Name <> policy.Policy_Owner_First_Name__c)
                    throw new MyException('The First Name of The Customer and Policy Owner is not Same');
                if (customer.Last_Name__c <> policy.Policy_Owner_Last_Name__c)
                    throw new MyException('The Last Name of the Customer and Policy Owner is not same');  
                if( policy.Policy_Inception_Date_Risk_Start_Date__c != System.today())
                    throw new MyException('The policy inception Date should start from today');
                if (policy.Policy_Inception_Date_Risk_Start_Date__c > policy.Policy_Maturity_Date_Risk_End_Date__c  )  
                    throw new MyException('The policy Maturity Date SHOULD BE greater than Policy Inception date ');
                if(policy.Premium_Due_date__c < policy.Policy_Inception_Date_Risk_Start_Date__c  || policy.Premium_Due_date__c > policy.Policy_Maturity_Date_Risk_End_Date__c)
                    throw new MyException('The policy premium due date must fall in policy life cycle');
                if(Policy.Premium__c > customer.Annual_Income__c)
                    throw new MyException('Customers premium exceeding the annual income');
                
                String email=customer.Email_Id__c;
                List <Customer__c> multiuser=[Select Id,Email_Id__c from Customer__c where Email_Id__c=:email];
                
                if(multiuser.isEmpty()){
                    
                    insert customer;
                    policy.Customer_Name__c=customer.Id;
                    insert policy;
                    
                    
                    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record saved successfully'));
                 
                    PageReference nextPage = new PageReference('/' + customer.Id);
                    customer= new Customer__c(); 
        			policy=new policy__c();
                    return nextPage;
                }
                else
                {
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Record Already exists with the same email id'));
                    customer= new Customer__c(); 
                    policy=new policy__c();
                    return null;
                }
                
            }
            catch(MyException me) {  
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,me.getMessage()));   
                return null;
            }
            
            catch(DmlException e) { 
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'please enter the records properly'));
                return null;
            }          
            
        } 
        public class MyException extends Exception {
        }
    }