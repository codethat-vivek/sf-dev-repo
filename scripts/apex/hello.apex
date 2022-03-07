// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// boolean blnval;
// integer ival;
// double dblval;
// Long lngval;
// String str;
// Id rId;
// Date dt;
// Time tm;
// Datetime dtime;

// blnval = true;
// ival = 2343;
// dblval = 23.2453;
// lngval = 40483548;
// str = 'My name is Vivek';
// dt = System.Date.newInstance(2022, 2, 24);
// tm = System.Time.newInstance(18, 5, 23, 55);
// dtime = System.datetime.newInstance(dt, tm);

// System.debug(blnval);
// System.debug(ival);
// System.debug(dblval);
// System.debug(lngval);
// System.debug(str);
// System.debug(dt);
// System.debug(tm);
// System.debug(dtime);


// for(integer x=1; x<10; x++){
//     System.debug(x);
// }
// integer x=16, y=8;
// while (y < 10) {
//     System.debug(y);
//     y++;
// }
// do{
//     System.debug(x);
//     x++;
// }while(x < 20);


// // data types that are allowed with switch case are -
// // integer, long, sobject, string, enum
// Integer rank = 10;
// switch on rank{
//     when 1{System.debug('Great!');}
//     when 2,3{System.debug('very good');}
//     when 4,5{System.debug('good');}
//     when else{System.debug('ok');}
// }

// Season s;
// s = Season.SUMMER;
// System.debug(s);


// Triangle t = new Triangle(); // Constructor of Shape Class ----> Constructor of Triangle Class
// t.calculateArea();
// t.normalMethod();


// List<Book__c>lst = new List<Book__c>();
// lst.add(new Book__c(Name='Book-01', Quantity__c=2));
// lst.add(new Book__c(Name='Book-02', Quantity__c=3));
// lst.add(new Book__c(Name='Book-03', Quantity__c=4));

// for(Book__c c : lst){
//     System.debug('==================');
//     System.debug(c.Name);
//     System.debug(c.Quantity__c);
// }

// Set<Account>st = new Set<Account>();
// st.add(new Account(Name='Acc-1'));
// st.add(new Account(Name='Acc-2'));
// st.add(new Account(Name='Acc-3'));
// st.add(new Account(Name='Acc-4'));
// st.add(new Account(Name='Acc-5'));

// for(Account a : st){
//     System.debug('=====================');
//     System.debug(a.Name);
// }


// Map<Book__c, List<Book_Copy__c>>bookmap = new Map<Book__c, List<Book_Copy__c>>();
// bookmap.put(new Book__c(Name='Book-01'), new List<Book_Copy__c>());
// bookmap.put(new Book__c(Name='Book-02'), new List<Book_Copy__c>());
// bookmap.put(new Book__c(Name='Book-03'), new List<Book_Copy__c>());
// bookmap.put(new Book__c(Name='Book-04'), new List<Book_Copy__c>());

// for(Book__c key : bookmap.keyset()){
//     for(Book_Copy__c bkcpy : bookmap.get(key)){
//         System.debug(bkcpy.name);
//     }
// }


// // parent-child relationship query
// List<Member__c> members = [SELECT Name, Email__c, Joined_On__c, (SELECT Name, Issued_On__c FROM Borrowers__r)
//                           FROM Member__c 
//                           WHERE Id='a015j00000AvfK4AAJ'];

// for(Member__c m : members){
//     System.debug(m.name + '-----' + m.Email__c);
//     for(Borrower__c b : m.Borrowers__r){
//         System.debug(b.name + '-----' + b.Issued_On__c);
//     }
// }


// SOQL for loop
Savepoint sp = Database.setsavepoint();
List<Book__c> books = new List<Book__c>();
for(integer i = 1; i<= 1000; i++){
    books.add(new Book__c(name='Book' + i));
}
insert books;

// 1) we can not retrieve more than 50k records like this.
// 2) it can cause heap size issues(heap size is 6MB).
// 3) Such way of retrieving data over a large number of records will thus result in System.limitException
// books = [SELECT name from Book__c]


// Solution to the above problem is SOQL for loop
// SOQL for loop is efficient because retrieving of records happens only in a batch size of 200.
for(List<Book__c> bks : [SELECT name from Book__c]){
    // System.debug(bks.size());
    for(Book__c b : bks){
        // System.debug(b.name);
    }
}

Database.rollback(sp);

