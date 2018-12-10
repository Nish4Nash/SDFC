/********************************************************************************************
 * NAME         :  LRC_CL_typeAheadControllerTest
 * DESCRIPTION:  Test class for LRC_CL_typeAheadController.
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
public with sharing class LRC_CL_typeAheadControllerTest {
     @TestSetup static void setupLookupAccount() {
         Account acc = new Account(Name = 'ABC');
         insert acc;
     }
     
     @IsTest
     public static void testLRC_CL_typeAheadController() {
        //Calling method with query fields Name,ShippingCity,ShippingState
        LRC_CL_typeAheadController.lookup('A', 'Account', 'Name,ShippingCity,ShippingState', 'Name');
        
        //Calling method with display field 'Name'
        LRC_CL_typeAheadController.lookup('A', 'Account', 'Name', 'ShippingCity');
        
        //Calling method with display default fields
        LRC_CL_typeAheadController.lookup('A', 'Account', 'Name', NULL);
        
        //Calling method with no search field, will use SOSL to search
        LRC_CL_typeAheadController.lookup('A', 'Account', NULL, 'Name');                           
    }    
}