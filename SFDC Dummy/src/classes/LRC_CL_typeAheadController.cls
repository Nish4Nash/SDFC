/***********************************************************************************
* Class: LRC_CL_typeAheadController
* CreatedBy: Ajay Agnihotri (Re-Used Existing Component)
* Description: Aura enabled class to search a specified SObject for a specific string
* Revision History
***********************************************************************************/
public class LRC_CL_typeAheadController 
{
    /**
     * Aura enabled method to search a specified SObject for a specific string
     */
    @AuraEnabled
    public static Result[] lookup(String searchString, String sObjectAPIName,string searchField,string DisplayField)
    {
        system.debug('display Field-------------------------------->'+DisplayField);
        // Sanitze the input
        String sanitizedSearchString = String.escapeSingleQuotes(searchString);
        String sanitizedSObjectAPIName = String.escapeSingleQuotes(sObjectAPIName);

        List<Result> results = new List<Result>();
        // Build our SOSL query
        string searchQuery='';
        if(searchField !=null){
            List<string> lstSearchFields = searchField.Split(',');
            if(DisplayField !=null && DisplayField !='Name'){
                searchQuery= 'Select Name,id,'+DisplayField+' from ';
            }else{
                searchQuery= 'Select Name,id from ';
            }
            searchQuery=searchQuery+sObjectAPIName;
            for(integer i=0;i<lstSearchFields.size();i++){
                String val='\'%' + String.escapeSingleQuotes(searchString.trim()) + '%\'';
                if(i==0){
                    searchQuery=searchQuery+' where '+lstSearchFields[i]+' LIKE '+val;
                }else{
                    searchQuery=searchQuery+'OR '+lstSearchFields[i]+' LIKE '+val;
                }
            }
            searchQuery=searchQuery+' Limit 50'; 
            List<SObject> searchList=Database.query(searchQuery);
            for (SObject so : searchList)
            {
                if(DisplayField != null){
                    results.add(new Result((String)so.get(DisplayField), so.Id));
                }else{
                    results.add(new Result((String)so.get('Name'), so.Id));
                }
            }
        }else{
            searchQuery = 'FIND \'' + sanitizedSearchString + '*\' IN ALL FIELDS RETURNING ' + sanitizedSObjectAPIName + '(id,name) Limit 50'; 
            List<List<SObject>> searchList = search.query(searchQuery);
            // Create a list of matches to return
            for (SObject so : searchList[0])
            {
                if(DisplayField != null){
                    results.add(new Result((String)so.get(DisplayField), so.Id));
                }else{
                    results.add(new Result((String)so.get('Name'), so.Id));
                }
            }
        }
        
        return results;
    }
     
    /**
     * Inner class to wrap up an SObject Label and its Id
     */
    public class Result{
        @AuraEnabled public String SObjectLabel {get; set;}
        @AuraEnabled public Id SObjectId {get; set;}
         
        public Result(String sObjectLabel, Id sObjectId)
        {
            this.SObjectLabel = sObjectLabel;
            this.SObjectId = sObjectId;
        }
    }
}