({
    doInit : function(component, event, helper) {
        var SearchTxt=component.get("v.dataGridSearchText");
        //Fetch the expense list from the Apex controller 
        if(SearchTxt!=null && SearchTxt!='')  
        	helper.getsObjectList(component, SearchTxt);
        else
            helper.getsObjectList(component, '');
    },
    CancelPopup: function(component, event, helper){
        document.getElementById('lookUpPopupDiv').style.display='none'; 
        component.set("v.dataGridSearchText", '');
        var updateLookUpEvent = $A.get("e.lightning_aura:LRC_updateLookupName");
        updateLookUpEvent.setParams({ "sObjectId":"", "sObjectName": "" }).fire();
    },
    handlePaginateEvent: function(component, event, helper) {
        helper.setPage(component, event);
    },
    handleSearchEvent: function(component, event, helper) {
       
        helper.getsObjectList(component, event.getParam('text'));
    },
    selectedsObject: function(component, event, helper){
        var selectedRecStr=event.target.getAttribute("data-data");
        var selectedRecArr = selectedRecStr.split('_',2); // this splits the string into two halfs
        var selectedRecId=selectedRecArr[0];
        var selectedRecName=selectedRecArr[1];
        
        var divPopUpById=document.getElementById('lookUpPopupDiv'); 
        divPopUpById.style.display='none';
        // Fire Event to Pass selected sObject Name and Id
        var updateLookUpEvent = $A.get("e.lightning_aura:LRC_updateLookupName");
        updateLookUpEvent.setParams({ "sObjectId":selectedRecId, "sObjectName": selectedRecName }).fire();
    }
})