public with sharing class LRCServerSidePaginationController {
    public static final LRCPaginationSettings__c clientsidePagination = LRCPaginationSettings__c.getValues('ClientSidePagination');
    public static final LRCPaginationSettings__c serversidePagination = LRCPaginationSettings__c.getValues('ServerSidePagination');
    
	@AuraEnabled
    public static LRC_CreateLightningServerResponse fetchRecordsForServerSidePagination(Integer iOffSet) {
        Integer iLimit = Integer.ValueOf(serversidePagination.TotalSize__c);
        
        Map<String, Object>mapStrObjs = new Map<String, Object>();
        Map<String, Object>mapErrorInfo = new Map<String, Object>{};
        Boolean bSuccessful = true;
        List<PaginationData__c>lstPaginationData = new List<PaginationData__c>();
        String sQuery;
          sQuery = 'Select Id, First_Name__c,LastName__c, EmpId__c,PhoneNumber__c from PaginationData__c';
          
         sQuery = (iOffSet!=null) ? sQuery + ' Limit ' + iLimit + ' Offset ' + iOffSet : sQuery + ' Limit ' + iLimit + ' Offset 0';  
        lstPaginationData = Database.query(sQuery);
		mapStrObjs.put('lstPaginationData',lstPaginationData); 
		//mapStrObjs.put('lstPaginationData',null); 
         mapStrObjs.put('serversidePagination', serversidePagination);
       	return new LRC_CreateLightningServerResponse(bSuccessful, mapErrorInfo, mapStrObjs);
    
    }
    
     @AuraEnabled
    public static LRC_CreateLightningServerResponse fetchRecordsForClientSidePagination() {
    Integer iLimit = Integer.ValueOf(clientsidePagination.TotalSize__c);
        Map<String, Object>mapStrObjs = new Map<String, Object>();
        Map<String, Object>mapErrorInfo = new Map<String, Object>{};
        Boolean bSuccessful = true;
        
        List<PaginationData__c>lstPaginationData = new List<PaginationData__c>();
        String sQuery;
          sQuery = 'Select Id, First_Name__c,LastName__c, EmpId__c,PhoneNumber__c from PaginationData__c';
          
         sQuery = sQuery + ' Limit ' + iLimit + ' Offset 0';  
        lstPaginationData = Database.query(sQuery);
		mapStrObjs.put('lstPaginationData',lstPaginationData); 
		//mapStrObjs.put('lstPaginationData',null); 
         mapStrObjs.put('clientsidePagination', clientsidePagination);
        
        
         return new LRC_CreateLightningServerResponse(bSuccessful, mapErrorInfo, mapStrObjs);
        
    }
    
    @AuraEnabled
    public static LRC_CreateLightningServerResponse getPaginationSettingsFromServer(String sFunctionality)    {
        Boolean bSuccess = true;
        Map<String, Object> mapErrorInfo = new Map<String, Object>{};
        Map<String, Object> mapResponse = new Map<String, Object>{};
        try
        {
            LRCPaginationSettings__c paginationSettings = LRCPaginationSettings__c.getValues(sFunctionality);
            mapResponse.put('Pagination Settings', paginationSettings);
        }   
        catch(Exception e)  {
            bSuccess = false;
           
        }
        return new LRC_CreateLightningServerResponse(bSuccess, mapErrorInfo, mapResponse);
    }

}