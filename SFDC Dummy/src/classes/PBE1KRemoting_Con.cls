public class PBE1KRemoting_Con {
 @RemoteAction
    public static List<Contact> getContacts(){
        return [SELECT Name,FirstName,LastName,Phone,Email FROM Contact];
    }
}