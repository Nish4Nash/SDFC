({
	handleValueChange : function(component, event, helper) {
        var pages = [];
        var i = 0;
        var itemsPerPage = component.get('v.itemsPerPage');
        var totalItems = event.getParam("value");;
        do {
            pages.push(i);
            i += itemsPerPage;
        } while (i < totalItems);
        component.set('v.pages', pages);
	},
    paginate : function(component, event, helper) {
        var paginateEvent = component.getEvent('paginateEvent');
        paginateEvent.setParams({
            page: event.target.innerHTML
       	});
        paginateEvent.fire();
	}
})