import { LightningElement, track } from 'lwc';

export default class HelloWorld extends LightningElement {
    @track name = "Vivek Kumar";
    nameChangeHandler(event){
        this.name = event.target.value;
    }

    @track displayContent = false;
    showContentHandler(event){
        this.displayContent = event.target.checked;
    }

    @track cityList = ["Ranchi", "Patna", "Jehanabad", "Delhi", "Pune", "Bhopal", "Kolkata"]

}
