({
    blockClickHandler : function(component, event, helper) {
        let open = component.get('v.open');
        if(!open){
            component.set('v.open', true);

            // get label value 
            let label = component.get('v.label');
            // firing the event
            let compEvent = component.getEvent("onclick");
            compEvent.setParams({value : label});
            compEvent.fire();

        }
    }
})
