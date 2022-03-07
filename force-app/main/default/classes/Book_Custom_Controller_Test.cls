// @istest annotation is to define classes and methods that only contain code used for 
// testing your application.
@istest
public inherited sharing class Book_Custom_Controller_Test {

    @TestSetup
    public static void setupTest(){
        Book__c book = new Book__c(Name='Dummy Book');
        insert book;
        List<Book_Copy__c> bkcopies= new List<Book_Copy__c>();
        for(integer x = 1; x <= 5; x++){
            bkcopies.add(new Book_Copy__c(book__c = book.id, issued__c = (math.mod(x, 2) == 0) ));
        }
        insert bkcopies;
    }

    @istest
    public static void testUnIssuedBookCount_1(){
        Book__c book = [SELECT Id from Book__c where name like 'Dummy%'];

        // creating an object of the class will execute the constructor of that class and 
        // if the constructor contains dml statements or soql queries, all these will be 
        // added to the statements/queries of the present tester class and then checked against 
        // the governor limits. Solution for this is to use - Test.startTest() and Test.stopTest()
        // What Test.startTest() does is that it sets all the limits so far used by the class to 0.

        Test.startTest();
        Book_Custom_Controller controller = new Book_Custom_Controller(); 
        controller.bookCopiesWrapper.bookRecordId = book.id;
        controller.unIssuedBookCount();
        Test.stopTest();

        System.assert(controller.bookCopiesWrapper.bookCopyUnissuedQty == 3);
    }


    @istest
    public static void testBorrowerTrend_1(){
        Book__c book = [SELECT Id, (Select Id from Book_Copies__r) from Book__c where name like 'Dummy%'];
        List<Borrower__c>borrowers = new List<Borrower__c>();
        for(integer x = 0; x < 5; x++){
            borrowers.add(new Borrower__c(Book_Copy__c = book.book_copies__r[x].id, issued_on__c = System.Date.newInstance(2022, 1, 1)));
        }
        insert borrowers;

        Test.startTest();
        Book_Custom_Controller controller = new Book_Custom_Controller();
        controller.borrowerTrendWrapper.bookRecordId = book.id;
        controller.borrowerTrend();
        Test.stopTest();

        System.assert(controller.borrowerTrendWrapper.borrowerCount == 5);

    }
    
    @istest
    public static void testConstructor_1(){
        Test.setCurrentPage(Page.Book_VF_Page_Custom_Controller);
        Test.startTest();
        Book_Custom_Controller controller = new Book_Custom_Controller();

        Test.stopTest();

        System.assert(controller.getbook().id == null);

    }

    @istest
    public static void testConstructor_2(){
        Book__c book = [SELECT Id FROM Book__c WHERE name like 'Dummy%'];
        Test.setCurrentPage(Page.Book_VF_Page_Custom_Controller);
        ApexPages.currentPage().getParameters().put('id', book.id);

        Test.startTest();
        Book_Custom_Controller controller = new Book_Custom_Controller();
        Test.stopTest();

        System.assert(controller.getbook().id == book.id);

    }
}
