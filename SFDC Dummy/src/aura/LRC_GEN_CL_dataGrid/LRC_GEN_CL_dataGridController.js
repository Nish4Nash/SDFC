({
     /*
     * 	@Method: doInit
     *	@param: component,event and helper
     *	@Desc: To initialize the component with the Search text Data
     */
    doInit : function(component, event, helper) {
        var SearchText=component.get("v.dataGridSearchText");       
        component.set("v.lstRecords",[]);
        if(SearchText !== null && SearchText !== '')  
        	helper.getsObjectList(component, SearchText);
        else
            helper.getsObjectList(component, '');
    },
    
    /*
     * 	@Method: CancelPopup
     *	@param: component,event and helper
     *	@Desc: To Close the Pop-Up
    */
    CancelPopup: function(component, event, helper){
        component.set("v.bShowPopupComponent",false); 
        component.set("v.dataGridSearchText", '');
        component.set("v.lstRecords",[]);
    },
    
    /*
     * 	@Method: handlePaginateEvent
     *	@param:  component,event and helper
     *	@Desc: 	 fired when pagination buttons is clicked
    */
    handlePaginateEvent: function(component, event, helper) {
        helper.setPage(component, event);
    },
    
    /*
     * 	@Method: handleSearchEvent
     *	@param:  component,event and helper
     *	@Desc: 	 fired when search Text Box is Clicked.
    */
    handleSearchEvent: function(component, event, helper) {
    	var searchTextChildCmp = component.find('searchComponent');    	
        helper.getsObjectList(component, searchTextChildCmp.get("v.searchText"));
    },
    
    /*
     * 	@Method: selectedsObject
     *	@param:  component,event and helper
     *	@Desc: 	 fired when Record is Selected from Data Grid
    */
    selectedsObject: function(component, event, helper){
        var selectedRow =event.getParam('selectedRows');
        var selectedRecId=selectedRow[0].Id;
        var selectedRecName=selectedRow[0].Name;       
        component.set("v.bShowPopupComponent",false);        
        component.set("v.sObjectName",selectedRecName);
        component.set("v.sObjectId",selectedRecId);
        //To update the record with the Selected Record Name in the Parent Component.
        var setParentRecordAction = component.get("v.updateLookupMethod");
        $A.enqueueAction(setParentRecordAction);
    }
})