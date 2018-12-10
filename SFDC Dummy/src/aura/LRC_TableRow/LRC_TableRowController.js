({
     openCommentModal : function(component, event, helper) {
		helper.openCommentModal(component, event);
	},
	doInit : function(component, event, helper) {
        
        
        helper.doInit(component, event);
        
        },
    
    
    fireTableRowEvent:function(component, event, helper){
        
       	//console.log('index is -->'+event.getSource().get('v.name'));
        helper.fireRowEvent(component,event.getSource().get('v.name'));
        event.preventDefault();
    },
    fireRadioButtonEvent:function(component,event,helper){
        helper.fireRowEvent(component,event.getSource().get('v.text'));
        event.preventDefault();
    },
    fireCheckboxEvent:function(component,event,helper){
        //console.log('here');
        helper.fireRowEvent(component,event.currentTarget.dataset.checked);
        event.preventDefault();
    }
    
})