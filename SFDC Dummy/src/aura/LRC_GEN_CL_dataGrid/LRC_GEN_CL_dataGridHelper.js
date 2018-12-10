({
     /*
     * 	@Method: getsObjectList
     *	@param: component,search
     *	@Desc:	Fetch the Initial Data from the search text.
     */
    
    getsObjectList: function(component, search) {
		
		//Fetch the Controller Action
		var fetchFieldLabelAction = component.get("c.getFieldLabel");
        var fetchSearchDataAction = component.get("c.getSObjectData");
        var itemsPerPage = component.get("v.itemsPerPage");
        var sObjectAPI = component.get('v.sObjectAPI');
        var lstLookUpColumns = component.get('v.lstLookUpColumns');
		var lstSearchFields = component.get('v.lstSearchFields');
		this.toggleSpinner(component);
		var isLookupPresent = false;
		var slookupName = [];
		
		//Set Params for fetchFieldLabelAction
		fetchFieldLabelAction.setParams({
              "sobjectAPIName":sObjectAPI,"lstLookUpColumns":lstLookUpColumns
        });
        //Set up the callback
        fetchFieldLabelAction.setCallback(this, function(response) {
            var objResult, i;
            var state = response.getState();
            if(state === "SUCCESS"){
                var objResult = response.getReturnValue();
                
                //NOTE: JavaScript object.value is not working on Chrome but works fine in firefox
                var FieldLabelsArr = []; 
                for(var keyVal in objResult) {
                    var value = objResult[keyVal];
                    FieldLabelsArr.push(value);
                }
               
	            var searchMap = [];
                var counter=0;
	               for(var keyVal in objResult){
	            	   var lookup = keyVal;
	            	   if(lookup.includes('__r') || lookup.includes('.')){
	            		   isLookupPresent = true;
	            		   slookupName[counter] = keyVal;
	            		   lookup= lookup.split(".")[0];
	            		   counter++;
	            		   searchMap.push({label:objResult[keyVal], fieldName:lookup, type: 'text' });
	            	   }else{
	            		   searchMap.push({label:objResult[keyVal], fieldName:keyVal, type: 'text' });
	            	   }	                   
	               } 
	              component.set('v.searchColumnList',searchMap);
            }
        });
		//Fire 1st Action
        $A.enqueueAction(fetchFieldLabelAction);
		
		//Set params for fetchSearchDataAction
        fetchSearchDataAction.setParams({
              "sobjectAPIName":sObjectAPI,"search": search,
              "lstLookUpColumns":lstLookUpColumns,"lstSearchFields":lstSearchFields
        });
		
        //Set up the callback
        fetchSearchDataAction.setCallback(this, function(response) {
        	
            var objResult, i;
            var state = response.getState();
            var displayProducts = [];
            this.toggleSpinner(component);
            if(state === "SUCCESS"){
            var objResult = [];
                objResult = response.getReturnValue();
                
                var maxI = itemsPerPage;
                if(maxI > objResult.length)
            		maxI = objResult.length;
                
                component.set("v.lstRecords",objResult);
                component.set("v.totalItems", objResult.length);
                for( i = 0; i < maxI; i++ ){
                	var obj = {};
                	obj = objResult[i];
                	if(isLookupPresent){
                        for(var j=0;j<slookupName.length;j++){
                			var splitfiled = slookupName[j].split(".");
                			var lookupName =splitfiled[0];
                			var fieldName =splitfiled[1];
                			obj[lookupName] = obj[lookupName][fieldName];
                        }
                	}
                	displayProducts.push(obj);
                }
                
				component.set("v.searchData", displayProducts);
            }else{
            	component.set("v.searchData", '');
            }
        });
		
		//Fire 2nd Action
        $A.enqueueAction(fetchSearchDataAction);
    },
    
    /*
     * 	@Method: setPage
     *	@param: component,search
     *	@Desc:	To Paginate the Records on Client-Side
     */
    setPage: function(component, event) {
    	var page = event.getParam('page');
        var itemsPerPage = component.get("v.itemsPerPage");
        var i = ((page - 1) * itemsPerPage);
        var maxI = i + itemsPerPage;    
        var objResult = component.get("v.lstRecords");
        if(maxI > objResult.length)
            maxI = objResult.length;
        var displayProducts = [];
        for( ; i < maxI; i++)
            displayProducts.push(objResult[i]);
        component.set("v.displaysObjectRecordWrap", displayProducts);
        component.set("v.searchData", displayProducts);
    },
    
    /*
     * 	@Method: setPage
     *	@param: component,search
     *	@Desc:	toggle the spinner
    */  
    toggleSpinner : function(component){
        component.set("v.isSpinnerActive",!component.get("v.isSpinnerActive"));
    },
})