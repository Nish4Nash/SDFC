({
    /*
     * 	@Method: fetchAndSetData
     *	@param: component,event 
     *	@Desc: CallHelper Method to Populate the Lookup Record Name with the pre-set Lookup Id.
     */
    fetchAndSetData: function(cmp, event) {

        // Create an Apex action
        var fetchAction = cmp.get('c.fetchRecord');
        // Set the Parameters:
        fetchAction.setParams({
            "sRecordId": cmp.get('v.sLookupSelectedId'),
            "sObjectAPIName": cmp.get('v.sObjectAPIName')
        });
        // Define the callback
        fetchAction.setCallback(this, function(response) {
            var state = response.getState();
            // Callback succeeded
            if (cmp.isValid() && state === "SUCCESS") {
                var objResponse = JSON.parse(response.getReturnValue());
                if (objResponse !== null) {
                    //Set the record Name in the Search String to Display as Default
                    cmp.set("v.searchString", objResponse.SObjectLabel);
                }
            } else if (state === "ERROR") { // Handle any error by reporting it
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        this.displayToast('Error', errors[0].message);
                    }
                } else {
                    this.displayToast('Error', 'Unknown error.');
                }
            }
        });
        // Enqueue the action To Execute.               
        $A.enqueueAction(fetchAction);
    },

    /*
     * 	@Method: doSearch
     *	@param: component,event 
     *	@Desc: Perform the SObject search via an Apex Controller
     */
    doSearch: function(cmp, event) {

        // Get the search string, input element and the selection container
        var searchString = cmp.get('v.searchString');
        var searchField = cmp.get('v.searchField');
        var inputElement = cmp.find('lookup');
        var lookupList = cmp.find('lookuplist');
        var DisplayField = cmp.get('v.DisplayField');
        // Clear any errors and destroy the old lookup items container
        inputElement.set('v.errors', null);
        // We need at least 2 characters for an effective search
        if (typeof searchString === 'undefined' || searchString.length < 2) {
            // Hide the lookuplist
            cmp.set("v.sLookupSelectedId", null);
            $A.util.addClass(lookupList, 'slds-hide');
            return;
        }
        // Show the lookuplist
        $A.util.removeClass(lookupList, 'slds-hide');
        // Get the API Name
        var sObjectAPIName = cmp.get('v.sObjectAPIName');
        // Create an Apex action
        var action = cmp.get('c.lookup');
        // Mark the action as abortable, this is to prevent multiple events from the keyup executing
        action.setAbortable();
        // Set the parameters
        action.setParams({
            "searchString": searchString,
            "sObjectAPIName": sObjectAPIName,
            "searchField": searchField,
            "DisplayField": DisplayField
        });
        // Define the callback
        action.setCallback(this, function(response) {
            var state = response.getState();
            // Callback succeeded
            if (cmp.isValid() && state === "SUCCESS") {
                // Get the search matches
                var matches = response.getReturnValue();
                // If we have no matches, return nothing
                if (matches.length === 0) {
                    cmp.set('v.matches', null);
                    return;
                }
                // Store the results
                cmp.set('v.matches', matches);
            } else if (state === "ERROR") { // Handle any error by reporting it            
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        this.displayToast('Error', errors[0].message);
                    }
                } else {
                    this.displayToast('Error', 'Unknown error.');
                }
            }
        });
        // Enqueue the action                  
        $A.enqueueAction(action);
    },

    /*
    * 	@Method: handleSelection
    *	@param: cmp,event 
    *	@Desc:	Handle the Selection of an Item,Updating Input textbox with Selected record Name,
    			Firing Parent Method and Hiding TypeAhead.
    */
    handleSelection: function(cmp, event) {
        // Resolve the Object Id from the events Element Id (this will be the <a> tag)
        var objectId = event.currentTarget.id;
        // The Object label is the inner text
        var objectLabel = event.currentTarget.innerText;
        cmp.set("v.sLookupSelectedId", objectId);
        // Update the Searchstring with the Label
        cmp.set("v.searchString", objectLabel);
        // Hide the Lookup List
        var lookupList = cmp.find("lookuplist");
        $A.util.addClass(lookupList, 'slds-hide');
        //To Fire Onchange Event of Lookup from Parent
        this.fireParentActionEvent(cmp, event);
    },
    
    /*
    * 	@Method: handlePopUpSelection
    *	@param: cmp,event 
    *	@Desc:	Open The Grid,Clearing Input textbox.    			
    */
    handlePopUpSelection: function(cmp, event) {
        
        // Hide the Lookup List
        var lookupList = cmp.find("lookuplist");
        $A.util.addClass(lookupList, 'slds-hide');
        // Assign the value of Type Ahead field to input text lookup in Search data Grid
        cmp.set("v.AppSearchText",cmp.get("v.searchString"));        
        // Clear the Search Field of lookup
        cmp.set("v.searchString", '');      
        //Open Grid :
        cmp.set("v.bShowPopupComponent",true);
    },

  	/*
    * 	@Method: fireParentActionEvent
    *	@param: cmp,event 
    *	@Desc:	Parent Action is Fired ,If a Method is passed in the Component for OnChange When a Record Is selected.    			
    */
    fireParentActionEvent: function(cmp, evt) {
        var parentActionMethod = cmp.get("v.onChangeAction");
        //fire event from child and capture in parent
        if (!$A.util.isEmpty(parentActionMethod)) {
            $A.enqueueAction(parentActionMethod);
        }
    },
    
   	/*
    * 	@Method: closeLookupMenu
    *	@param: cmp,event 
    *	@Desc:	To close looku dropdown when clicked outside in document.
    */
     closeLookupMenu : function(component, event) {
        console.log('called');
        var closedItem = component.find('lookuplist');
        $A.util.addClass(closedItem, 'slds-hide'); 
    }
})