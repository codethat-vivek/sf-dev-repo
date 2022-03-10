({
    checkBrowser : function(component, event, helper) {
        var device = $A.get('$Browser.formFactor');
        alert('You are using ' + device);
    }
})
