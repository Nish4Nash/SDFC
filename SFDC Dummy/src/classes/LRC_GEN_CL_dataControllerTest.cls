/********************************************************************************************
 * NAME         :  LRC_GEN_CL_dataControllerTest
 * DESCRIPTION:  Test class for LRC_GEN_CL_dataController.
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
public with sharing class LRC_GEN_CL_dataControllerTest {
    public static Id sObjectRecId;
    
    @TestSetup static void setupLookupAccount() {
        Account acc = new Account(Name = 'ABCTest');
        insert acc;
        
        sObjectRecId = acc.Id;
    }
     
    @IsTest
    public static void testLRC_CL_dataController() {
        //Calling method with query fields Name,ShippingCity,ShippingState     
        List<String> lookupListCol = new List<String>{'Phone', 'Type', 'ShippingCity', 'ShippingState'};
        List<String> lookupSearch = new List<String>{'Name'};
        LRC_GEN_CL_dataController.getSObjectData('Account', 'Test',lookupListCol,lookupSearch);      
        
        LRC_GEN_CL_dataController.getFieldLabel('Account',lookupListCol);          
           
    }    
}