public class Book_Custom_Controller {
    // data member/attribute/property
    private Book__c book; // here book is sObject(salesforce object) of type Book__c.
    private List<Book__c> books; // list of books
    private Integer bookRecordCount;

    // transient keyword is added so that it does not contribute to the view state.
    private transient final Integer MAX_RECORDS_PER_PAGE = 5; // final variable(it's value can't be changed)
    
    public Integer startingFrom{set;get;} // this basically means that startingFrom is a private Integer variable and it's setter and getter already written.

    // Nested class for demonstration of <apex:actionFunction />
    @testvisible
    private class BookCopiesWrapper{
         public integer bookCopyUnissuedQty{get;set;}
         public Id bookRecordId{get;set;}
    }

    //Nested class for demonstration of <apex:actionSupport />
    @testvisible
    private class BorrowerTrendWrapper{
        public integer borrowerCount{get;set;}
        public Id bookRecordId{get;set;}
    }

    public BookCopiesWrapper bookCopiesWrapper{get; set;} // variable of BookCopiesWrapper class
    public BorrowerTrendWrapper borrowerTrendWrapper{get; set;} // variable of BorrowerTrendWrapper class

    public Book_Custom_Controller() {
        Id bookRecordId; // Id data type is primarily used to store record id
        bookRecordId = ApexPages.currentPage().getParameters().get('id'); // getting record id from url

        if(startingFrom == null)startingFrom = 0;
        if(bookRecordId == null)book = new Book__c(); // empty instance of sobject
        else{
            book =  [SELECT Name, Genre__c, Quantity__c, Description__c, Number_of_Authors__c 
                    from Book__c
                    where Id = :bookRecordId
                    ]; // SOQL query
        }

        bookRecordCount = [Select COUNT() from Book__c];

        //initializing the object BookCopiesWrapper class
        bookCopiesWrapper = new BookCopiesWrapper();
        borrowerTrendWrapper = new BorrowerTrendWrapper();
    }

    public List<Book__c> getBooks(){
        books = [SELECT Name, Genre__C, Quantity__c, Number_of_Authors__c
                FROM Book__c
                ORDER BY Name
                LIMIT :MAX_RECORDS_PER_PAGE
                OFFSET :startingFrom];
        return books;
    }

    public Book__c getBook(){return this.book;} // getter function
    public void setBook(Book__c book){this.book = book;} // setter function


    // ACTION METHODS
    public Pagereference save(){ // pagereference objects are used to navigate between pages
        try{
            upsert book; // This is an apex dml statement
        }
        catch(DmlException ex){
            // exception in this case can arrise when-
            // (1) a record is created/updated and it might trigger a validation rule.
            // (2) a mandatory field is not filled.
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL, ex.getMessage()));
            return ApexPages.currentPage();
        }

        Pagereference pg;
        pg = new ApexPages.StandardController(book).view(); // view method returns a pagereference object to the record detail page
        return pg;
    }

    public Pagereference previous(){
        if(startingFrom <= 0)startingFrom = 0;
        else if(startingFrom >= bookRecordCount)startingFrom = startingFrom - MAX_RECORDS_PER_PAGE;
        else if(startingFrom < bookRecordCount)startingFrom = startingFrom - MAX_RECORDS_PER_PAGE;
        return ApexPages.currentPage();
    }

    public Pagereference next(){
        if( (bookRecordCount - startingFrom)  > MAX_RECORDS_PER_PAGE)
            startingFrom = startingFrom + MAX_RECORDS_PER_PAGE;
        return ApexPages.currentPage();
    }


    public void unIssuedBookCount(){
        bookCopiesWrapper.bookCopyUnissuedQty = [SELECT COUNT() FROM Book_Copy__c 
                                                WHERE Book__c = :bookCopiesWrapper.bookRecordId
                                                AND Issued__c = false];
    }

    public void borrowerTrend(){
        Date today = System.date.today();
        Date lastYearDate = today.addYears(-1);
        borrowerTrendWrapper.borrowerCount = [SELECT COUNT() FROM Borrower__c
                                              WHERE Book_Copy__r.Book__c = :borrowerTrendWrapper.bookRecordId
                                              AND (Issued_On__c <= :today AND Issued_On__c >= :lastYearDate)];
        
    }

    @remoteaction
    public static integer unIssuedBookCountRemote(Id bookRecordId){
        return [SELECT COUNT() FROM Book_Copy__c
                WHERE Book__c = :bookRecordId AND Issued__c = false];
    }
    
}