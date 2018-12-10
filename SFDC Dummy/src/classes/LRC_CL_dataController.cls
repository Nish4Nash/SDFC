/***********************************************************************************
* Class: LRC_CL_dataController
* CreatedBy: Ajay Agnihotri
* Description: This is the controller class to process data for dataGrid
* Revision History
***********************************************************************************/
public class LRC_CL_dataController {
    @AuraEnabled
    public static List<Product2> getProducts(String search) {
        search += '%';
        return [SELECT Id, Name, ProductCode, Family, Description FROM Product2 WHERE Name LIKE :search ORDER BY Name ASC];
    }
    
    @AuraEnabled
    public static LRC_CL_dataGridWrapper[] getSObjectData(string sobjectAPIName, string fieldAPI1, string fieldAPI2, string fieldAPI3, string fieldAPI4, string search) {
        list<LRC_CL_dataGridWrapper> dataGridWrap=new List <LRC_CL_dataGridWrapper>();
        search += '%';
        search=String.escapeSingleQuotes(search);
        //SELECT Id,Name,IsActive,ProductCode,Family FROM Product2
        string finalQuery='select id,Name,'+fieldAPI1+','+fieldAPI2+','+fieldAPI3 +','+fieldAPI4 +' from '+sobjectAPIName+' WHERE Name LIKE :search ORDER BY Name ASC';
        system.debug(search+'__________ finalQuery _________'+finalQuery);
        for(sObject sObjectRec: database.query(finalQuery)){
            LRC_CL_dataGridWrapper dataGridwapIns=new LRC_CL_dataGridWrapper();
            dataGridwapIns.sObjectRecId = (Id)sObjectRec.get('Id');
            dataGridwapIns.sObjectName = String.valueOf(sObjectRec.get('Name'));
            dataGridwapIns.sObjectColumn1 = String.valueOf(sObjectRec.get(fieldAPI1));
            dataGridwapIns.sObjectColumn2 = String.valueOf(sObjectRec.get(fieldAPI2));
            dataGridwapIns.sObjectColumn3 = String.valueOf(sObjectRec.get(fieldAPI3));
            dataGridwapIns.sObjectColumn4 = String.valueOf(sObjectRec.get(fieldAPI4));
            dataGridWrap.add(dataGridwapIns);
        }
        system.debug(search+'__________ dataGridWrap _________'+ dataGridWrap);
        return dataGridWrap;
    }
    
    @AuraEnabled
    public static Map<string,string> getFieldLabel(string sobjectAPIName, string fieldAPI1, string fieldAPI2, string fieldAPI3,string fieldAPI4) {
        Map<string,string> MapFieldAPIVSFieldLabel=new Map<string,string>();
        
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get(sobjectAPIName);
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
       
        MapFieldAPIVSFieldLabel.put(fieldAPI1,fieldMap.get(fieldAPI1).getDescribe().getLabel());
        MapFieldAPIVSFieldLabel.put(fieldAPI2,fieldMap.get(fieldAPI2).getDescribe().getLabel());
        MapFieldAPIVSFieldLabel.put(fieldAPI3,fieldMap.get(fieldAPI3).getDescribe().getLabel());
        MapFieldAPIVSFieldLabel.put(fieldAPI4,fieldMap.get(fieldAPI4).getDescribe().getLabel());  
        system.debug(MapFieldAPIVSFieldLabel+'__________ getFieldLabel_________'+ fieldAPI1);
        
        return MapFieldAPIVSFieldLabel;
    }
    
}