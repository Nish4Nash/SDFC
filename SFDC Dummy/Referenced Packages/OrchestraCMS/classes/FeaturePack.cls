/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FeaturePack {
    global String Description {
        get;
        set;
    }
    global List<cms.FeaturePack.PackageFeature> Features {
        get;
        set;
    }
    global String Name {
        get;
        set;
    }
    global cms.FeaturePack.PackageProvider Provider {
        get;
        set;
    }
    global String Version {
        get;
        set;
    }
    global FeaturePack() {

    }
    global String toJSON(Boolean pretty) {
        return null;
    }
global class ContentLayout {
    global Boolean AutoCreate;
    global String CKEditorConfigPage;
    global String ControllerClass;
    global String EditPage;
    global Boolean IsContentCacheable;
    global Boolean IsDefault;
    global Boolean IsPageCacheable;
    global String Javascript1;
    global String Javascript2;
    global String Javascript3;
    global String Label;
    global Boolean Listable;
    global String Name;
    global String PagePropertiesJSON;
    global String ResourceName;
    global String ResourceNamespace;
    global String Stylesheet1;
    global String Stylesheet2;
    global String Stylesheet3;
    global String ThumbnailFilepath;
    global String ViewPage;
    global ContentLayout() {

    }
}
global class PackageFeature {
    global cms.FeaturePack.cType ContentType;
    global String Description;
    global String Label;
    global String LicenseIdentifier;
    global Integer TrialDuration;
    global PackageFeature() {

    }
}
global class PackageProvider {
    global String Email;
    global String Name;
    global String Phone;
    global PackageProvider() {

    }
}
global class cType {
    global Boolean Automatic;
    global List<cms.FeaturePack.ContentLayout> ContentLayouts;
    global Boolean HasChildren;
    global String Label;
    global String Name;
    global cType() {

    }
}
}
