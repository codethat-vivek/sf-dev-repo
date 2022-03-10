({
    doInit : function(component, event, helper) {
        component.set("v.setMeOnInit", "Value Changed from controller");
    },
    updateOnClick : function(component, event, helper){
        component.set("v.setMeOnInit", "Value changed on button click");
    }
})
