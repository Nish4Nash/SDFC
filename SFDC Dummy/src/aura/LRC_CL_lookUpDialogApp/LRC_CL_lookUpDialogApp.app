<!--***********************************************************************************
* Component: LRC_CL_lookUpDialogApp
* CreatedBy: Ajay Agnihotri
* Description: This app uses the LRC_CL_lookUpDialogComponent to show the usecase of custom Lookup
* Revision History
***********************************************************************************-->
<aura:application >
    <c:LRC_CL_lookUpDialogComponent sObjectLabel="Account" sObjectAPI="Account"  sObjectLookUpColumn1="AccountNumber" sObjectLookUpColumn2="Industry" sObjectLookUpColumn3="BillingCity" sObjectLookUpColumn4="Rating" sObjectPluralLabel="Accounts" TypeAheadsearchField="Name" TypeAheadDisplayField="Name" TypeAheadlistIconSVGPath="/resource/slds103/assets/icons/standard-sprite/svg/symbols.svg#account" TypeAheadlistIconClass="slds-icon-standard-account" />
</aura:application>