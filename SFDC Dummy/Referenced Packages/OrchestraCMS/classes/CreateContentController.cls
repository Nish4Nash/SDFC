/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CreateContentController extends cms.UiController {
    global cms__Content__c content {
        get;
        set;
    }
    global List<cms__Attribute__c> content_properties {
        get;
        set;
    }
    global cms__Content_Layout_Instance__c current_content_layout_instance {
        get;
        set;
    }
    global List<cms__Attribute__c> current_content_layout_instance_properties {
        get;
        set;
    }
    global Boolean disableAll {
        get;
        set;
    }
    global CreateContentController() {

    }
    global String getCKEditorConfig() {
        return null;
    }
}
