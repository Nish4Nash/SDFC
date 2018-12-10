/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class Menu {
    global cms.MenuNode activeNode {
        get;
        set;
    }
    global Boolean filter_by_profile {
        get;
        set;
    }
    global Map<String,cms.MenuNode> index_node_map {
        get;
        set;
    }
    global cms.ContentTreeNode menu_items {
        get;
        set;
    }
    global List<cms.MenuNode> ordered_root_items {
        get;
    }
    global List<cms.MenuNode> root_items {
        get;
    }
    global Menu(cms__Content__c m, String pm, String sn, String pp, Boolean fbp) {

    }
    global Menu(cms__Content__c m, String pm, String sn, String pp, String ActiveItem, Boolean fbp, cms.ContentTreeNode c, Map<Id,List<cms__Attribute__c>> c_attributes) {

    }
    global Menu(cms__Content__c m, String pm, String sn, String pp, String ActiveItem, Boolean fbp, cms.ContentTreeNode c, Map<Id,List<cms__Attribute__c>> c_attributes, Id activePageId) {

    }
}
