({
    echo : function(component, event, helper) {
        var action = component.get('c.serverEcho');
        action.setParams({firstName:component.get('v.firstName')});
        action.setCallback(this, function(Response){
            var state = Response.getState();
            if(state === 'SUCCESS'){
                alert('From Server: ' + Response.getReturnValue());
            }
            else if(state === 'INCOMPELETE'){
                alert('Incomplete');
            }
            else if(state === 'ERROR'){
                var errors = Response.getError();
                if(errors){
                    if(errors[0] && errors[0].message){
                        console.log('Error Message ' + errors[0].message);
                    }
                    else{
                        console.log('Unknown Error');
                    }
                }
            }
        })
        $A.enqueueAction(action);
    }
})
