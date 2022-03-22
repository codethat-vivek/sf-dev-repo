import { LightningElement, track } from 'lwc';

export default class BmiCalculator extends LightningElement {
    
    // here cardTitle, weight and height are private and non-reactive properties
    cardTitle = "BMI Calculator";
    weight;
    height;

    @track bmi; // here bmi is private and reactive property
    onWeightChange(event){
        this.weight = parseFloat(event.target.value);
    }
    onHeightChange(event){
        this.height = parseFloat(event.target.value);
    }
    calculateBMI(){
        this.bmi = this.weight/(this.height*this.weight);
    }
}