({
    
    doInit : function(component, helper) {
        
        
        var tableList = component.get("v.detailFieldList");
        var tableHeader = component.get("v.mapHeaders");
		var searchMap = [];
            for(var keyVal in tableHeader){
                searchMap.push({label:tableHeader[keyVal], fieldName:tableList[keyVal]});
                }	                   
	         
		component.set("v.tileRecordList",searchMap);
	},
    /*
     * 	@Method: showOptions
     *	@param: component,event
     *	@Desc:	Open the Option Menu passed as Facet to the Conponent
     */   
	showOptions : function(component,event) {       		 
        this.closePopupOption(component,event);
        //Option Pop up Component
        var optionPopUpToOpen = component.find("closeOptns");
      	//Set the Component
        component.set('v.openItem', optionPopUpToOpen);
        //Open popup
        $A.util.toggleClass(optionPopUpToOpen, 'slds-is-open');
        //Stop Event propogation if Renderer is defined
        event.stopPropagation();
	},
    
    /*
     * 	@Method: closePopupOption
     *	@param: component,event
     *	@Desc:	Close any Existing pop-Ups on DOM
     */
    closePopupOption : function(component,event) {
        var isAnyOptionOpenOpen = component.get('v.openItem');      
        //If any Pop-Ups are Open this caluse closes it.
        if (!$A.util.isEmpty(isAnyOptionOpenOpen)) {
             $A.util.removeClass(isAnyOptionOpenOpen, 'slds-is-open'); 
        }  
    },
    
})