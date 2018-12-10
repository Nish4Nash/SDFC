/********************************************************************************************
 * NAME         : LRC_GEN_CL_typeAheadControllerTest
 * DESCRIPTION:  Test class for LRC_GEN_CL_typeAheadController.
 *
 * @AUTHOR Prasanjeet Sharma
 * @DATE 10/24/2017
 *
 *
 * MODIFICATION LOG:
 * DEVELOPER                         DATE                               DESCRIPTION
 * ================================================================================ 
 *
********************************************************************************************/
@IsTest 
public with sharing class LRC_GEN_CL_typeAheadControllerTest {
     
     @TestSetup static void setupLookupAccount() {
         Account acc = new Account(Name = 'ABCTest');
         insert acc;
     }
     
     @IsTest
     public static void testLRC_GEN_CL_typeAheadController() {
        Id accId = [Select Id from Account].Id;
        LRC_GEN_CL_typeAheadController.fetchRecord(accId,'Account');
        //Calling method with query fields Name,ShippingCity,ShippingState
        LRC_GEN_CL_typeAheadController.lookup('test', 'Account', 'Name,ShippingCity,ShippingState', 'Name');
        
        //Calling method with display field 'Name'
        LRC_GEN_CL_typeAheadController.lookup('A', 'Account', 'Name', 'ShippingCity');
        
        //Calling method with display default fields
        LRC_GEN_CL_typeAheadController.lookup('A', 'Account', 'Name', NULL);
        
        //Calling method with no search field, will use SOSL to search
        LRC_GEN_CL_typeAheadController.lookup('Tes', 'Account', NULL, 'Name');                           
    }    
}