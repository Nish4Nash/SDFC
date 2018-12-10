/***********************************************************************************
* Class: LRC_CL_result
* CreatedBy: Ajay Agnihotri (Re-Used Existing Component)
* Description: Inner class to wrap up an SObject Label and its Id used in TypeAheadComponent
* Revision History
***********************************************************************************/
public class LRC_CL_result{
    @AuraEnabled public String SObjectLabel {get; set;}
    @AuraEnabled public Id SObjectId {get; set;}
     
    public LRC_CL_result(String sObjectLabel, Id sObjectId){
        this.SObjectLabel = sObjectLabel;
        this.SObjectId = sObjectId;
    }
}