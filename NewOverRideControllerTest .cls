/**
* @author        Abhinav Polsani 
* @date          09/25/2018
* @description   This test class covers for SObject Save_New Overide Controller.
Modification Log:
-----------------------------------------------------------------------------------------------------------------
Developer                Date            Description
-----------------------------------------------------------------------------------------------------------------
Abhinav Polsani       09/25/2018      Initial Version
*/
@isTest
private class NewOverRideControllerTest {
	
    /**
    * @author        Abhinav Polsani
    * @date          09/25/2018
    * @description   This method covers if the new button is clicked on SObject record
    * @param         None
    * @return        void
    */
	public static testMethod void checkButtonForNew() {
		P2P_TierA__c p2pRec = new P2P_TierA__c(Types__c = 'Tier A 1st Quarter');
		insert p2pRec;
		Test.startTest();
		ApexPages.StandardController sc = new ApexPages.StandardController(p2pRec);
		NewOverRideController p2pCot = new NewOverRideController(sc);
		PageReference pageRef = Page.P2p_TierA_NewInfoMessage;
		pageRef.getParameters().put('save_new', '1');
		pageRef.getParameters().put('retURL', '/'+p2pRec.Id);
		Test.setCurrentPageReference(pageRef);
		p2pCot.onLoadPage();
		Test.stopTest();
	}

	    /**
    * @author        Abhinav Polsani
    * @date          09/26/2018
    * @description   This method covers if the Save&New button is clicked on SObject record
    * @param         None
    * @return        void
    */
	public static testMethod void checkButtonForSaveAndNew() {
		P2P_TierA__c p2pRec = new P2P_TierA__c(Types__c = 'Tier A 1st Quarter');
		insert p2pRec;
		Test.startTest();
		ApexPages.StandardController sc = new ApexPages.StandardController(p2pRec);
		NewOverRideController p2pCot = new NewOverRideController(sc);
		PageReference pageRef = Page.P2p_TierA_NewInfoMessage;
		pageRef.getParameters().put('save_new', '1');
		pageRef.getParameters().put('retURL', 'https://Salesforce.com/');
		Test.setCurrentPageReference(pageRef);
		p2pCot.onLoadPage();
		Test.stopTest();
	}
}
