import { LightningElement, track } from 'lwc';

export default class SimpleCalculator extends LightningElement {
    @track result;
    @track previousResults = []
    @track showPreviousResults = false;

    firstNumber;
    secondNumber;

    numChangeHandler(event){
        const inputBoxName = event.target.name;
        if(inputBoxName === 'firstNumber'){
            this.firstNumber = event.target.value;
        }
        else if(inputBoxName === 'secondNumber'){
            this.secondNumber = event.target.value;
        }
    }

    addHandler(){
        const firstNum = parseInt(this.firstNumber);
        const secondNum = parseInt(this.secondNumber);
        this.result = "Result = " + firstNum + secondNum;
        this.previousResults.push(this.result);
    }

    subtractHandler(){
        const firstNum = parseInt(this.firstNumber);
        const secondNum = parseInt(this.secondNumber);
        this.result = "Result = " + (firstNum - secondNum);
        this.previousResults.push(this.result);
    }
    
    multiplyHandler(){
        const firstNum = parseInt(this.firstNumber);
        const secondNum = parseInt(this.secondNumber);
        this.result = "Result = " + firstNum * secondNum;
        this.previousResults.push(this.result);
    }

    divideHandler(){
        const firstNum = parseInt(this.firstNumber);
        const secondNum = parseInt(this.secondNumber);
        this.result = "Result = " + firstNum / secondNum;
        this.previousResults.push(this.result);
    }

    showPreviousResultsToggle(event){
        this.showPreviousResults = event.target.checked;
    }
    
}