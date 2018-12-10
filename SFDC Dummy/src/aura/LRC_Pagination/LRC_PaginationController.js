({ 
    //controller methods written by K.R.Srivatsan for pagination functionalities
    //intialization of the pagination component
    doInit : function(component, event, helper) {
        helper.init(component); 
    },
    //event below used when search filter is used in UI
    refreshPagination : function(component, event, helper) {
	   helper.refreshPagination(component);
    },
    
    //go to the specified page number
    showRecordSet:function(component, event, helper) {
     helper.displayRecordSetNumberClick(component,event);
    },
    showRecordSetonarrowClick:function(component, event, helper) {
     helper.displayRecordSetonarraymovement(component,event);
    },
    //method used when server side pagination will be used
    getpreviousServerRecords:function(component, event, helper) {
        helper.displayServerRecordSet(component,event,"moveBackward");
    },
    getnextServerRecords:function(component, event, helper) {
        helper.displayServerRecordSet(component,event,"moveNext");
    },    
    //method created for event handler when a record is added/removed from pagelist
    handleRecordUpdates:function(component, event, helper) {
        helper.handleRecordUpdates(component,event);
       
    },
    //method to get records from server and handle the next set of records.
    handleserverRecordUpdates:function(component, event, helper) {
     helper.handleserverRecordUpdates(component,event);
    }
})