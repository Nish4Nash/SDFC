/***********************************************************************************
* Class: LRC_CL_dataGridWrapper
* CreatedBy: Ajay Agnihotri
* Description: Inner class to wrap up an SObject in dataGrid
* Revision History

***********************************************************************************/
public class LRC_CL_dataGridWrapper{
    @AuraEnabled public Id sObjectRecId {get; set;}
    @AuraEnabled public string sObjectName {get; set;}
    @AuraEnabled public string sObjectColumn1 {get; set;}
    @AuraEnabled public string sObjectColumn2 {get; set;}
    @AuraEnabled public string sObjectColumn3 {get; set;}
    @AuraEnabled public string sObjectColumn4 {get; set;}
    public LRC_CL_dataGridWrapper(){
    }
     
    public LRC_CL_dataGridWrapper(Id sObjectRecId ,string sObjectName ,string sObjectColumn1 ,string sObjectColumn2 ,string sObjectColumn3,string sObjectColumn4 )
    {
        this.sObjectRecId = sObjectRecId ;
        this.sObjectName = sObjectName ;
        this.sObjectColumn1 = sObjectColumn1 ;
        this.sObjectColumn2 = sObjectColumn2 ;
        this.sObjectColumn3 = sObjectColumn3 ;
        this.sObjectColumn4 = sObjectColumn4 ;
    }
}