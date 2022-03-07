public with sharing class CampaignTaskScheduler implements Schedulable{

    public void execute(System.SchedulableContext ctx){
        List<Campaign> campaigns = [SELECT Id, name, startdate FROM Campaign WHERE status='Planned' AND (startdate = :system.date.TODAY()+3)];
        List<Task> tasks = new List<Task>();

        for(Campaign c : campaigns){
            Task task = new Task();
            task.subject = 'Schedule meeting for ' + c.name + ' campaign';
            task.OwnerId = c.OwnerId;
            task.ActivityDate = System.Date.today();
            task.WhatId = c.id;
            task.status = 'Not Started';
            tasks.add(task);
        }
        if(tasks.size() > 0) insert tasks;
    }

}
