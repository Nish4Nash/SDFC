global class retrieveAccount{

    global class AccountList{
      webservice String name;
      webservice Id aacId;
   }

     webservice static List<AccountList> retrieveAcc() {
         
              List<Account> acc = [select id, name from Account Limit 5];
              List<AccountList> wrapperList= new list<AccountList>(); 
              for(Account a: acc){
                  AccountList ac = new AccountList();
                  ac.name=a.name;
                  ac.aacId=a.id;
                  wrapperList.add(ac);
              }
              return wrapperList;
       }

}