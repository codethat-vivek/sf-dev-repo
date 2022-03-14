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
        console.log('reshuflle button is clicked');
    }
})
