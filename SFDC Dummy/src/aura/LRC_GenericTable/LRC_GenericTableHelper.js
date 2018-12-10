({
	doInit : function(component, helper) {
        
        
        var tableList = component.get("v.tbody");
        var tableHeader = component.get("v.thead");
        
		
	},
    sortColumn: function(component,event,sortOrder){
        //var sortOrder=component.get("v.isAsc") == true ? 'asc' : 'desc';
        var columnName=(event.currentTarget).dataset.columnname;
        var columnLabel=(event.currentTarget).dataset.columnlabel;
        component.set("v.colLabel",columnLabel);
        component.set("v.isAsc",!component.get("v.isAsc"));
        component.set("v.isAscMobile",sortOrder);
        var actionEvent = component.getEvent("headerAction");
        actionEvent.setParams({ 
            sortOrder:sortOrder,
            colField:columnName,
            colLabel:columnLabel
         });
        //actionEvent.fire();
        
		var sortedArray = sortByKey(component.get("v.tbody"),columnName,sortOrder);
        function sortByKey(array, key) {
        return array.sort(function(a, b) {
            var x = a[key]; var y = b[key];
            if(sortOrder == 'asc'){
             	return ((x < y) ? -1 : ((x > y) ? 1 : 0));
            }else if(sortOrder == 'desc'){
                 return ((x < y) ? ((x > y) ? 0 : 1) : -1) ;
            }   
        });
        }
       component.set("v.tbody",sortedArray);
       component.set("v.sortPopup",false); 
    },
    sortPopup : function(component,event,helper) {
		component.set("v.sortPopup",true);
	},
    closeModal:function(component,event,helper){
        component.set("v.sortPopup",false);
    }
})