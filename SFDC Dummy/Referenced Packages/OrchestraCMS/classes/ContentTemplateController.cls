/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ContentTemplateController {
    global Boolean allowPersonalTags {
        get;
    }
    global Boolean allowPublicTags {
        get;
    }
    global static String ATTR_CONF;
    global static String ATTR_DATA;
    global cms.ContentTreeNode children_nodes {
        get;
        set;
    }
    global cms.AttributeWrapper children_nodes_attributes {
        get;
        set;
    }
    global cms__Content__c content {
        get;
        set;
    }
    global cms__Content_Layout_Instance__c content_layout_instance {
        get;
        set;
    }
    global List<cms__Attribute__c> content_layout_instance_properties {
        get;
        set;
    }
    global cms.Properties content_layout_instance_properties_object {
        get;
        set;
    }
    global List<cms__Attribute__c> content_properties {
        get;
        set;
    }
    global cms.Properties content_properties_object {
        get;
        set;
    }
    global Boolean dynamicLoad {
        get;
        set;
    }
    global Boolean fbp {
        get;
        set;
    }
    global Boolean layout_disabled {
        get;
        set;
    }
    global Boolean layout_rendered {
        get;
    }
    global cms__Page_Content_Layout_Instance__c page_content_layout_instance {
        get;
        set;
    }
    global List<cms__Attribute__c> page_content_layout_instance_properties {
        get;
        set;
    }
    global cms.Properties page_content_layout_instance_properties_object {
        get;
        set;
    }
    global String page_mode {
        get;
        set;
    }
    global String pm {
        get;
        set;
    }
    global String pp {
        get;
        set;
    }
    global String site_name {
        get;
        set;
    }
    global String sn {
        get;
        set;
    }
    global String tab {
        get;
    }
    global String token {
        get;
    }
    global ContentTemplateController() {

    }
    global ContentTemplateController(cms.CreateContentController ccc) {

    }
    global ContentTemplateController(cms.GenerateContent gc) {

    }
    global abstract String getHTML();
    global String getLayoutInstanceProperty(String name) {
        return null;
    }
    global virtual String getLayoutInstanceProperty(String name, String namespace) {
        return null;
    }
    global String getNamespace() {
        return null;
    }
    global virtual String getOriginId() {
        return null;
    }
    global virtual Datetime getOriginalPublishedStartDate() {
        return null;
    }
    global String getPageInstanceProperty(String name) {
        return null;
    }
    global virtual String getPageInstanceProperty(String name, String namespace) {
        return null;
    }
    global virtual Object getPageProperty(String name) {
        return null;
    }
    global virtual List<Object> getPagePropertyList(String name) {
        return null;
    }
    global String getProperty(String name) {
        return null;
    }
    global virtual String getProperty(String name, String namespace) {
        return null;
    }
    global virtual cms.Link getPropertyLink(String name) {
        return null;
    }
    global virtual List<String> getPropertyList(String name) {
        return null;
    }
    global virtual String getRenderLanguage() {
        return null;
    }
    global virtual cms.ServiceAPI getServiceAPI() {
        return null;
    }
    global String getSiteName() {
        return null;
    }
    global virtual void init(Map<String,String> properties) {

    }
    global void setProperty(String name, String value, String valueType, String attrType) {

    }
    global void setProperty(String name, String value, String valueType, String attrType, Boolean required) {

    }
    global void setProperty(String name, String value, String valueType, String attrType, Boolean required, String requiredMsg) {

    }
global class ContentTemplateControllerException extends Exception {
}
}
