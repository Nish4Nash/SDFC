({
    removeRecord: function(component,event){
        try{
            var mainList = component.get("v.totalTableRecords");
            var removedItem = component.get("v.item");
            mainList.forEach(function(element,index){
                if(removedItem === element){
                    mainList.splice(index,1);   
                    return false;
                }
            });
            this.resetPaginationOnRecordUpdate(mainList.length);            
        }
        catch(e){
            console.log(e.stack, true);
        }                
    },
	// Helper function to reset pagination when records are inserted/deleted not when it needs to be resetted.
    resetPaginationOnRecordUpdate: function(currentListLength) {
        try {
            var appEvent = $A.get("e.c:LRC_HandleRecordDeleteInsert");
            appEvent.setParams({
                "TotalPageLength": currentListLength
            });
            appEvent.fire();
        } catch (e) { console.log(e.stack, true); }
    }
})