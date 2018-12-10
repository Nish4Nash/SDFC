public class test1 {
    
    public List<Integer> a {get;set;} //instance variable
    public Integer n {get;set;}
    public test1(){
        //a = new List<Account>();
        a= new Integer[]{10,4,5,42,3,7,8,9,70,32};
            bubblesort();
    }
    
    /*public void m1(){
	system.debug('inside m1');
    a=[Select id,name from Account limit 20];
    system.debug('Account list ='+a);    
        }    
    
    public void m2(){
        system.debug(a);
    }*/
    
    public void bubblesort()
    {
        
            Integer i,j,t;
        for(i=0;i<9;i++){
            for(j=0;j<10-i-1;j++)
            {
                if(a[j]>a[j+1])
                {
                    t=a[j];
                    a[j]=a[j+1];
                    a[j+1]=t;
                }
            }
        }
        
        System.debug('the sorted ARRAY IS \n');
        for(i=0;i<10;i++)
            system.debug(a[i]);
    }
    
    
    public PageReference search(){
        Integer i;
        for(i=0;i<10;i++)
        {
            if(a[i]==n){
                   ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM,'Record Found!'));
        			break;
            }
        }
        if(i==10)
               ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Record not found'));
        
        return null;
    }
}