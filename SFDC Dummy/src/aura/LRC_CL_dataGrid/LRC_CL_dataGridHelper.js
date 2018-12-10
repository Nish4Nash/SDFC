({
    //Fetch the accounts from the Apex controller
    getsObjectList: function(component, search) {
		var action1 = component.get("c.getFieldLabel");
		
        var action = component.get("c.getSObjectData");
        var itemsPerPage = component.get("v.itemsPerPage");
        var sObjectAPI = component.get('v.sObjectAPI');
        var fieldAPI1 = component.get('v.sObjectLookUpColumn1');
        var fieldAPI2 = component.get('v.sObjectLookUpColumn2');
        var fieldAPI3 = component.get('v.sObjectLookUpColumn3');
		var fieldAPI4 = component.get('v.sObjectLookUpColumn4');
        action1.setParams({
              "sobjectAPIName":sObjectAPI,"fieldAPI1":fieldAPI1,"fieldAPI2":fieldAPI2,"fieldAPI3":fieldAPI3,"fieldAPI4":fieldAPI4
        });
        //Set up the callback
        action1.setCallback(this, function(response) {
            var state = response.getState();
            var result, i;
            
            if(state === "SUCCESS"){
                var result = response.getReturnValue();
                //NOTE: JavaScript object.value is not working on Chrome but works fine in firefox
                //alert('___________ Object Value _______________'+Object.values(result));
                
                var FieldLabelsArr = new Array(); 
                for(var key in result) {
                    var value = result[key];
                    //alert(key+'___________ result _______________'+value);
                    FieldLabelsArr.push(value);
                }
                //component.set("v.sObjectAPIFieldLabel", Object.values(result));
                component.set("v.sObjectAPIFieldLabel", FieldLabelsArr);
				
            }
        });
        $A.enqueueAction(action1);
        
        
        action.setParams({
              "sobjectAPIName":sObjectAPI,"fieldAPI1":fieldAPI1,"fieldAPI2":fieldAPI2,"fieldAPI3":fieldAPI3, "fieldAPI4":fieldAPI4,"search": search
        });
		
        //Set up the callback
        action.setCallback(this, function(response) {
            var state = response.getState();
            var result, i;
            var displayProducts = [];
            if(state === "SUCCESS"){
                var result = response.getReturnValue();
				
                var maxI = itemsPerPage;
                if(maxI > result.length)
            		maxI = result.length;
                component.set("v.sObjectRecordWrap", result);
                component.set("v.totalItems", result.length);
                for( i = 0; i < maxI; i++ )
                    displayProducts.push(result[i]);
               
				component.set("v.displaysObjectRecordWrap", displayProducts);
            }
        });
        $A.enqueueAction(action);
    },
    setPage: function(component, event) {
    	var page = event.getParam('page');
        var itemsPerPage = component.get("v.itemsPerPage");
        var i = ((page - 1) * itemsPerPage);
        var maxI = i + itemsPerPage;
        var result = component.get("v.sObjectRecordWrap");
        if(maxI > result.length)
            maxI = result.length;
        var displayProducts = [];
        for( ; i < maxI; i++ )
            displayProducts.push(result[i]);
        component.set("v.displaysObjectRecordWrap", displayProducts);
    },
    selectedsObjectHelper: function(component, event) {
    }
})