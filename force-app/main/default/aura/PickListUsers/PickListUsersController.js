({
    doInit : function(component, event, helper) {
        var users = [{label:'SACHIN', value:'TENDULKAR', selected:'true'},
                     {label:'RAHUL', value:'DRAVID'},
                     {label:'SOURAV', value:'GANGULY'},
                     {label:'MS', value:'DHONI'},
                     {label:'VIRAT', value:'KOHLI'}
                    ];
        var inputSelect = component.find('InputSelectDynamic');
        inputSelect.set('v.options',users);
    },
    onChange : function(component, event, helper){
        var name = component.find('InputSelectDynamic').get('v.value');
        var eve = $A.get('e.c:NewUser');
        eve.setParams({'newuser':name});
        eve.fire();// raising newuser event
        console.log('event fired!');
    }
})
