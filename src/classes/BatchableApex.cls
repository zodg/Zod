/**
 * Created by Gubki on 7/31/2022.
 */

public with sharing class BatchableApex implements Database.Batchable<SObject>, Database.AllowsCallouts {

    String query;
    public BatchableApex(String query) {
        this.query = query;
    }

    public Database.QueryLocator start(Database.BatchableContext param1) {
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext param1, List<Contact> contList) {
        for (Contact cont : contList) {
            if (contList.size() != null && !cont.Email.contains('l&amp;t.net')) {
                try {
                    cont.FirstName = 'Batchable class name';

                    update contList;
                } catch (Exception e) {
                    System.debug('Null pointer exception occurred :::' + e.getMessage());
                }
            }
        }
    }

    public void finish(Database.BatchableContext param1) {
    }
}

