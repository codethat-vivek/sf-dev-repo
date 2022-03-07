trigger SampleTrigger on Author__c (after insert, after update, after delete, after undelete,
                                    before insert, before update, before delete) {
    
    if(Trigger.isBefore){// isBefore is a boolean variable. It is true, if any of the before dml events occur
        if(Trigger.isInsert){ 
            // How can you see the records for which the trigger was executed?
            // Are there context variables for this?
            // Yes
            // new, newMap, old, oldMap are the context variables. They must be used in the correct place otherwise they are just going to return a null.
            
            // Trigger.new returns a collection that are about to be inserted
            List<Author__c> newValues = Trigger.new;

        }
        else if(Trigger.isUpdate){
            // In case of before update, we can access all the 4 context variables here.

            List<Author__c> updatedValues = Trigger.new; // returns the value of the updated records
            Map<Id, Author__c> updatedValuesMap = Trigger.newMap;
            List<Author__c> oldValues = Trigger.old; // returns the old values of the records that are about to be updated.
            Map<Id, Author__c> oldValuesMap = Trigger.oldMap;

        }
        else if(Trigger.isDelete){
            // Here we can access 2 context variables

            List<Author__c>deletedValues = Trigger.old;
            Map<Id, Author__c> deletedValuesMap = Trigger.oldMap;
        }
        else if(Trigger.isUndelete){
            // Code...
            // this code is never going to false i.e. here in this case isUndelete will always be false
            // because there is no such dml event(before undelete)
        }
    }
    else if(Trigger.isAfter){
        if(Trigger.isInsert){
            // 2 context variables can be accessed here
            
            List<Author__c> newValues = Trigger.new;
            Map<Id, Author__c> newValuesMap = Trigger.newMap;
        }
        else if(Trigger.isUpdate){
            // All 4 context variables can be accessed here.

            List<Author__c> updatedValues = Trigger.new; 
            Map<Id, Author__c> updatedValuesMap = Trigger.newMap;
            List<Author__c> oldValues = Trigger.old; 
            Map<Id, Author__c> oldValuesMap = Trigger.oldMap;
        }
        else if(Trigger.isDelete){
            // 2 context variables can be accessed here.

            List<Author__c>deletedValues = Trigger.old;
            Map<Id, Author__c> deletedValuesMap = Trigger.oldMap;
        }
        else if(Trigger.isUndelete){
            // 2 context variables can be accessed here.

            List<Author__c>unDeletedValues = Trigger.new;
            Map<Id, Author__c> unDeletedValuesMap = Trigger.newMap;
        }
    }

    
    // Apart from if-else we can also write a switch-when
    switch on Trigger.operationType {
        when BEFORE_INSERT{ }
        when BEFORE_UPDATE{ }
        when BEFORE_DELETE{ }
        when AFTER_INSERT{ }
        when AFTER_UPDATE{ }
        when AFTER_DELETE{ }
        when AFTER_UNDELETE{ }

    }
    

}