/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class MenuController extends cms.ContentTemplateController {
    global Map<Id,List<cms__Attribute__c>> child_attributes {
        get;
    }
    global String EnableSmartActiveItem {
        get;
    }
    global String RenderDepth {
        get;
    }
    global String StartNode {
        get;
    }
    global MenuController() {

    }
    global MenuController(cms.CreateContentController ccc) {

    }
    global MenuController(cms.GenerateContent gc) {

    }
    global virtual String getActiveIndex() {
        return null;
    }
    global virtual String getActiveMenuItem() {
        return null;
    }
    global virtual cms.MenuNode getActiveNode() {
        return null;
    }
    global abstract String getHTML();
    global virtual cms.MenuNode getNodeByIndex(String index) {
        return null;
    }
    global virtual List<cms.MenuNode> getOrderedRootNodes() {
        return null;
    }
}
