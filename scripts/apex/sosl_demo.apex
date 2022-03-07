// SOSL returns a list of list of sObjects.
List<List<SObject>> results;

// All fields include - Name, Phone, Email, SideBar 
results = [FIND 'ri* or sa* or the' in ALL FIELDS RETURNING Member__c(Name, email__c),
                                             Author__c(Name),
                                             Contact(Name),
                                             Book__c(name order by name)];
for(List<SObject> sList : results){
    for(SObject s : sList){
        switch on s {
            when Member__c m{
                System.debug(m.Id);
                System.debug(m.name);
                System.debug(m.email__c);
            }
            when Author__c a{
                System.debug(a.Id);
                System.debug(a.name);
            }
            when Contact c{
                System.debug(c.Id);
                System.debug(c.name);
            }
            when Book__c b{
                System.debug(b.Id);
                System.debug(b.name);
            }
        }
    }
}