public with sharing class Member_Security_Test {
    public Member__c member{get;set;}
    public Member_Security_Test() {
        Id recId = ApexPages.currentPage().getParameters().get('Id');
        member = [SELECT name, email__c, joined_on__c FROM Member__C
                 where Id = :recId];
    }
    public void save(){
        try{
            MemberDAO.updateMember(member);
        }
        catch(DmlException ex){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.FATAL, ex.getMessage()));
        }

    }
}