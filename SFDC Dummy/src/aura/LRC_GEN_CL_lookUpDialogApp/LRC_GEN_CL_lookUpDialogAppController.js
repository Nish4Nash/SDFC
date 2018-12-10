({
	recordSelection : function(component, event, helper) {
        var ct = component.get("v.counter");
        ct++;
		component.set("v.bOnChangeTriggered",true);
        component.set("v.sMessage",'A record is Selected for Time-->'+ct);
        component.set("v.counter",ct);
	}
})