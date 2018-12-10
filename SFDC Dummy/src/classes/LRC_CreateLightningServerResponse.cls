/**
 * Class Name    : LRC_CreateLightningServerResponse
 * Owner         : Srivatsan
 * Created Date  : 10/31/2017
 * Description   : Wrapper class created to send response information requested by any lightning component to client

 **/
 
public with sharing class LRC_CreateLightningServerResponse {
    @AuraEnabled public Boolean isSuccessful {get; private set;}
    @AuraEnabled public String successMessage { get; private set;}
    @AuraEnabled public String errorMessage { get; private set;}
    @AuraEnabled public List<String> errorFieldApiNames { get; private set;}
    @AuraEnabled public map<String, Object> mapErrorInfo { get; private set; }
    @AuraEnabled public map<String, Object> objectData { get; private set; }
    public LRC_CreateLightningServerResponse(Boolean isSuccessful, String message, List<String> errorFieldApiNames,map<String, Object> objectData) {
        this.isSuccessful = isSuccessful;
        if(isSuccessful)this.successMessage = message;
        else this.errorMessage = message;
        this.errorFieldApiNames = errorFieldApiNames;
        this.objectData = objectData;
    }
    //Overloading constructor with different input parameters
    public LRC_CreateLightningServerResponse(Boolean isSuccessful,String message,map<String, Object> objectData) {
        this.isSuccessful = isSuccessful;
        if(isSuccessful)this.successMessage = message;
        this.objectData = objectData;
    }
    
        /* Use this contructor if error handling is implemented */
    public LRC_CreateLightningServerResponse(Boolean isSuccessful, map<String, Object> mapErrorInfo, map<String, Object> objectData) {
        this.isSuccessful = isSuccessful;
        this.mapErrorInfo = mapErrorInfo;
        this.objectData = objectData;
    }
       
    public LRC_CreateLightningServerResponse() {
        this.isSuccessful = isSuccessful;
    }
}