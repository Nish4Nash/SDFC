/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class RefreshPageCash implements Database.AllowsCallouts, Database.Batchable<SObject> {
    global String CachingKey;
    global String host;
    global String PackagePrefix;
    global String query;
    global String SecureURL;
    global RefreshPageCash(Set<Id> pageids) {

    }
    global RefreshPageCash(Set<Id> pageids, String surl) {

    }
    global RefreshPageCash(String mode, String site_name) {

    }
    global RefreshPageCash(Set<Id> pageids, String surl, String host) {

    }
    global RefreshPageCash(String mode, String site_name, String surl) {

    }
    global RefreshPageCash(String mode, String site_name, String surl, String host) {

    }
    global void execute(Database.BatchableContext BC, List<cms__Page__c> scope) {

    }
    global void finish(Database.BatchableContext BC) {

    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return null;
    }
global class CashException extends Exception {
}
}
