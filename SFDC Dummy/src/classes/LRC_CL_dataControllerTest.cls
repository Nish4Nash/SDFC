/********************************************************************************************
 * NAME         :  LRC_CL_dataControllerTest
 * DESCRIPTION:  Test class for LRC_CL_dataController.
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
public with sharing class LRC_CL_dataControllerTest {
    public static Id sObjectRecId;
    
    @TestSetup static void setupLookupAccount() {
        Account acc = new Account(Name = 'ABC');
        insert acc;
        
        sObjectRecId = acc.Id;
    }
     
    @IsTest
    public static void testLRC_CL_dataController() {
        //Calling method with query fields Name,ShippingCity,ShippingState
        LRC_CL_dataController.getProducts('A');       
        
        LRC_CL_dataController.getSObjectData('Account', 'Phone', 'Type', 'ShippingCity', 'ShippingState', 'A');      
        
        LRC_CL_dataController.getFieldLabel('Account', 'Phone', 'Type', 'ShippingCity', 'ShippingState');          
        
        LRC_CL_dataGridWrapper cntrl = new LRC_CL_dataGridWrapper(sObjectRecId, 'Account', 'Phone', 'Type', 'ShippingCity', 'ShippingState');    
    }    
}