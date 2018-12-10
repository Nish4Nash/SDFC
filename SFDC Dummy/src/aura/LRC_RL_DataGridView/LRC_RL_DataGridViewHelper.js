({
    getLocalList: function(component) {
        var spinner = component.find('spinner');
		$A.util.removeClass(spinner, "slds-hide");
        
        var recID = component.get("v.recordId");
        var childMetadata = component.get("v.inputChildMetadata"); 
        var pagesize = component.get("v.inputPageSize"); 
        component.set("v.itemsPerPage",pagesize);
        var action = component.get("c.getAllChildRecords");
            action.setParams({
                "recordId": recID,
                "inputChildMetadata": childMetadata,
                "inputPageSize": pagesize
            });
        action.setCallback(this, function(response) {
            //console.log("The Data: ", response.getReturnValue());
            this.doLayout(response, component);
        });
        $A.enqueueAction(action);
    },
    doLayout: function(response, component) {
        var spinner = component.find('spinner');
		$A.util.addClass(spinner, "slds-hide");
        var displayProducts = [];
        var result, i;
        //var data = JSON.Stringify(response.getReturnValue());
         var paginationData = response.getReturnValue().wrap;
        result= paginationData;
        console.log("The Data: ", paginationData);
       // component.set("v.childRecordList", response.getReturnValue());
       var lstHeaders = [];
        if (paginationData.length > 0) {
            component.set("v.totalTableRecords", paginationData); 
             component.set("v.totalItems", paginationData.length);
        }
        var itemsPerPage = component.get("v.itemsPerPage");
        	var maxI = itemsPerPage;
                if(maxI > paginationData.length)
            		maxI = paginationData.length;
                
                for( i = 0; i < maxI; i++ ){
                	var obj = {};
                	obj = result[i];
                	displayProducts.push(obj);
                }
                console.log('displayProducts--->',displayProducts);
				component.set("v.tableRecords", displayProducts);
    },
     
    closeDropdown : function(component, event) {
        console.log('close called');
        var closedItem = component.get('v.openItem');
       
        if (!$A.util.isEmpty(closedItem)) {
            //$A.util.addClass(closedItem, 'slds-hide');
            $A.util.removeClass(closedItem, 'slds-is-open'); 
            //helper.hidePopover(component, event);
            component.set('v.openItem','');
        }
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
        var result = component.get("v.totalTableRecords");
        if(maxI > result.length)
            maxI = result.length;
        var displayProducts = [];
        for( ; i < maxI; i++ )
            displayProducts.push(result[i]);
        component.set("v.tableRecords", displayProducts);
        event.stopPropagation();
    },
    
    
     /*
     * 	@Method: getsObjectList
     *	@param: component,search
     *	@Desc:	Fetch the Initial Data from the search text.
     */
    
    getsObjectList: function(component, search) {
		
		var spinner = component.find('spinner');
		$A.util.removeClass(spinner, "slds-hide");
        
        var recID = component.get("v.recordId");
        var childMetadata = component.get("v.inputChildMetadata"); 
        var pagesize = component.get("v.inputPageSize"); 
        component.set("v.itemsPerPage",pagesize);
        var fetchDataAction = component.get("c.getAllChildRecords");
        fetchDataAction.setParams({
            "recordId": recID,
            "inputChildMetadata": childMetadata,
            "inputPageSize": pagesize
        });
        
        //Set up the callback
        fetchDataAction.setCallback(this, function(response) {
            var spinner = component.find('spinner');
			$A.util.addClass(spinner, "slds-hide");
        	var displayProducts = [];
        	var result, i;
            var state = response.getState();
            if(state === "SUCCESS"){
                var objResult = JSON.parse(response.getReturnValue());
                var objFields = objResult.columnFieldsMap;
                var objData = objResult.columnDataList;
                component.set("v.tableheadersMap", objFields);
               
                //NOTE: JavaScript object.value is not working on Chrome but works fine in firefox
                var FieldLabelsArr = []; 
                for(var keyVal in objFields) {
                    var value = objFields[keyVal];
                    FieldLabelsArr.push(value);
                }
               
	            var searchMap = [];
	               for(var keyVal in objFields){
	            	   var lookup = keyVal;
	            	   if(lookup.includes('__r') || lookup.includes('.')){
	            		   isLookupPresent = true;
	            		   slookupName = keyVal;
	            		   lookup= lookup.split(".")[0];
	            		   
	            		   searchMap.push({label:objFields[keyVal], fieldName:lookup, type: 'text' });
	            	   }else{
	            		   searchMap.push({label:objFields[keyVal], fieldName:keyVal, type: 'text' });
	            	   }	                   
	               } 
	              //component.set('v.searchColumnList',searchMap);
	            component.set("v.totalTableRecords", objData);
                result= objData;
                component.set("v.totalItems", objData.length);
                var itemsPerPage = component.get("v.itemsPerPage");
        		var maxI = itemsPerPage;
                if(maxI > objData.length)
            		maxI = objData.length;
                
                for( i = 0; i < maxI; i++ ){
                	var obj = {};
                	obj = result[i];
                	displayProducts.push(obj);
                }
                console.log('displayProducts--->',displayProducts);
				component.set("v.tableRecords", displayProducts);
               
                
            }
        });
		//Fire 1st Action
        $A.enqueueAction(fetchDataAction);
		
    },
})