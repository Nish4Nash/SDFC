({
	search : function(component, event, helper) {
        /* 
        component.getEvent('searchEvent').setParams({
            text: event.target.value
        }).fire();
        */
        var searchTextEventInypeSearch = $A.get("e.c:LRC_CL_searchText");
        searchTextEventInypeSearch.setParams({
            text: event.target.value
        }).fire();
	}
})