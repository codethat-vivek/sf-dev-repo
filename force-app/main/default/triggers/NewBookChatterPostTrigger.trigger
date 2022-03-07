trigger NewBookChatterPostTrigger on Book__c (after insert) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            BookTriggerLogic.createBooks(Trigger.new); // calling the createBooks() fn present in BookTriggerLogic class
        }
    }
}