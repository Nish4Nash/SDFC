({
    loadData : function(component) {
        //loads the page data
    	var RecordCountPerPage = component.get("v.RecordCountPerPage");
    	var iListSize = component.get("v.iListSize");
    	var PageCountPerScreen = component.get("v.PageCountPerScreen");
        var iChunkSize = RecordCountPerPage * PageCountPerScreen;
        component.set("v.iChunkSize", iChunkSize);
        component.set("v.bshowTable", false);
        var MasterRecordList = component.get("v.MasterRecordList");
        var iNewListSize = MasterRecordList.length;
        var iTotalPages = Math.ceil(iNewListSize / RecordCountPerPage);
        var iSelectedPage = component.get("v.iSelectedPage");
        component.set("v.iTotalPages", iTotalPages);
        if(iSelectedPage !== 1){
        	if((iListSize - 1) === iNewListSize
        		&& (iNewListSize % RecordCountPerPage) === 0
        		&& (iNewListSize / RecordCountPerPage) === iSelectedPage - 1){
        		
        		component.set("v.iSelectedPage", iSelectedPage - 1);
        		component.set("v.iClientOffset", component.get("v.iClientOffset") - RecordCountPerPage);
        		if(iNewListSize % (PageCountPerScreen * RecordCountPerPage) === 0)
        			component.set("v.iServerOffset", component.get("v.iServerOffset") - iChunkSize);
        	} else if((iListSize + 1) === iNewListSize){
        		component.set("v.iSelectedPage", 1);
        		component.set("v.iServerOffset", 0);
        		component.set("v.iClientOffset", 0);
        	}
        		
        	this.getDataList(component, false);
        	return;
        }
        var bIsServerSide = component.get("v.ServerPaginationEnabled");
    	var lstRecordChunk = [];
    	iListSize = 0;
        
        if(bIsServerSide){
        	var params = {};                
	        this.callServer(component, "c.loadData", function(response) {
	            
	        }, params);
        } else{
        	var iTotalSize = MasterRecordList.length;
        	if(iTotalSize > iChunkSize){
        		iListSize = iChunkSize + 1;
        		lstRecordChunk = MasterRecordList.slice(0, iListSize);
        	} else{
        		iListSize = iTotalSize;
        		lstRecordChunk = MasterRecordList;
        	}
            component.set("v.iListSize", iListSize);
            component.set("v.lstRecordChunk", lstRecordChunk);
        }
        this.updateTable(component);
    },
    gotoSelectedPage : function(component, iSelectedPage){
        //navigate to the selected page
        //it is just client side pagination
        //console.log("gotoSelectedPage");
        component.set("v.iSelectedPage", iSelectedPage);
        component.set("v.iClientOffset", ((iSelectedPage - 1) % component.get("v.PageCountPerScreen")) * component.get("v.RecordCountPerPage"));
        this.updateTable(component);
    },
    setVariablesAndCall : function(component, iServerOffset){
        //set the variables and call data list
        //console.log("setVariablesAndCall/iServerOffset");
        component.set("v.iServerOffset", iServerOffset);
        component.set("v.iClientOffset", 0);
        component.set("v.iSelectedPage", (iServerOffset / component.get("v.RecordCountPerPage")) + 1);
        this.getDataList(component, false);
    },
    getDataList : function(component, gotoLastPage) {
        //pass the variables and call task list
        //console.log("getDataList");
        this.getAppList(component,
                        component.get("v.iServerOffset"), 
                        component.get("v.sSortField"), 
                        component.get("v.sSortOrder"),
                        component.get("v.sSearchText"),
                        gotoLastPage);
    },
    getAppList : function(component, iServerOffset, sSortField, sSortOrder, sSearchText, gotoLastPage) {
        //returns the filtered data
        component.set("v.bshowTable", false);
        var bIsServerSide = component.get("v.ServerPaginationEnabled");
        var iChunkSize = component.get("v.iChunkSize");
	    var lstRecordChunk = [], iListSize = 0;
	    
        if(bIsServerSide){
        	var params = {};                
	        this.callServer(component, "c.loadData", function(response) {
	            
	        }, params);
        } else{
	        var MasterRecordList = component.get("v.MasterRecordList");
        	var iTotalSize = MasterRecordList.length;
        	var iNextSize = iChunkSize + iServerOffset;
            
        	if(gotoLastPage){
        		iListSize = iTotalSize % iChunkSize;
        		iServerOffset = iTotalSize - iListSize;
        		lstRecordChunk = MasterRecordList.slice(iServerOffset, iTotalSize);
                var RecordCountPerPage = component.get("v.RecordCountPerPage");
                var iQuotient = iTotalSize % RecordCountPerPage;
                var iSelectedPage = (iQuotient > 0) ? ((iTotalSize - iQuotient) / RecordCountPerPage) + 1 : iTotalSize / RecordCountPerPage;
                component.set("v.iSelectedPage", iSelectedPage);
                var iClientOffset = iListSize - (iQuotient > 0 ? iQuotient : RecordCountPerPage);
                component.set("v.iClientOffset", iClientOffset);
            } else{
	        	if(iTotalSize > iNextSize){
	        		iListSize = iNextSize - iServerOffset + 1;
	        		lstRecordChunk = MasterRecordList.slice(iServerOffset, iNextSize);
	        	} else{
	        		iListSize = iTotalSize - iServerOffset;
	        		lstRecordChunk = MasterRecordList.slice(iServerOffset, iTotalSize);
	        	}
            }
            component.set("v.iListSize", iListSize);
            component.set("v.lstRecordChunk", lstRecordChunk);
            component.set("v.iServerOffset", iServerOffset);
        }
        this.updateTable(component);
    },
    updateTable : function(component) {
        //updates the table list with pagination
        //console.log("updateTable");
        var lstDisplayRecords = [];
        component.set("v.lstDisplayRecords", lstDisplayRecords);
        var bIsNext = false, bIsPrev = false;
        var RecordCountPerPage = component.get("v.RecordCountPerPage");
        var iSelectedPage = component.get("v.iSelectedPage");
        var iClientOffset = component.get("v.iClientOffset");
        var iServerOffset = component.get("v.iServerOffset");
        var lstRecordChunk = component.get("v.lstRecordChunk");
        var iListSize = component.get("v.iListSize");
        var PageCountPerScreen = component.get("v.PageCountPerScreen");
        var iChunkSize = RecordCountPerPage * PageCountPerScreen;
        if((iClientOffset + RecordCountPerPage) < iListSize){
            lstDisplayRecords = lstRecordChunk.slice(iClientOffset, iClientOffset + RecordCountPerPage);
        } else if(iClientOffset < iListSize){
            lstDisplayRecords = lstRecordChunk.slice(iClientOffset, iListSize);
        }
        component.set("v.lstDisplayRecords", lstDisplayRecords);
        if($A.util.isEmpty(lstDisplayRecords))
	        component.set("v.bshowTable", false);
	    else
	    	component.set("v.bshowTable", true);
        this.updateButtons(component);
    },
    updateButtons : function(component) {
        //updates the pagination buttons
        //console.log("updateButtons");
        var iChunkSize = component.get("v.iChunkSize");
        var iServerOffset = component.get("v.iServerOffset");
        var iListSize = component.get("v.iListSize");
        if(iServerOffset > 0){
			component.set("v.bDisableFirst", false);
			component.set("v.bDisablePrev", false);
		}else{
			component.set("v.bDisableFirst", true);
			component.set("v.bDisablePrev", true);
		}
		if(iListSize > iChunkSize){
			component.set("v.bDisableLast", false);
			component.set("v.bDisableNext", false);
		}else{
			component.set("v.bDisableLast", true);
			component.set("v.bDisableNext", true);
		}
        this.updateSerialButtons(component, iListSize);
    },
    updateSerialButtons : function(component, iListSize){
        //updates the pagination serial buttons
        //console.log("updateSerialButtons");
        var iSelectedPage = component.get("v.iSelectedPage");
        var RecordCountPerPage = component.get("v.RecordCountPerPage");
        var PageCountPerScreen = component.get("v.PageCountPerScreen");
        iListSize = (iListSize > (RecordCountPerPage * PageCountPerScreen)) ? iListSize - 1 : iListSize;
        var iQuotient = iListSize % RecordCountPerPage;
        var iPageLimit = (iQuotient > 0) ? ((iListSize - iQuotient) / RecordCountPerPage) + 1 : iListSize / RecordCountPerPage;
        var firstPage = iSelectedPage - ((iSelectedPage % PageCountPerScreen) === 0 ? (PageCountPerScreen - 1) : (iSelectedPage % PageCountPerScreen) - 1);
        var lstPageNumbers = [];
        for(var iPageNumber = 0; iPageNumber < iPageLimit; iPageNumber++){
            lstPageNumbers[iPageNumber] = iPageNumber + firstPage;
        }
        component.set("v.lstPageNumbers", lstPageNumbers);
    }
})