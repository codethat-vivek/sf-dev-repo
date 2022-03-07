// Queueable Apex
System.enqueueJob(new CaseEscalationQueue([SELECT Id, slaviolation__c, isEscalated 
                                           FROM Case 
                                           WHERE status = 'New' and Priority = 'High']));


// Batch Apex
Database.executeBatch(new MemberWelcomeIntimationBatch());



// Schedulable Apex
// 0 seconds, 0 minutes, 0 hours, Everyday, Every Month, Day of the week ---- 0 0 0 * * ? ---- Schedule the task everyday at midnight
// System.abort('Campaign Task Scheduler', '0 0 0 * * ?', new CampaignTaskScheduler());
// System.abortJob('7075j000013lgaM');

