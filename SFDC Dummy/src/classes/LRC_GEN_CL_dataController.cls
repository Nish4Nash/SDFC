/***********************************************************************************
* Class: LRC_GEN_CL_dataController
* CreatedBy: Nishit Kedia:
* Description: This is the controller class to process data for dataGrid
* Revision History: 
***********************************************************************************/
public class LRC_GEN_CL_dataController {
    
    /* @Name: 			getSObjectData 
     * @Description:	Load Data with the records from the serach text
     * @params : 		object Api Name,Text to search,Columns To Display,fields to be serached Upon
     * @return : 		Wrapper in String format : Search results
    */	
    @AuraEnabled
    public static List<sObject> getSObjectData(string sobjectAPIName,string search, List<String> lstLookUpColumns,List<String> lstSearchFields) {
        list<LRC_CL_dataGridWrapper> dataGridWrap=new List <LRC_CL_dataGridWrapper>();
        System.debug('The search text-->'+search);
        search = '%'+ search+ '%';
        search=String.escapeSingleQuotes(search);
        String sFieldApiComma ='';
        sFieldApiComma= String.join(lstLookUpColumns,',');
		String sLikeSearchFields ='';
		String sLikeText = ' LIKE :search OR '; 		
		sLikeSearchFields= String.join(lstSearchFields,sLikeText);
		sLikeSearchFields+=' LIKE :search';
		String finalQuery= 'Select Id,'+sFieldApiComma+' from '+sobjectAPIName+' Where '+ sLikeSearchFields +' Order by Name ASC LIMIT 50';
        System.debug('The search query when lookup Icon Clicked-->'+finalQuery);
        List<Sobject> sobjectList = Database.query(finalQuery);
        return sobjectList;
    }
    
    /* @Name: 			getFieldLabel 
     * @Description:	To map the field labels of the lookup columns to show
     * @params : 		object Api Name,Columns To Display: Api Name,
     * @return : 		Wrapper in String format : Field Label mapping
    */
    @AuraEnabled
    public static Map<string,string> getFieldLabel(string sobjectAPIName,List<String> lstLookUpColumns) {
        Map<string,string> MapFieldAPIVSFieldLabel=new Map<string,string>();
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(sobjectAPIName);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        System.debug('The field map-->'+fieldMap);
       	for(String sFieldApi : lstLookUpColumns){
       		if(sFieldApi.contains('.')){
                String sLookupFieldName = sFieldApi.substringBefore('.');
                if(sLookupFieldName.contains('__r')){                   
                   	sLookupFieldName=sLookupFieldName.replace('__r','__c');
       			}
                if(fieldMap.containsKey(sLookupFieldName)){
                    MapFieldAPIVSFieldLabel.put(sFieldApi,fieldMap.get(sLookupFieldName).getDescribe().getLabel());
                }else{
                    MapFieldAPIVSFieldLabel.put(sFieldApi,sLookupFieldName);
                }
                
       		}else{
       			MapFieldAPIVSFieldLabel.put(sFieldApi,fieldMap.get(sFieldApi).getDescribe().getLabel());
       		}
       	}
        return MapFieldAPIVSFieldLabel;
    }
    
}