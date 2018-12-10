({  
    //added new function
    openCommentModal:function(component,event){
        
       // var lstcolData = component.get('v.colDataArray');
       // var RowData = component.get('v.row-data.sComments');
        //component.set("v.commentPassed",RowData);
        component.set('v.commentType','Comment');
        component.set('v.isOpen',true);
    },
	doInit : function(component, event) {
         var columnHeader = component.get("v.column-header"); //array
        component.set("v.columnSpan",columnHeader.length);
        var nThead=component.get("v.nestedThead");
        component.set("v.nThead",nThead);
        var rowData = component.get("v.row-data"); //object
        component.set("v.rowData",rowData);
        
       
       // console.log("col headers are:",columnHeader[0]);
        
         var newArray=[];
         columnHeader.forEach(function(element) {
           var obj = {
                name:element.sColumnName,
                apiName:element.sValue,
                classHeader:element.sClass,
                classCell:element.sValueCSS,
                type:element.sType,
                icon:element.sIcon,
                shortComment:'',
                value:rowData[element.sValue]+'',
                subType:element.sSubType
            }
           //added ifelse
            if(obj.type == 'comment'){
                 if(obj.value.length>25){
                     var sShortComment = obj.value.split(" ",24);
                     var sShortComment2 =sShortComment.join(' ');
                     obj.shortComment=sShortComment2;
                     component.set('v.sfullComment',obj.value);
                    
                 }
                 else{
                     	obj.shortComment = obj.value;
                     	
                 }
             } 
            
            newArray.push(obj);
        });
      
        //console.log("new array",newArray);
        component.set('v.colDataArray',newArray);
        var lstColDataArray=component.get('v.lstColDataArray');
       
        component.get('v.lstColDataArray').push(component.get('v.colDataArray'));
       //component.get('v.row-data')=component.get('v.colDataArray');
	
		
	},
    fireRowEvent : function(component, iColumn) {
        
        var lstColumnData = component.get('v.column-header');
        var wrapData = component.get("v.row-data");
        console.log('lstColumnData',false,lstColumnData);
        console.log('Event type to be passed in event',false,lstColumnData[iColumn].sEventType);
        //console.log('Data to be sent to event',false, wrapData);
        var actionEvent = component.getEvent("rowAction");
        actionEvent.setParams({ 
            action: lstColumnData[iColumn].sEventType,
            wrapData: wrapData
         });
        actionEvent.fire();
    }
})