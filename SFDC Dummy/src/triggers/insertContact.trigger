/*trigger insertContact on Account (after insert)
{
  Contact cont = new Contact();
    for(Account a:Trigger.new){
  cont.LastName =a.name;
    cont.AccountId = a.ID; 
insert cont;
}
poorly written code
}*/

trigger insertContact on Account (after insert, after update)
{
 List<Contact> lstContact=new List<Contact>();


 for(Account a : Trigger.new)
 {
    Contact cont = new Contact();   //DAO :database access object
    cont.LastName = a.name;   // normally we dont write the index [0] because triggers we write on bulk records
    cont.AccountId = a.ID; 
    lstContact.add(cont);
 }
 insert lstContact;
}