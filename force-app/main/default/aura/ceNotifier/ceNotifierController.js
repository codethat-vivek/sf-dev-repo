({
    fireComponentEvent : function(component, event, helper) {
        var cmpEvent = component.getEvent('cmpEvent');
        cmpEvent.setParams({
            'message' : 'A component event is fired on me. ' + 'It happened so fast. Now I am here!'
        });
        cmpEvent.fire();
    },
    handleAtSource : function(component, event, helper){
        alert('Handled at Source !');
    }
})
