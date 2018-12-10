({  
    //Below functions written by K.R.Srivatsan on 11th April for generic pagination component
    init: function(component) { //Init to load pagination when the component loads for the first time
        try {
            // alert('tableDataList' + component.get("v.tableDataList")); 
            if (this.getPaginationSettings(component)) {
                this.prepare(component);
            }
            
            // Custom Labels
            var backBtnAlts = "goto to first - inactive | goto to first - active";
            var backlabelsArr = backBtnAlts.split("|");
            var nextBtnAlts = "goto to last - inactive | goto to last - active";
            var nextlabelsArr = nextBtnAlts.split("|");
            component.set("v.backImgAltText", backlabelsArr);	
            component.set("v.nextImgAltText", nextlabelsArr);	
        } catch (e) { console.log(e.stack, true); }
    },
    //below function written to refresh pagination comp when searched to reset variables to start from 0 again.
    refreshPagination:function(component) {
        try {
            component.set('v.offSetVal',0);  
            component.set('v.recDirection','');
            component.set('v.currentPage',1);
            component.set('v.lastPage',0);
            component.set('v.pages',[]);
            this.init(component);  
        }
        catch (e) { console.log(e.stack, true); }
    },
    //function which makes all the relevant calls to create pagination pages once we get the custom setting data from server
    prepare: function(component) {
        try {
             var specificRecIndex = component.get("v.tableDataIndex");
            //US 14162 fix starts here. below code was added to goto a specific page  incase they want to locate a record.
             var quotient = Math.floor(specificRecIndex/component.get("v.sizePerPage"));
                    quotient = quotient + 1;
            if(specificRecIndex === -1) this.changePageRecords(component.get('v.currentPage'), component,false);//no specific index so index is set to -1
            else this.changePageRecords(quotient, component,false);//set current page based on record index
            //get calculation of the no of pages to be displayed in pagination
            var noOfPages = this.noOfPages(component);
            var pages = [];
            pages = this.createPaginationArr(component, noOfPages);
           
            if (pages.length > 0) {
              if(specificRecIndex === -1)
                this.setPaginationParams(component, pages, noOfPages,null,false);
                else{                   
                      this.setPaginationParams(component, pages, noOfPages,quotient,false);//passing pagenumber from index to set current page
                }
            
            }
             //US 14162 fix ends here. below code was added to goto a specific page  incase they want to locate a record.
            /* Added by RD for mobile pagination */
            component.set("v.paginationStartMob", 0);
            if ($A.get("$Browser.isPhone")) {
                component.set("v.paginationEndMob", (noOfPages >= 5) ? 5 : noOfPages);
            } else
                component.set("v.paginationEndMob", noOfPages);
        } catch (e) { console.log(e.stack, true); }
    },
    
    //function which makes server call to get pagination paramters from custom settings. every page needs to have a custom setting name
    getPaginationSettings: function(component) {
        try {
            var sizePerPage = component.get("v.sizePerPage");
            var compFunctionality = component.get("v.compFunctionality");
            var returnVal = false;
            if (sizePerPage > -1 && !compFunctionality) { returnVal = true; } else {
                this.callServer(component, 'c.getPaginationSettingsFromServer', function(response) {
                    var settings = response.objectData['Pagination Settings'];
                    if (settings) {
                        component.set("v.sizePerPage", settings.SizePerPage__c);
                        component.set("v.needServerCall", settings.ServerSide__c);
                        component.set("v.totalSizeAcrossPages", settings.TotalSize__c);
                        this.prepare(component);
                    }
                }, {
                    sFunctionality: compFunctionality
                });
            }
            return returnVal;
        } catch (e) { console.log(e.stack, true); }
    },
    
    noOfPages: function(component) { //calculating the no of pages (page nos) in pagination
        try {
            var totalNoPages = component.get('v.tableDataList');
            var sizePerPage = component.get('v.sizePerPage');
            //calculating the no of pages(page nos) to be displayed in pagination
            return Math.ceil(totalNoPages / sizePerPage);
        } catch (e) { console.log(e.stack, true); }
    },
    
    //code for changing the the table records data as per the page size on click of next, prev, page number
    changePageRecords: function(currentPage, component,fromserverCall) {
        try {     
	        var startIndex;
            if(!fromserverCall)
            { 
                startIndex = currentPage -  (component.get("v.offSetVal") / component.get('v.sizePerPage'));
                startIndex = (startIndex -1) * component.get('v.sizePerPage');
                
            }
            else{
                startIndex = 0;}
            var dataListLength = component.get('v.tableDataList');
            // dataListLength = dataListLength.length;
            while (dataListLength <= startIndex) {
                startIndex = startIndex - dataListLength;
            } //loop to calculate startindex to communicate back to parent component
            var changeEvent = component.getEvent("ChangePageRecordsEvent");
            changeEvent.setParams({
                "changedTableList": startIndex,
                "currentPage": currentPage,
                "sizePerPage" : component.get('v.sizePerPage')
            });
            changeEvent.fire(); //event which will tell listening parent comp which records to show for the current page
        } catch (e) { console.log(e.stack, true); }
    },
    
    displayRecordSetNumberClick: function(component, event) { //function used to display recordset based on click of number in UI
        try {
            var element = event.currentTarget;
            var lastpage = 0;
            
            var currentPage = component.get('v.currentPage');
            var noOfPages = component.get('v.pages');
            if (noOfPages.length > 0) lastpage = noOfPages[noOfPages.length - 1];
            if (parseInt(element.dataset.currentpage, 10)) currentPage = parseInt(element.dataset.currentpage, 10);
            this.recordSetPageShifter(currentPage, component); /* Added by RD for mobile pagination */
            this.changePageRecords(currentPage, component,false);
            component.set('v.currentPage', currentPage);
            var disablesinglearrowFwd,disablesinglearrowbwd; 
            disablesinglearrowbwd = currentPage === noOfPages[0] ? true:false;
            disablesinglearrowFwd = currentPage === noOfPages[noOfPages.length-1] ? true:false;
            component.set('v.disablesinglearrowbwd', disablesinglearrowbwd);
            component.set('v.disablesinglearrowFwd', disablesinglearrowFwd);
        } catch (e) { console.log(e.stack, true); }
    },
    displayRecordSetonarraymovement:function(component, event) {//function used to display data based on click of previous/next arrow in UI
        try {
            var element = event.currentTarget;
            var lastpage = 0;
            var recDirection = element.id;
            var currentPage = component.get('v.currentPage');
            var noOfPages = component.get('v.pages');
            var disablesinglearrowFwd,disablesinglearrowbwd; 
            disablesinglearrowbwd =  component.get('v.disablesinglearrowbwd');
            disablesinglearrowFwd = component.get('v.disablesinglearrowFwd');
            if (noOfPages.length > 0) lastpage = noOfPages[noOfPages.length - 1];
            
            if(!disablesinglearrowbwd && recDirection === 'prevBtn' && currentPage > 1)
            {currentPage--;
             this.recordSetPageShifter(currentPage, component); /* Added by RD for mobile pagination */
             this.changePageRecords(currentPage, component,false);  
             component.set('v.currentPage', currentPage);}
            // ){
            else if(!disablesinglearrowFwd && recDirection === 'nextBtn' && currentPage < lastpage) {
                currentPage++; //if next goto next page if it exists              
                // if (parseInt(element.dataset.currentpage, 10)) currentPage = parseInt(element.dataset.currentpage, 10);
                this.recordSetPageShifter(currentPage, component); /* Added by RD for mobile pagination */
                this.changePageRecords(currentPage, component,false);
                component.set('v.currentPage', currentPage);                
            }  
            disablesinglearrowbwd = currentPage === noOfPages[0] ? true:false;
            disablesinglearrowFwd = currentPage === noOfPages[noOfPages.length-1] ? true:false;     
            component.set('v.disablesinglearrowbwd', disablesinglearrowbwd);
            component.set('v.disablesinglearrowFwd', disablesinglearrowFwd);
        } catch (e) { console.log(e.stack, true); }    
    },
    /* Added by RD for mobile pagination */
    recordSetPageShifter: function(currentPage, component) {
        try{
            if ($A.get("$Browser.isPhone")) {
                if (currentPage > 2 && currentPage < (this.noOfPages(component) - 1)) {
                    component.set("v.paginationStartMob", currentPage - 3);
                    component.set("v.paginationEndMob", currentPage + 2);
                }
                if (currentPage === 2) {
                    component.set("v.paginationStartMob", 0);
                    component.set("v.paginationEndMob", 5);
                }
                if (currentPage === (this.noOfPages(component) - 1)) {
                    component.set("v.paginationStartMob", this.noOfPages(component) - 5);
                    component.set("v.paginationEndMob", this.noOfPages(component));
                }
            }
        } catch(e) {
            console.log(e.stack, true);
        }        
    },
    displayServerRecordSet: function(component, event, recDirection) { //fire event back to parent asking for next set of server records incase of server side pagination
        try {
            if ((recDirection === "moveBackward" && component.get("v.firstPage") !== 1) || (recDirection === "moveNext" && !component.get('v.disableFwd'))) {
                component.set('v.recDirection', recDirection);
                var fireRecordSet = component.getEvent("fireGetRecordSetCall");
                fireRecordSet.setParams({ "direction": recDirection, "offSet": this.calculateoffsetforServerPagination(component, recDirection) });
                fireRecordSet.fire();
            }
            
        } catch (e) { console.log(e.stack, true); }
    },
    
    calculateoffsetforServerPagination: function(component, recDirection) {//function which calculates offset which is sent back to server to get the next set of records
        try {
        	var newOffset = 0;
            var currentOffsetval = component.get("v.offSetVal");
            var totalpageSize = component.get("v.totalSizeAcrossPages");
            recDirection === "moveNext" ? newOffset = currentOffsetval + totalpageSize : newOffset = currentOffsetval - totalpageSize;
            component.set("v.offSetVal", newOffset);
            return newOffset;    
        } catch (e) {
            console.log(e.stack, true);
        }        
    },
    
    handleRecordUpdates: function(component, event) { //event method to handle addition or deletion to parent list
        try {
            var newpagelength = event.getParam("TotalPageLength");
            var fromserverCall = event.getParam("serverUpdate");
            var currentPage = component.get('v.currentPage');
            var lastpage = component.get('v.lastPage');
            var oldpagelength = component.get('v.tableDataList');
            component.set('v.tableDataList', newpagelength);
            var noOfPages = this.noOfPages(component);
            var pages = [];
            component.set("v.recDirection", 'frominsertupdate');	
            pages = this.createPaginationArr(component, noOfPages);
            var oldPages = component.get('v.pages');
            var oldpagezlength = oldPages.length;
             newpagelength = pages.length;
            if (!fromserverCall) {
                
                if ((newpagelength < oldpagezlength) && currentPage === lastpage) {
                    if (currentPage !== 1 && newpagelength >= 1)
                        currentPage = currentPage - 1;
                    else if (newpagelength === 0) currentPage = 0;
                } else {
                    currentPage = currentPage;
                }
                // currentPage = (pages.length < oldPages.length) ? currentPage-1 : currentPage;
                this.changePageRecords(currentPage, component,false);
                this.setPaginationParams(component, pages, noOfPages, currentPage,true);
            } else {
                currentPage = oldPages.length + 1;
                this.changePageRecords(currentPage, component,false);
                this.setPaginationParams(component, pages, noOfPages, currentPage,true);
            }
        } catch (e) { console.log(e.stack, true); }
    },
    
    setPaginationParams: function(component, pages, noOfPages, currentPage,frominsertdel) { //final method to set all relevant pagination attributes
        try {
            var currentpagelocal = 0;
            component.set("v.lastPage", pages[pages.length - 1]);
            component.set("v.firstPage", pages[0]);
            component.set('v.noOfPages', noOfPages);
            component.set('v.pages', pages);
            if (currentPage) {
                currentpagelocal = currentPage;
                component.set('v.currentPage', currentPage);}
            
            else {
                component.set('v.currentPage', pages[0]);
                currentpagelocal = pages[0];}
            if (component.get('v.tableDataList') < component.get('v.totalSizeAcrossPages') && !frominsertdel) {
                component.set('v.disableFwd', true);
                //alert(component.get('v.offSetVal') + component.get('v.totalSizeAcrossPages'));
            } else component.set('v.disableFwd', false);
            var disablesinglearrowFwd,disablesinglearrowbwd; 
            disablesinglearrowbwd = currentpagelocal === pages[0] ? true:false;
            disablesinglearrowFwd = currentpagelocal === pages[pages.length-1] ? true:false;
            component.set('v.disablesinglearrowbwd', disablesinglearrowbwd);
            component.set('v.disablesinglearrowFwd', disablesinglearrowFwd);
            
        } catch (e) { console.log(e.stack, true); }
    },
    
    createPaginationArr: function(component, noOfPages) { //method which creates the pagination numbers that gets displayed as part of comp     
        try {
            var pages = [];
            var startpageVal;
            var i;
            if (component.get('v.recDirection') === "moveNext") {
                
                 startpageVal = component.get("v.lastPage");
                
                for (i = startpageVal; i < startpageVal + noOfPages; i++) {
                    pages.push(i + 1);
                }
            } else if (component.get('v.recDirection') === "moveBackward") {
                 startpageVal = component.get("v.firstPage");
                
                var indexval = startpageVal - noOfPages;
                if(indexval <= 0) indexval = 1;
                for (i = indexval; i < indexval + noOfPages; i++) {
                    pages.push(i);
                }
            } else if (component.get('v.recDirection') === "frominsertupdate") {
                 startpageVal = component.get("v.firstPage");
                for (i = startpageVal; i < startpageVal+noOfPages; i++) {
                    pages.push(i);
                }
            }
                else {
                    for (i = 0; i < noOfPages; i++) {
                        pages.push(i + 1);
                    }
                }
            return pages;
        } catch (e) { console.log(e.stack, true); }
    },
    handleserverRecordUpdates: function(component, event) {//method to handle callback data for new set of data from server
        try {
            var newPageLength = event.getParam("newrecordsetlength");
            
            component.set('v.tableDataList', newPageLength);
            if (newPageLength > 0){
                if (component.get('v.recDirection') === "moveBackward") 
                    this.changePageRecords(component.get('v.firstPage') - component.get('v.sizePerPage'), component,true);
                else if (component.get('v.recDirection') === "moveNext") 
                    this.changePageRecords(component.get('v.lastPage') + 1, component,true);
                
                var noOfPages = this.noOfPages(component);
                var pages = [];
                pages = this.createPaginationArr(component, noOfPages);
                if (pages.length > 0) this.setPaginationParams(component, pages, noOfPages,null,false);
                /* Added by RD for mobile pagination */
                component.set("v.paginationStartMob", 0);
                if ($A.get("$Browser.isPhone")) {
                    component.set("v.paginationEndMob", (noOfPages >= 5) ? 5 : noOfPages);
                } else
                    component.set("v.paginationEndMob", noOfPages);
            }     
            
        } catch (e) { console.log(e.stack, true); }
    },callServer : function(cmp, method, callback, params, cacheable,background) {
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