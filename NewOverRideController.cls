/**
* @author        Abhinav Polsani 
* @date          08/17/2018
* @description   This Controller can be used to the pages where new is overridden and works for save and new.  
Modification Log:
-----------------------------------------------------------------------------------------------------------------
Developer                Date            Description
-----------------------------------------------------------------------------------------------------------------
Abhinav Polsani       08/17/2018      Initial Version
*/
public with sharing class NewOverRideController {

    public String debug{get;Set;}
    private String SObjectPrefix = null;
    
    public NewOverRideController(ApexPages.StandardController controller){
        this.SObjectPrefix = controller.getRecord().getSObjectType().getDescribe().getKeyPrefix();
    }
    
    public PageReference onLoadPage() {
        this.debug = JSON.serializePretty(ApexPages.currentPage().getParameters());
        String retURL = ApexPages.currentPage().getParameters().get('retURL');

        if(ApexPages.currentPage().getParameters().get('save_new')=='1'
            && retURL != null
            && retURL.startsWith('/'+SObjectPrefix)
            && !retURL.contains('?')
            && retURL.length() >= 15
            && retURL.indexOf('/', 4) < 0){
            PageReference pg = new PageReference(retURL);
            pg.setRedirect(true);
            return pg;
        }else{
            PageReference pg = new PageReference('/'+this.SObjectPrefix+'/e');
            for(String key : ApexPages.currentPage().getParameters().keyset()){
            if(key == 'save_new' || key == 'sfdc.override') continue;
                pg.getParameters().put(key, ApexPages.currentPage().getParameters().get(key));
        }

        pg.getParameters().put('nooverride','1');
        pg.setRedirect(true);
        return pg;
        }
    }
}
