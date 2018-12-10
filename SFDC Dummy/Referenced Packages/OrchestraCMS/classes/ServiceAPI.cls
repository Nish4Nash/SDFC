/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ServiceAPI implements cms.ServiceInterface {
    global static String RESULT_STATUS_ERROR;
    global static String RESULT_STATUS_SUCCESS;
    global static String escapeForSOSL(String input) {
        return null;
    }
    global String executeRequest(Map<String,String> params) {
        return null;
    }
    global Map<String,String> generateMediaUrls(List<String> libContList) {
        return null;
    }
    global Map<String,String> generateSignedAmazonUrl(List<String> libContIdList, Boolean setFriendlyDownloadFileName) {
        return null;
    }
    global Map<String,String> generateSignedAmazonUrl(List<cms__Library_Content__c> libContList, Boolean setFriendlyDownloadFileName) {
        return null;
    }
    global List<List<cms__Tag__c>> getActiveTagsForContent(String contentID) {
        return null;
    }
    global Map<String,List<List<cms__Tag__c>>> getActiveTagsForContent(Set<String> contentIDs) {
        return null;
    }
    global List<List<cms__Tag__c>> getActiveTagsForPage(String pageID) {
        return null;
    }
    global List<List<cms__Tag__c>> getAllTagsForContent(String contentID) {
        return null;
    }
    global Map<String,List<List<cms__Tag__c>>> getAllTagsForContent(Set<String> contentIDs) {
        return null;
    }
    global List<List<cms__Tag__c>> getAllTagsForPage(String pageID) {
        return null;
    }
    global Map<Id,List<cms__Attribute__c>> getContentAttributes(List<cms__Content__c> content) {
        return null;
    }
    global cms.TagContentGroup getContentByTaxonomyGrouping(List<String> tagPathList, String contentType, List<String> contentLayouts, String cOrder) {
        return null;
    }
    global List<Map<String,String>> getContentByTaxonomyPaths(String cOrder, List<String> tagPathList, String contentType, List<String> layout_sets, Integer maxItems, Integer offSet) {
        return null;
    }
    global List<Map<String,String>> getContentByTaxonomyPaths(String cOrder, List<String> tagPathList, String contentType, List<String> layout_sets, String mode) {
        return null;
    }
    global List<cms.ServiceAPI.ContentObject> getContentObjectsByTaxonomyPaths(String cOrder, List<String> tagPathList, String contentType, List<String> layout_sets, Integer maxItems, Integer offSet) {
        return null;
    }
    global List<cms__Content__c> getContentsByTag(List<String> tagsList, Set<String> contentLayoutsSet, Integer nTotalRetrieved, Boolean bExactTagMatch) {
        return null;
    }
    global List<cms__Content__c> getContentsByTag(List<String> tagsList, Set<String> contentLayoutsSet, Integer nTotalRetrieved, Boolean bExactTagMatch, String cOrder) {
        return null;
    }
    global String getGeneratedContent(String pageContentLayoutInstanceID) {
        return null;
    }
    global String getGeneratedContent(String contentID, String contentLayoutName) {
        return null;
    }
    global Map<Id,Map<String,String>> getGeneratedContentHaveLatestOld(List<cms__Content__c> content, List<List<String>> layouts, Integer maxRenderings, Map<Id,Boolean> has_children_map) {
        return null;
    }
    global Map<Id,Map<String,String>> getGeneratedContentHaveLatest(List<cms__Content__c> content, List<List<String>> layouts, Integer maxRenderings) {
        return null;
    }
    global Map<Id,String> getGeneratedContentHaveLatest(List<cms__Content__c> content, List<String> layouts) {
        return null;
    }
    global Map<Id,String> getGeneratedContent(List<cms__Content__c> content, List<String> layouts) {
        return null;
    }
    global Map<Id,String> getGeneratedContent(List<cms__Page_Content_Layout_Instance__c> pclis) {
        return null;
    }
    global String getGeneratedPage(String pageID, Map<String,String> params) {
        return null;
    }
    global List<Map<String,String>> getLanguageOptions() {
        return null;
    }
    global cms__Content__c getLatestContentVersion(String id) {
        return null;
    }
    global cms__Content__c getLatestContentVersion2(String id, Boolean withAttributes) {
        return null;
    }
    global Map<Id,cms__Content__c> getLatestContentVersions2(List<String> ids, Boolean withAttributes) {
        return null;
    }
    global List<cms__Content__c> getLatestContentVersions(List<String> contentTypeNames, List<String> contentLayoutNames) {
        return null;
    }
    global List<cms__Content__c> getLatestContentVersions(List<String> contentTypeNames, List<String> contentLayoutNames, Boolean withAttributes) {
        return null;
    }
    global Map<Id,cms__Content__c> getLatestContentVersions(List<String> ids) {
        return null;
    }
    global cms__Page__c getLatestPageVersion(String id) {
        return null;
    }
    global Map<Id,cms__Page__c> getLatestPageVersions(List<String> ids) {
        return null;
    }
    global String getLinkToHomePage() {
        return null;
    }
    global String getLinkToPage(String pageName) {
        return null;
    }
    global String getLinkToPage(String pageName, String parameters) {
        return null;
    }
    global String getLinkToPage(String pageName, Map<String,String> parameters) {
        return null;
    }
    global List<cms__Page__c> getPagesByTag(List<String> tagsList, Integer nTotalRetrieved, Boolean bExactTagMatch) {
        return null;
    }
    global String getRenderLanguage() {
        return null;
    }
    global List<cms.SubscriptionInfo> getSubscriptionInfo(List<List<cms__Tag__c>> activeTagList) {
        return null;
    }
    global Map<Id,cms.TaxonomyInfo> getTaxonomyInfo(List<Id> taxonomyIds) {
        return null;
    }
    global Map<String,cms.TaxonomyInfo> getTaxonomyInfo(List<String> taxonomyNames) {
        return null;
    }
    global System.Type getType() {
        return null;
    }
    global Map<String,List<String>> getUserTargetFilters(User u) {
        return null;
    }
    global Map<Id,String> getUserTargets(User u) {
        return null;
    }
    global Boolean hasFeatureAccess(String licenseIdentifier, String usage) {
        return null;
    }
    global Boolean isRequestFromAjaxEndPoint() {
        return null;
    }
    global String loginToSite(Map<String,String> parameters) {
        return null;
    }
    global List<String> searchContent(String term, Set<String> contentTypes, Integer maxResults) {
        return null;
    }
    global static Map<String,cms.ServiceAPI.ServiceResult> suspend(List<String> tokens) {
        return null;
    }
    global static Map<String,cms.ServiceAPI.ServiceResult> unsubscribe(List<String> tokens) {
        return null;
    }
    global Boolean verifySessionToken() {
        return null;
    }
global class ContentObject {
    global Id contentId {
        get;
        set;
    }
    global List<String> PathList {
        get;
        set;
    }
    global Map<String,String> Rendering {
        get;
        set;
    }
    global ContentObject() {

    }
}
global class ServiceException extends Exception {
}
global class ServiceResult {
    global ServiceResult() {

    }
    global String getCode() {
        return null;
    }
    global String getMessage() {
        return null;
    }
}
}
