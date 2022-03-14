({
    doInit : function(component, event, helper) {
        console.log('Initialization complete');
        let gameMode = component.get('v.mode');
        let column = 0;
        if(gameMode && gameMode === 'hard'){
            column = 6;
        }
        else if(gameMode && gameMode === 'medium'){
            column = 4;
        }
        else{
            column = 3;
        }

        let blockSize = 12/column;
        component.set('v.blockSize', blockSize);

        // build a list of 100 words and get random words out of it
        let words = helper.getWords(column * column);
        
        // get win word
        let winWord = helper.getWinWord(words);
        
        component.set('v.words', words);
        component.set('v.winWord', winWord);

        // resetting the board every time
        helper.resetBoard(component);

    },
    doRender : function(component, event, helper){
        console.log('Render completed');
    },
    blockClickHandler : function(component, event, helper){
        let clickCount = component.get('v.clickCount') + 1;
        let value = event.getParam("value");
        if(value === component.get('v.winWord')){
            // user has won
            component.set('v.result', 'YOU WIN');
            console.log('You win');
            helper.disableBoard(component);
        }
        else if(clickCount === 3){
            // user has lost
            component.set('v.result', 'YOU LOSE');
            console.log('You lose');
            helper.disableBoard(component);
        }
        component.set('v.clickCount', clickCount);
    }
})
