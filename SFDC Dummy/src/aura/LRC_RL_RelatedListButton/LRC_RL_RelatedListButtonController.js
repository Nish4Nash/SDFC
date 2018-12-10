({
	doInit : function(component, event, helper) {
		//var rlComp =component.find('RLComp');
        //console.log('Printing-->'+rlComp.get("v.selectItem"));
	},
    handleClick:function(component, event, helper) {
		var rlComp =component.find('RLComp');
        console.log('Printing-->',rlComp.get("v.selectItem"));
	}
})