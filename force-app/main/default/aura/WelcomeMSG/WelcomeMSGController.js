({
    doInit : function(component, event, helper) {
        console.log('WelcomeMSG Event Fired!');
    },
    getVal:function(component,event){
        var showName = event.getParam('newuser');
        console.log(showName);
        component.find('userName').set('v.value',showName);
    }
})
