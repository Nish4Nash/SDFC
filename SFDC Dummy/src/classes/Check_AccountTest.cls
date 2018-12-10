public class Check_AccountTest {

    public static void callMethod1(){
        //The query you want.
        List<Account> acc=[Select id from Account limit 10];
        //Instantiate a List of id to pass as a parameter to Method1
        List <Id> argumentList=new List<Id>();
        //Iteraiate and fill
        for( Account ob:acc)
           argumentList.add(ob.Id); 
        //Call
        //string s='aaa';
        list<String> aa=new List<String>{'0012800000q0T0xAAE','0012800000q0T0yAAE'};
            String s='{\'0012800000q0T0xAAE\'}';
        Account_Test.method1(aa);
    }
}