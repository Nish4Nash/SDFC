global virtual with sharing class CustomInfoCard extends CustomInfoCardController {

//returning markup defined in the controller class
        global override String getHTML() {
                return infoCardHTML();
        }
}