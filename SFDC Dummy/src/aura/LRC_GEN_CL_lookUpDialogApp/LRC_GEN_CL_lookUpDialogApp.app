<!--***********************************************************************************
* Component: LRC_GEN_CL_lookUpDialogApp
* CreatedBy: Nishit Kedia
* Description: This app uses the LRC_GEN_CL_lookUpDialogApp to show the usecase of custom Lookup
* Revision History
***********************************************************************************-->
<aura:application extends="force:slds" access="global" implements="ltng:allowGuestAccess">
    
    <aura:attribute name="sLookupProductId" type="String" default=""/>
    <aura:attribute name="productLookUpColumns" type="String[]" default="['Name','Account.Name','Phone','Title','CreatedBy.Name','Owner.Name']"/>
    <aura:attribute name="productSearchFields" type="String[]"  default="['Name']"/>
    
    <aura:attribute name="bOnChangeTriggered" type="Boolean" default="false"  description="App level Attribute"/>
    <aura:attribute name="counter" type="Integer" default="0"  description="App level Attribute"/>
    <aura:attribute name="sMessage" type="String" default="" description="App level Attribute"/>
   <div class="slds-col">                       
       <c:LRC_GEN_CL_typeAheadComponent sLookupSelectedId ="{!v.sLookupProductId}" 
                                       label="Contact" 
                                       pluralLabel="Contacts"   
                                       sObjectAPIName="Contact"
                                       searchField="Name" 
                                       DisplayField="Name"
                                       listIconSVGPath="/resource/slds103/assets/icons/standard-sprite/svg/symbols.svg#account" 
                                       listIconClass="slds-icon-standard-product" 
                        			   lstLookUpColumns="{!v.productLookUpColumns}" 
                                       lstSearchFields="{!v.productSearchFields}"
                                       onChangeAction="{!c.recordSelection}"/>
     </div>
     
     <div >
     <aura:if isTrue="{!v.bOnChangeTriggered}">
         <b>{!v.sMessage}</b>
     </aura:if>
     </div>
</aura:application>