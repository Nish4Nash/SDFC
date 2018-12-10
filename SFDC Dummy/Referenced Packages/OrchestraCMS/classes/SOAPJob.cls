/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SOAPJob {
    global SOAPJob() {

    }
    webService static List<cms.SOAPJob.SOAPJobItem> getJobsByTypes(Datetime startDate, List<Integer> jobTypes) {
        return null;
    }
    webService static List<cms.SOAPJob.SOAPJobItem> getJobs(Datetime startDate) {
        return null;
    }
    webService static cms.SOAPJob.SOAPJobResult processJobItem(String Id, String Type) {
        return null;
    }
    webService static List<cms.SOAPJob.SOAPJobItem> releaseJobs(List<Id> jobIds, String reason) {
        return null;
    }
global class SOAPJobItem {
    webService String jobId {
        get;
        set;
    }
    webService String jobType {
        get;
        set;
    }
    global SOAPJobItem() {

    }
}
global class SOAPJobResult {
    webService String message {
        get;
        set;
    }
    webService String status {
        get;
        set;
    }
    global SOAPJobResult() {

    }
}
}
