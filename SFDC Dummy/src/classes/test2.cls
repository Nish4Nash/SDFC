public class test2 {
    public List<Account> accList {get;set;}
    public String input{get;set;}
	public String output{get;set;}
    public test2(){
	system.debug('inside constructor');
    accList=[Select id,name from Account limit 20];
    system.debug('Account list ='+accList);    
    }
    
    public void action1(){
        output = input;      
    }
}