<!--***********************************************************************************
* Component: LRC_RL_RelatedListApp
* CreatedBy: Nishit Kedia
* Description: The Related List App 
* Revision History
***********************************************************************************-->

<aura:application extends="force:slds">
    <aura:handler name="init" value="{!this}" action="{!c.doInit}" />
	<c:LRC_RL_DataGridView 
                           	aura:id="RLComp" 
                           inputChildMetadata="RL_Account_To_Contacts" 
                           recordId="0012800000C3nZeAAJ" 
                           inputPageSize="2"
                           bIsButtonFacetSet ="true"
                           bIsOptionFacetSet ="true"
                           >
    	
        <aura:set attribute="buttons">
            <!--<button class="slds-button"  style="height: 10px; width:200px;color: #FFFFFF;background-color: #00FF7C;border: 1px solid #00FF7C;border-radius: 5px;" aria-haspopup="true" title="More options" value="Button 1" />-->
            <!--<button class="slds-button " style="height: 10px; width:200px;color: #FFFFFF;background-color: #00FF7C;border: 1px solid #00FF7C;border-radius: 5px;" aria-haspopup="true" title="More options" value="Button 2" />-->
        	<button class="slds-button slds-float_right slds-button--brand testid__dummy-button-submit-action slds-col slds-no-space dummyButtonSubmitAction uiButton" aria-live="off" type="button" title="Add" data-aura-rendered-by="2491:0" data-aura-class="uiButton" onclick="{! c.handleClick }"><!--render facet: 2492:0--><span class=" label bBody truncate" dir="ltr" data-aura-rendered-by="2494:0">Add</span><!--render facet: 2496:0--></button>
        	<button class="slds-button slds-float_right slds-button--brand testid__dummy-button-submit-action slds-col slds-no-space dummyButtonSubmitAction uiButton" aria-live="off" type="button" title="Add" data-aura-rendered-by="2491:0" data-aura-class="uiButton"><!--render facet: 2492:0--><span class=" label bBody truncate" dir="ltr" data-aura-rendered-by="2494:0">Save</span><!--render facet: 2496:0--></button>
        <button class="slds-button slds-float_right slds-button--brand testid__dummy-button-submit-action slds-col slds-no-space dummyButtonSubmitAction uiButton" aria-live="off" type="button" title="Add" data-aura-rendered-by="2491:0" data-aura-class="uiButton"><!--render facet: 2492:0--><span class=" label bBody truncate" dir="ltr" data-aura-rendered-by="2494:0">Update</span><!--render facet: 2496:0--></button>
        
        </aura:set>
        
        <aura:set attribute="optionbuttons">
            <!--<button class="slds-button"  style="height: 10px; width:200px;color: #FFFFFF;background-color: #00FF7C;border: 1px solid #00FF7C;border-radius: 5px;" aria-haspopup="true" title="More options" value="Button 1" />-->
            <!--<button class="slds-button " style="height: 10px; width:200px;color: #FFFFFF;background-color: #00FF7C;border: 1px solid #00FF7C;border-radius: 5px;" aria-haspopup="true" title="More options" value="Button 2" />-->
        	<a onclick="{!c.handleClick}" role="menuitem" tabindex="0">
              <span class="slds-truncate">Menu Item One</span>
            </a>
            <a href="javascript:void(0);" role="menuitem" tabindex="-1">
          <span class="slds-truncate">Menu Item Two</span>
        </a>
            <a href="javascript:void(0);" role="menuitem" tabindex="-1">
          <span class="slds-truncate">Menu Item Four</span>
        </a>
        </aura:set>
        
    </c:LRC_RL_DataGridView>
</aura:application>