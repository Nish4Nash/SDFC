global virtual with sharing class CustomInfoCardController extends cms.ContentTemplateController {
//extend the cms.ContentTemplateController for all custom content

// Constructor for Edit Page
global CustomInfoCardController (cms.CreateContentController cc) {
this.content = cc.content;
this.content_properties = cc.content_properties;
}


        // Default Constructor
        global CustomInfoCardController (){}
    
        // getHTML method for returning programmatically generated HTML to the Generate Page
        global virtual override String getHTML() {   // For generated markup    
            return '';
        }
    
        // Methods to get the attribute values for the content
        public String thumbnail {     
                get {
                        return getProperty('thumbnail');
                }
             set;
        }
    
        public String fullName {     
                get {
                        return getProperty('fullName');
                }
                set;
        }
    
        public String title {     
                get {
                        return getProperty('title');
                }
                set;
        }
    
        public String email {
                get {
                        return getProperty('email');
                }
                set;
        }
    
        public String workAddress {
                get {
                        return getProperty('workAddress');
                }
                set;
        }
    
        public String website {
                get {
                        return getProperty('website');
                }
                set;
        }
 
        public String bio {
                get {
                        return getProperty('bio');
                }
             set;
        }

        // Method to parse the value returned from website 
        public cms.Link parsedWebsite{
                get {
                    return new cms.Link(this.website, this.page_mode, this.site_name);
                }
        }

    
//method for outputting the generated markup
        public String infoCardHTML() {
            String html = '';
        
            html += '<div class="infoCard">';
            html +=    '<img src="' + thumbnail + '"/>';
            html +=    '<div class="infoSection">';
            html +=        '<div class="fullName">' + fullName + '</div>';
        html +=        '<div class="title">' + title + '</div>';
            html +=        '<div class="workAddress">' + workAddress + '</div>';
            html +=        '<div class="email">' + email + '</div>';
            html += '<a href="';
                if(this.parsedWebsite.targetPage != null)
                            html += parsedWebsite.targetPage;
                            html += '"';
                    if(this.parsedWebsite.target != null && this.parsedWebsite.target != '')
                            html += ' target="'+this.parsedWebsite.target+'"';
                    if(this.parsedWebsite.javascript != null && this.parsedWebsite.javascript != '')
                            html += ' onclick=\''+this.parsedWebsite.javascript+'\'';
                html += '>';
            html += 'link text' +'</a>';
            html +=    '</div>';
            html +=        '<div class="bio">' + bio + '</div>';
            html += '</div>';
        
            return html;
        }
}