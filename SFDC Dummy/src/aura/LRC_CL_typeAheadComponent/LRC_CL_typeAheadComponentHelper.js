({
    /**
     * Perform the SObject search via an Apex Controller
     */
    doSearch : function(cmp) {
        // Get the search string, input element and the selection container
        var searchString = cmp.get('v.searchString');
        var searchField = cmp.get('v.searchField');
        var inputElement = cmp.find('lookup');
        var lookupList = cmp.find('lookuplist');
        var DisplayField = cmp.get('v.DisplayField');
 
        // Clear any errors and destroy the old lookup items container
        inputElement.set('v.errors', null);
         
        // We need at least 2 characters for an effective search
        if (typeof searchString === 'undefined' || searchString.length < 2)
        {
            // Hide the lookuplist
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
        action.setParams({ "searchString" : searchString, "sObjectAPIName" : sObjectAPIName, "searchField" : searchField,"DisplayField" :DisplayField});
                           
        // Define the callback
        action.setCallback(this, function(response) {
            var state = response.getState();
 
            // Callback succeeded
            if (cmp.isValid() && state === "SUCCESS")
            {
                // Get the search matches
                var matches = response.getReturnValue();
 
                // If we have no matches, return nothing
                if (matches.length == 0)
                {
                    cmp.set('v.matches', null);
                    return;
                }
                 
                // Store the results
                cmp.set('v.matches', matches);
            }
            else if (state === "ERROR") // Handle any error by reporting it
            {
                var errors = response.getError();
                 
                if (errors) 
                {
                    if (errors[0] && errors[0].message) 
                    {
                        this.displayToast('Error', errors[0].message);
                    }
                }
                else
                {
                    this.displayToast('Error', 'Unknown error.');
                }
            }
        });
         
        // Enqueue the action                  
        $A.enqueueAction(action);                
    },
 
    /**
     * Handle the Selection of an Item
     */
    handleSelection : function(cmp, event) {
        // Resolve the Object Id from the events Element Id (this will be the <a> tag)
        var objectId = this.resolveId(event.currentTarget.id);
 
        // The Object label is the inner text)
        var objectLabel = event.currentTarget.innerText;
 		//alert('________ objectLabel ______________'+objectLabel);
        // Log the Object Id and Label to the console
        console.log('objectId=' + objectId);
        console.log('objectLabel=' + objectLabel);
                 
        // Create the UpdateLookupId event
        var updateEvent = cmp.getEvent("updateLookupIdEvent");
         
        // Populate the event with the selected Object Id
        updateEvent.setParams({
            "sObjectId" : objectId
        });
 
        // Fire the event
        updateEvent.fire();
 
        // Update the Searchstring with the Label
        cmp.set("v.searchString", objectLabel);
 
        // Hide the Lookup List
        var lookupList = cmp.find("lookuplist");
        $A.util.addClass(lookupList, 'slds-hide');

 
    },
    
    handlePopUpSelection: function(cmp, event){
    	// Update the Searchstring with the Label
        cmp.set("v.searchString", '');
 
        // Hide the Lookup List
        var lookupList = cmp.find("lookuplist");
        $A.util.addClass(lookupList, 'slds-hide');
	},
 
    /**
     * Resolve the Object Id from the Element Id by splitting the id at the _
     */
    resolveId : function(elmId)
    {
        var i = elmId.lastIndexOf('_');
        return elmId.substr(i+1);
    }
})