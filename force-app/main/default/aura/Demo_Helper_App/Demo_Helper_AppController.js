({
    doSquare : function(component, event, helper) {
        var no1 = component.get('v.no1');
        //component.set('v.result',(no1*no1));
        // calling helper to do square of no1
        helper.myHelper(component,no1,no1);
    },

    doMultiply  : function(component, event, helper) {
        var no1 = component.get('v.no1');
        var no2 = component.get('v.no2');
        //component.set('v.result',(no1*no2));
        // calling helper to do multiplication of no1 and no2
        helper.myHelper(component,no1,no2);
    }
})
