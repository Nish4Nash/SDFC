/***********************************************************************************
* Class: LRC_RL_DataGridViewController
* CreatedBy: Nishit Kedia:
* Description: This is the controller class to process data for dataGrid
* Revision History: 
***********************************************************************************/
public class LRC_RL_DataGridViewController {

    @AuraEnabled
    public static String getAllChildRecords(Id recordId, String inputChildMetadata, String inputPageSize) {
        
		DataGridWrapper objWrapper = new DataGridWrapper();
        try {
            if(String.isNotBlank(inputChildMetadata) && recordId != null){
				//Get the Name of the Metadata
                List<LRC_RL_Parent_Mapping__mdt> lstMetadataNameSelected = [select Id,
																					DeveloperName,
																					Child_Api__c,
																					Lookup_Field_Api__c 
																					from LRC_RL_Parent_Mapping__mdt 
																					where 
																					DeveloperName = :inputChildMetadata];
				if(lstMetadataNameSelected != null && !lstMetadataNameSelected.isEmpty()){
					//Fetch Child details
					LRC_RL_Parent_Mapping__mdt objChildMetadata = lstMetadataNameSelected.get(0);
					String ChildObjectApiName = objChildMetadata.Child_Api__c;
					String childLookupFieldName = objChildMetadata.Lookup_Field_Api__c;
					//Fetch Column Details;
					List<LRC_RL_Child_Mapping__mdt> lstChildColumns = 	[Select Id,
																				Field_Name__c,
																				Display_Order__c
																				from 
																				LRC_RL_Child_Mapping__mdt
																				where
																				Parent_Mapping_Name__c = :objChildMetadata.Id
																				order by Display_Order__c asc];
					
					Set<String> setChildColumns = new Set<String>();
					String buildColumnsField ='';					
					if(lstChildColumns != null && !lstChildColumns.isEmpty()){
						for(LRC_RL_Child_Mapping__mdt objChildConfig : lstChildColumns){
							if(String.isNotBlank(objChildConfig.Field_Name__c)){
								setChildColumns.add(objChildConfig.Field_Name__c);                                   
							}
						}
						setChildColumns.add('Name');						
					}
					
					if(String.isNotBlank(ChildObjectApiName) && String.isNotBlank(childLookupFieldName)){
						objWrapper.columnFieldsMap = getFieldLabel(ChildObjectApiName,setChildColumns);
						objWrapper.columnDataList = getSObjectData(ChildObjectApiName,recordId,setChildColumns,childLookupFieldName);
						
					}
					
				}																	
            }              
        }catch(Exception objException){
            System.debug('Exception occured because of -->' + objException.getMessage() + ' @ Line Number-->' + objException.getLineNumber());
        }
        System.debug('Log is-->'+objWrapper);
        return JSON.serialize(objWrapper);
    }
	
	/* @Name: 			getSObjectData 
     * @Description:	Load Data with the records from the search text
     * @params : 		object Api Name,Text to search,Columns To Display,fields to be searched Upon
     * @return : 		Wrapper in String format : Search results
    */	
    public static List<sObject> getSObjectData(string sobjectAPIName,string searchValue, Set<String> setLookUpColumns,String searchFieldName) {
        list<String> lstLookUpColumns=new List <String>(setLookUpColumns);
        System.debug('The search text-->'+searchValue);     
        String sFieldApiComma ='';
        sFieldApiComma= String.join(lstLookUpColumns,',');
		String sSearchCondition = searchFieldName +' = \'' + searchValue + '\'';	
		String finalQuery= 'Select Id,'+sFieldApiComma+' from '+sobjectAPIName+' Where '+ sSearchCondition +' Order by Name ASC LIMIT 200';
        System.debug('The search query when lookup Icon Clicked-->'+finalQuery);
        List<Sobject> sobjectList = Database.query(finalQuery);
        return sobjectList;
    }
    
    /* @Name: 			getFieldLabel 
     * @Description:	To map the field labels of the lookup columns to show
     * @params : 		object Api Name,Columns To Display: Api Name,
     * @return : 		Wrapper in String format : Field Label mapping
    */
    public static Map<string,string> getFieldLabel(string sobjectAPIName,Set<String> setLookUpColumns) {
        Map<string,string> MapFieldAPIVSFieldLabel=new Map<string,string>();
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(sobjectAPIName);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
        System.debug('The field map-->'+fieldMap);
       	for(String sFieldApi : setLookUpColumns){
       		if(sFieldApi.contains('.')){
                String sLookupRelationName = sFieldApi.substringBefore('.');
                String sLookupRelationField = sFieldApi.substringAfter('.');
                if(sLookupRelationName.contains('__r')){                   
                   	sLookupRelationName=sLookupRelationName.replace('__r','__c');
                    Schema.DescribeFieldResult f = fieldMap.get(sLookupRelationName).getDescribe();
                    for(Schema.SObjectType reference : f.getReferenceTo()) {
                        System.debug('Lookup reference object name: ' + reference.getDescribe().getName());
                        sLookupRelationName = reference.getDescribe().getName();
                    }
       			}
                MapFieldAPIVSFieldLabel.put(sFieldApi,schemaMap.get(sLookupRelationName).getDescribe().fields.getMap().get(sLookupRelationField).getDescribe().getLabel());      			
       		}else{
       			MapFieldAPIVSFieldLabel.put(sFieldApi,fieldMap.get(sFieldApi).getDescribe().getLabel());
       		}
       	}
        return MapFieldAPIVSFieldLabel;
    }
	
	
	public class DataGridWrapper{
        public Map<string,string> columnFieldsMap;
        public List<sObject> columnDataList;
		
		public DataGridWrapper(){
			columnFieldsMap = new Map<string,string>();
			columnDataList = new List<sObject>();
		}
    }

}