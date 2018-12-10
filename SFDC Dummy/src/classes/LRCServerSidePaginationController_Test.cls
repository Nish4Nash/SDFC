/*********************************************************************************************************
* NAME         :  LRCServerSidePaginationController_Test
* DESCRIPTION  :  Test Class for LRCServerSidePaginationController 
*
* 
************************************************************************************************************/

@isTest
public with sharing class LRCServerSidePaginationController_Test{


@isTest
 public static void TestPagination(){
    Test.loadData(LRCPaginationSettings__c.sObjectType, 'LRCPaginationTestData');
    Test.startTest();
    LRC_CreateLightningServerResponse oRes = LRCServerSidePaginationController.fetchRecordsForClientSidePagination();
     LRC_CreateLightningServerResponse oRes1 = LRCServerSidePaginationController.fetchRecordsForServerSidePagination(1);
     LRC_CreateLightningServerResponse oRes2 = LRCServerSidePaginationController.getPaginationSettingsFromServer('ClientSidePagination');
     system.assert(true, oRes2.isSuccessful);
    Test.stopTest();
    }
    
    
    

}