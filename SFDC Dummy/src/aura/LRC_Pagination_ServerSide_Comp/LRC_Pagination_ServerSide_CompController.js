({
	doInit : function(component, event, helper) {
		helper.doInit(component, event);
	},
    handleChangePageRecordsEvent : function(component, event, helper) {
		helper.handleChangePageRecordsEvent(component, event);
	},
    //calls the helper function that enables to get the next set of data from pagination on click of next
    getnextDataSet: function (component, event, helper) { 
     helper.getDataSet(component,event);
    }
})