({
	doInit : function(component, event, helper) {
        
        helper.doInit(component,event);
		
	},
    sortColumn:function(component, event, helper){
        var sortOrder=component.get("v.isAsc") == true ? 'asc' : 'desc';
        var columnSort=(event.currentTarget).dataset.sorting;
        if(JSON.parse(columnSort)){
        helper.sortColumn(component,event,sortOrder);
        }
    },
    sortMobileTiles:function(component,event,helper){
        var sortOrder=(event.currentTarget).dataset.sortorder;
        helper.sortColumn(component,event,sortOrder);
    },
    sortPopup:function(component,event,helper){
        helper.sortPopup(component,event,helper);
    },
    closeModal:function(component,event,helper){
        helper.closeModal(component,event,helper);
    }
})