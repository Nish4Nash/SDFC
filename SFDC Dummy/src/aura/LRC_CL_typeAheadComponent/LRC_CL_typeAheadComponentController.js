({
    /**
     * Search an SObject for a match
     */
    search : function(cmp, event, helper) {
        helper.doSearch(cmp);        
    },
 
    /**
     * Select an SObject from a list
     */
    select: function(cmp, event, helper) {
        //alert('Hi');
        var objectId = event.currentTarget.id;
       // alert('_____ objectId ______'+objectId);
        helper.handleSelection(cmp, event);
        var accLst=cmp.get('v.matches');
        for (var p in accLst) {
            if(objectId.indexOf(accLst[p].SObjectId) > -1){
                cmp.set('v.searchString',accLst[p].SObjectLabel);
            }
        }
    },
    OpenPopUp: function(cmp, event, helper) {
        //var divPopUp=cmp.find("lookup-div");
        //alert('_____ divPopUp ______'+divPopUp.get("v.body") );
        //$A.util.toggleClass(divPopUp, "toggle");
        //var divPopUpById=cmp.find("searchToOpenPopUp");
        
        // Assign the value of Type Ahead field to input text lookup in Popup
        document.getElementById('lookup').value=cmp.get("v.searchString");

        //This helper is used to Hide the TypeAheadComponent
        helper.handlePopUpSelection(cmp, event);
        var divPopUpById=document.getElementById('lookUpPopupDiv'); 
        //alert('_____ divPopUpById ______'+divPopUpById.innerHTML );
        divPopUpById.style.display='block';
        //alert('divPopUpById_style_display'+divPopUpById.style.display)
        // Fire Event onKeyUp Event for lookupdiv
        //document.getElementById('lookup').onkeyup();
        var searchTextEvent = $A.get("e.c:LRC_CL_searchText");
        //alert('searchTextEvent______'+searchTextEvent);
        searchTextEvent.setParams({
            text: document.getElementById('lookup').value
        }).fire();
	},
    updateLookupNameEventinTypeAhead: function(cmp,event,helper){
        //alert('InTypeAhead');
        cmp.set('v.searchString',event.getParam("sObjectName"));
    }
})