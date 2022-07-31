/**
 * Created by Gubki on 7/31/2022.
 */

public with sharing class SyncrounousApex {

    public void syncMethod(){
        List<Contact> contList = [SELECT Id, FirstName, LastName, Email FROM Contact Where Id ='0037R000036LsIi' LIMIT 1];
        contList[0].Email = 'Sync@hotmail.com';
        String query = 'SELECT Id, FirstName, LastName, Email FROM Contact';
        Database.executeBatch(new BatchableApex(query), 5);
        /*
        ScheduleableApex sched = new ScheduleableApex(contList);
        String cron = '0 3 18 * * ?';
        System.schedule('Sched job', cron, sched);
        */

        /*
        QueueableClass queueClass = new QueueableClass(contList[0]);
        System.enqueueJob(queueClass);
        SyncronousApex.futureMethod(contList[0].Id);
        */
        System.debug('This is the contact in syncMethod :::' + contList[0]);
        update contList;
    }

    @Future(Callout=true)
    public static void futureMethod(Id contactId) {
        List<Contact> contList = [SELECT Id, FirstName, LastName FROM Contact WHERE Id = :contactId];
        if (contList != null) {
            contList[0].LastName = 'Future';
            contList[0].FirstName = 'This is';
            System.debug('This is the contact in the async Method' + contList[0]);
            update contList;
        }
    }
}

