// This class is an extension to a standard controller
public with sharing class MemberExtension {
    
    public Member__c member {get; set;}
    private ApexPages.StandardController stdController;

    public MemberExtension() {

    }
    // for this class to be an extension to a standard controller it must have a constructor like
    public MemberExtension(ApexPages.StandardController stdController){
        this.stdController = stdController;
        List<String> fieldNames = new List<String>();
        fieldNames.add('Name');
        fieldNames.add('Joined_on__C');
        fieldNames.add('email__c');
        fieldNames.add('active__c');
        stdController.addFields(fieldNames);

        // getRecord() returns a variable of sObject so we are casting it to Member object
        // sObject s ---> here s is a generic sObject
        // Member__c m ---> here is a specific sOjbect
        member = (Member__c) stdController.getRecord();
    }

    public Pagereference save(){
        try {
            //System.debug('save method of extension called');
            update member;
        } catch (DmlException ex) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.FATAL,ex.getMessage()));
            return Apexpages.currentPage();
        }
        return stdController.view();
    }

}