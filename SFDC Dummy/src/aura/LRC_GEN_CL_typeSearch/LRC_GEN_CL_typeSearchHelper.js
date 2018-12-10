({
    /*
	* 	@Method: searchRecord_helper
	*	@param: component,event and helper
	*	@Desc: Invokation starting point for the Parent Method to search the Entered Text
	*/
	searchRecord_helper : function(component, event) {
        //set the child component value:
        component.set("v.searchText",event.target.value);
        //On enter press fire the Event
        if (event.which === 13||event.which === 1){
            //Extract Parent Method Name:
            var parentMethodName = component.get("v.parentMethodInChild");
            //fire event from child and capture in parent:
            $A.enqueueAction(parentMethodName);
     	}
	}
})