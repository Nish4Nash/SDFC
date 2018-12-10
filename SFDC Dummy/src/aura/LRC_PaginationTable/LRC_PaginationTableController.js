({
	doInit : function(component, event, helper) {
		helper.loadData(component);
	},
	searchRows : function(component, event, helper) {
		helper.setVariablesAndCall(component, 0);
	},
	first : function(component, event, helper) {
		helper.setVariablesAndCall(component, 0);
	},
	prevSet : function(component, event, helper) {
		var iServerOffset = component.get("v.iServerOffset") - component.get("v.iChunkSize");
		helper.setVariablesAndCall(component, iServerOffset);
	},
	nextSet : function(component, event, helper) {
		var iServerOffset = component.get("v.iServerOffset") + component.get("v.iChunkSize");
		helper.setVariablesAndCall(component, iServerOffset);
	},
	last : function(component, event, helper) {
		helper.getDataList(component, true);
	},
	gotoSelectedPage : function(component, event, helper) {
		var iSelectedPage = event.getSource().get("v.name");
		helper.gotoSelectedPage(component, iSelectedPage);
	}
})