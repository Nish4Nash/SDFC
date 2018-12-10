public class Account_first_poc_apex{

    public String inputVariable{get;set;}
    public String outputVariable{get;set;}
    
    public Account_first_poc_apex(){
         
     }
     
     public void saveMyValue(){
         if(inputVariable!= null && inputVariable.length()>5)
             outputVariable=inputVariable;
         else
             outputVariable='Value Not set';
     }
 }