/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class MenuNode {
    global Boolean active {
        get;
        set;
    }
    global Map<Integer,List<cms.MenuNode>> children {
        get;
        set;
    }
    global String display {
        get;
        set;
    }
    global Boolean firstActive {
        get;
        set;
    }
    global Integer groupNumber {
        get;
        set;
    }
    global String internal_link_origin {
        get;
        set;
    }
    global String item_type {
        get;
        set;
    }
    global String javascript {
        get;
        set;
    }
    global Boolean lastActive {
        get;
        set;
    }
    global Integer level {
        get;
        set;
    }
    global String menu_index {
        get;
        set;
    }
    global cms__Content__c menu_item {
        get;
        set;
    }
    global Integer middle {
        get;
        set;
    }
    global String page_mode {
        get;
        set;
    }
    global cms.MenuNode parent {
        get;
        set;
    }
    global String preview_parameters {
        get;
        set;
    }
    global cms.Properties properties {
        get;
        set;
    }
    global String site_name {
        get;
        set;
    }
    global String styleClass {
        get;
        set;
    }
    global String subName {
        get;
        set;
    }
    global String target {
        get;
        set;
    }
    global String targetPage {
        get;
        set;
    }
    global MenuNode(cms__Content__c mi, List<cms__Attribute__c> attribs, String pm, String sn, String pp, cms.MenuNode p) {

    }
    global MenuNode(cms__Content__c mi, List<cms__Attribute__c> attribs, String pm, String sn, String pp, cms.MenuNode p, Integer offset, cms.Menu m) {

    }
    global String childrenToJSON() {
        return null;
    }
    global List<cms__Content__c> getAllChildren() {
        return null;
    }
    global String getClasses() {
        return null;
    }
    global List<cms__Content__c> getImmediateChildren() {
        return null;
    }
    global Id getItemPageId() {
        return null;
    }
    global String getMenuItemName() {
        return null;
    }
    global String getOrder() {
        return null;
    }
    global List<cms.MenuNode> getOrderedChildren() {
        return null;
    }
    global List<cms.MenuNode.MenuNodeGroup> getOrderedGroups() {
        return null;
    }
    global Boolean hasChildren() {
        return null;
    }
    global String toJSON() {
        return null;
    }
global class MenuNodeGroup {
    global List<cms.MenuNode> children {
        get;
        set;
    }
    global Integer groupNumber {
        get;
        set;
    }
    global MenuNodeGroup(Integer n) {

    }
}
}
