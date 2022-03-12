({
    callAuraMethod : function(component, event, helper) {
        var childComp = component.find('childComponent');
        var retMsg = childComp.GetMessageFromChildMethod('Vivek');        
        component.set('v.message',retMsg);
    }
})
