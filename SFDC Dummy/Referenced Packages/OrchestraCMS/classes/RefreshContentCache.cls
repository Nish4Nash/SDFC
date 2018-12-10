/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class RefreshContentCache implements Database.AllowsCallouts, Database.Batchable<SObject> {
    global String level;
    global List<Id> object_ids {
        get;
        set;
    }
    global String query;
    global RefreshContentCache(List<Id> object_ids) {

    }
    global RefreshContentCache(String level, String site_name) {

    }
    global RefreshContentCache(List<Id> object_ids, String session, String inst) {

    }
    global RefreshContentCache(String level, String site_name, Boolean sendEmailNotification) {

    }
    global RefreshContentCache(String level, String site_name, String session, String inst) {

    }
    global RefreshContentCache(String level, String site_name, String session, String inst, Boolean sendEmailNotification) {

    }
    global void execute(Database.BatchableContext BC, List<SObject> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return null;
    }
}
