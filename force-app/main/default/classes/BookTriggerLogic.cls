public inherited sharing class BookTriggerLogic { 
    public BookTriggerLogic() {

    }
    public static void createBooks(List<Book__c>newBooks){
        List<FeedItem> feeds = new List<FeedItem>(); // Feeditems are objects that are used to post messages on chatter

            for(Book__c b : newBooks){
                FeedItem feed = new FeedItem();
                feed.body = 'We have added ' + b.name + ' to our collection';
                feed.parentId = UserInfo.getUserId();

                //insert feed; // Never do this i.e dml inside a for loop. It can cause System.LimitException and this exception can not be caught in try catch block also. It exceeds the governor limits.

                feeds.add(feed);

            }

            if(feeds.size() > 0) insert feeds; // bulk insert

    }
}