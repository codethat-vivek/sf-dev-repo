({
    getMessage : function(component, event, helper) {
        var params = event.getParam('arguments');
        if(params){
            var param1 = params.Name;
            return '####### Hello ' + param1 + ' from Child Component #######';
        }
        return '';
    }
})
