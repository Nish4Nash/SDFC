({
    
    doInit : function(component, event, helper) {
        
        helper.doInit(component,event);
		
	},
    /*
     * 	@Method: openOptionMenu
     *	@param: component,event,helper
     *	@Desc:	Display the Option Menu for the Records
     */
    
	openOptionMenu: function (component, event, helper) {
        helper.showOptions(component, event);
    },
    
    /*
     * 	@Method: recordSelection
     *	@param: component,event,helper
     *	@Desc:	Display the Option Menu for the Records
     */
    recordSelection: function (component, event, helper) {
     	var selectedTile = component.get("v.itemJSON");
        component.set("v.selectedTile",selectedTile);
        var parentMethodName = component.get("v.tileSelection");
        //fire event from child and capture in parent:
        $A.enqueueAction(parentMethodName);
    }
})