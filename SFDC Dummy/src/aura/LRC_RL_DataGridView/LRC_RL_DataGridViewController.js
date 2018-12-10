({
    doInit: function(component, event, helper) {
        //var main = component.find('main');
		//$A.util.removeClass(main, 'small');
		//$A.util.addClass(main, component.get("v.designHeight"));
		component.set('v.selectItem',[]);
        component.set('v.selectItem',[]);
        console.log('Buttons--->',component.get('v.optionbuttons'));
        //helper.getLocalList(component);
        helper.getsObjectList(component,event);
    },
    
     tileSelected: function (component, event, helper) {  
         console.log('clicked-->'+JSON.stringify(component.get("v.selectedTile")));
      },
    /*
     * 	@Method: handlePaginateEvent
     *	@param:  component,event and helper
     *	@Desc: 	 fired when pagination buttons is clicked
    */
    handlePaginateEvent: function(component, event, helper) {
        helper.closeDropdown(component, event);
        helper.setPage(component, event);
    },
})