/**
 * Created by Gubki on 7/31/2022.
 */


public with sharing class ScheduleableApex implements Schedulable, Database.AllowsCallouts {
    List<Contact> contList;
    public ScheduleableApex(List<Contact> contList){
        this.contList = contList;
    }
    public void execute(SchedulableContext param1) {
        for(Contact cont: contList){
            cont.FirstName = 'SchedulerLast';
            cont.LastName = 'SchedulerLast';
        }
        update contList;
    }
}