({
	doInit: function(component, event) {
		var tableRecords = component.get("v.totalTableRecords");
         
      this.fetchRecords(component, event,0, false);    
	},
    
    fetchRecords: function(component, event){
        try{
             this.callServer(component, "c.fetchRecordsForClientSidePagination", function(response) {
                 var paginationData = response.objectData.lstPaginationData;
                 if (paginationData.length > 0) {
                    component.set("v.totalTableRecords", paginationData);
                }
                    //this.handleChangePageRecordsEvent(component, event);
             }, false);
            
            
        } catch (e) {
            console.log(e.stack, true);
        } 
        
    },
    //function that allows the Page Records to be displayed on click of the Page number
    handleChangePageRecordsEvent : function(component, event){   
        try{
            var changedRecordsForPagination = event.getParam("changedTableList");
           
            var sizePerPage = component.get("v.sizePerPage");
            var datalist = [];
           datalist = component.get("v.totalTableRecords").slice();
           component.set('v.tableRecords', datalist.splice(changedRecordsForPagination, sizePerPage));
             
        }
        catch (e) {
           console.log(e.stack, true);
        }
    },
    //function that enables to get the next set of data from pagination on click of next
    getDataSet : function(component,event) {
        try{
           var offsetVar = event.getParam("offSet");
           this.fetchRecords(component, event,offsetVar,true);
            
        }
        catch (e) {
            console.log(e.stack, true);
        }
    },    
    refreshPagination: function(component, event) {
        try {
            var paginationComp = component.find("paginateComp");

            paginationComp.rerenderPagination();
        } catch (e) {
            console.log(e.stack, true);
        }
    },
    resetPaginationOnRecordUpdate: function(currentListLength) {
        try {
            var appEvent = $A.get("e.c:LRC_HandleRecordDeleteInsert");
            appEvent.setParams({
                "TotalPageLength": currentListLength
            });
            appEvent.fire();
        } catch (e) { console.log(e.stack, true); }
    },
   
    callServer : function(cmp, method, callback, params, cacheable,background) {
        try {
            /* retrieving the call stack before executing the server call */
            var sCallStack = "";//storing call stack
            try {   throw new Error();  }   catch(e)    {   sCallStack = String(e.stack);   }
            var callStackFinal = sCallStack.slice(0, sCallStack.indexOf("aura_proddebug.js:") + 25).trim();
            
            var action = cmp.get(method);
            if (params) {
                action.setParams(params);
            }
            if(background){
                action.setBackground();
            }
            if (cacheable) {
                action.setStorable();
            }
            action.setCallback(this,function(response) {
                var state = response.getState();
                var lightningServerResponse = response.getReturnValue();
                if (state === "SUCCESS") { 
                    // pass returned value to callback function
                    if(lightningServerResponse.isSuccessful){
                        callback.call(this, lightningServerResponse);
                        /* invoke method to log error message */
                        if(lightningServerResponse.mapErrorInfo !== undefined && lightningServerResponse.mapErrorInfo.length > 0)   {
                            console.log("error-1");
                        }
                    } else {                    
                        /* invoke method to log error message */
                        console.log("error-2");
                    }
                } else if (state === "ERROR") {
                    /* invoke method to log error message */
                    console.log("error-3");
                }
            });
            $A.enqueueAction(action);
        } catch(e) {
            console.log(e.stack, true);
        }
    }
})