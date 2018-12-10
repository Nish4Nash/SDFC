/********************************************************************************************************************
 * NAME        : LRC_CreateLightningServerResponse_Test
 * DESCRIPTION : This is the test class for LRC_CreateLightningServerResponse
 *
 * @AUTHOR : K.R.Srivatsan
 * @DATE : 03/09/2017
 *
 * MODIFICATION LOG:
 * DEVELOPER                   DATE                             DESCRIPTION
 * ------------------------------------------------------------------------------------------------------------------               
 * Srivatsan               03/09/2017                       Initial creation
********************************************************************************************************************/
@istest(SeeAllData=false)
public with sharing class LRC_CreateLightningServerResponse_Test {
    private static testmethod void checkContructorMethods1() {
        Test.startTest();
        Boolean transSuccess = true;
        String  errorMessage = 'Hello this is a test version';
    map<String, Object> testObjdata = new map<String, Object>();
        testObjdata.put('TestData', 'DatatoClient');
       LRC_CreateLightningServerResponse tesTing = new LRC_CreateLightningServerResponse(transSuccess,errorMessage,testObjdata);
      system.assert(true, testing.isSuccessful);
         Test.stopTest();
    }
    private static testmethod void checkContructorMethods2() {
         Test.startTest();
        Boolean transSuccess = false;
        String  errorMessage = 'Hello this is a test version';
    map<String, Object> testObjdata = new map<String, Object>();
        testObjdata.put('TestData', 'DatatoClient');
        List<String> errorFields = new List<String>();
       LRC_CreateLightningServerResponse tesTing = new LRC_CreateLightningServerResponse(transSuccess,errorMessage,errorFields,testObjdata);
           system.assert(true, testing.isSuccessful);
       Test.stopTest();  
      }
}