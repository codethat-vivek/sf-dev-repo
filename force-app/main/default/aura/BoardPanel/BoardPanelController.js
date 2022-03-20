({
    startGame : function(component, event, helper) {
        // access combobox
        let gameModeComboBox = component.find('gameMode');

        // access value of combobox
        let selectedValue = gameModeComboBox.get("v.value");

        let selectedMode = component.get('v.selectedMode');
        // update selectedMode attribute
        component.set('v.selectedMode', selectedValue);

        if(selectedMode){
            let boardComp = component.find('boardComp');
            boardComp.startGame();
        }

    },
    
    reshuffleBoard : function(component, event, helper){
        let boardComp = component.find('boardComp');
        boardComp.reshuffleBoard();
        component.set('v.reshuffleDisabled', true);
    },

    onResultHandler : function(component, event, helper){
        const result = event.getParam("result");
        if(result === 'win'){
            component.set('v.reshuffleDisabled', true);
        }
        else{
            component.set('v.reshuffleDisabled', false);
        }
    }
})
