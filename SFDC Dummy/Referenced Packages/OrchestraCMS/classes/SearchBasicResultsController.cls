/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SearchBasicResultsController extends cms.ContentTemplateController {
    global Integer executeCount {
        get;
        set;
    }
    global String page_soql_timeline {
        get;
        set;
    }
    global Datetime page_timeline {
        get;
        set;
    }
    global List<cms.SearchBasicResultsController.SearchResultItem> resultList {
        get;
        set;
    }
    global String ResultsLabel {
        get;
    }
    global String SearchedLabel {
        get;
    }
    global String searchParameters {
        get;
        set;
    }
    global SearchBasicResultsController() {

    }
    global SearchBasicResultsController(cms.CreateContentController ccc) {

    }
    global void executeSearch() {

    }
    global override String getHTML() {
        return null;
    }
    global Integer getResultsSize() {
        return null;
    }
    global List<cms.SearchBasicResultsController.SearchResultItem> getResults() {
        return null;
    }
    global override void init(Map<String,String> properties) {

    }
global class SearchResultItem {
    global String description {
        get;
        set;
    }
    global String label {
        get;
        set;
    }
    global String url {
        get;
        set;
    }
    global SearchResultItem(String label, String url, String description) {

    }
}
}
