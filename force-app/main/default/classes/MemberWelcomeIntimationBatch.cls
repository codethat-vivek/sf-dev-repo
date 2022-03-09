public with sharing class MemberWelcomeIntimationBatch implements Database.Batchable<Member__c>{

    public System.Iterable<Member__c> start(Database.BatchableContext ctx){
        Date today = System.today();
        List<Member__c> members = [SELECT email__c, name FROM Member__c WHERE active__c=true AND joined_on__c = :today];
        return members;
    }

    public void execute(Database.BatchableContext ctx, List<Member__c> members){
        for(Member__c member : members){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[]{member.email__c};
            mail.setToAddresses(toAddresses);

            mail.setSubject('Welcome to Library Management System');
            String body = 'Dear ' + member.name + '\n Welcome' + '\n We are pleased to have you' + '\n Thank you!';
            mail.setPlainTextBody(body);
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        }
    }
    
    public void finish(Database.BatchableContext ctx){

    }
}