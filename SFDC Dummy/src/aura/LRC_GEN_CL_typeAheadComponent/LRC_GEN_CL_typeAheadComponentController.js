({
    /*
	* 	@Method: doInit
	*	@param: component,event and helper
	*	@Desc: Called On Initial load and checks whether to prepopulate the Lookup Field With Id.
	*/
    doInit : function(cmp, event, helper) {
        var isLookupIdSet = cmp.get("v.sLookupSelectedId");
        if(!$A.util.isEmpty(isLookupIdSet)){
        	helper.fetchAndSetData(cmp,event);      	
        }       
    },
    
    /*
	* 	@Method: search
	*	@param: component,event and helper
	*	@Desc: Method Invoked when a Search String is Entered by user in Input Box.
	*/
    search : function(cmp, event, helper) {
        helper.doSearch(cmp,event);        
    },
    
    /*
	* 	@Method: search
	*	@param: component,event and helper
	*	@Desc: Select the Record  from the TypeAhead Search list
	*/
    selectRecordFromList: function(cmp, event, helper) {
        helper.handleSelection(cmp, event);
    },
    
    /*
	* 	@Method: OpenLookupPopUp
	*	@param: component,event and helper
	*	@Desc: Open the Extended Search Data Grid.
	*/
    OpenLookupPopUp: function(cmp, event, helper) {
        //This helper is used to Hide the TypeAheadComponent and Open Data-Grid
        helper.handlePopUpSelection(cmp, event);
        
	},
    
    /*
	* 	@Method: updateLookupNameEventinTypeAhead
	*	@param: component,event and helper
	*	@Desc: To set the Record name and Id in Input Box when record is Selected from Data Grid.
	*/
    updateLookupNameEventinTypeAhead: function(cmp,event,helper){
        var updateLookupEventComponent = cmp.find('datagridComponent');
        cmp.set('v.searchString',updateLookupEventComponent.get("v.sObjectName"));
        cmp.set("v.sLookupSelectedId",updateLookupEventComponent.get("v.sObjectId"));
        helper.fireParentActionEvent(cmp,event);  
    },
    
    /*
	* 	@Method: cancelPopup
	*	@param: component,event and helper
	*	@Desc: To Close The Data Grid pop-up
	*/
     cancelPopup: function(component, event, helper){
        component.set("v.bShowPopupComponent",false); 
     }
})