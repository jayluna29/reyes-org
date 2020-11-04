trigger logACase on Request__c (before update, after update) {

    Set<ID> requestID = new Set<ID>();
    List<Case> caseListToInsert = new List<Case>();
    
    List<QueueSobject> caseQueue = [SELECT Id FROM QueueSobject WHERE SobjectType = 'Case'and queue.Name = 'Master Data Management' LIMIT 1];
    
    
    AssignmentRule AR = new AssignmentRule();
    AR = [select id from AssignmentRule where SobjectType = 'Case' and Active = true limit 1];
    
    Database.DMLOptions dmlOpts = new Database.DMLOptions();
    dmlOpts.assignmentRuleHeader.assignmentRuleId= AR.id;
    dmlOpts.EmailHeader.TriggerUserEmail = true;
    
    if(trigger.isAfter && trigger.isUpdate){
        for(Request__c objReq : trigger.New){
            if(trigger.oldmap.get(objReq.id).Request_Status__c == 'Draft' && trigger.oldmap.get(objReq.id).Request_Status__c != objReq.Request_Status__c && objReq.Request_Status__c == 'Send for Approval'){
                Case objCase = new Case();
                objCase.Status = 'New';
                objCase.Origin = 'Email';
                objCase.Request__c = objReq.Name;
                objCase.Description = 'Request for New Customer '+ objReq.LegalName__c;
                objCase.setOptions(dmlOpts);
                caseListToInsert.add(objCase);
            }
        }
    
    
        if(!caseListToInsert.isEmpty()){
            insert caseListToInsert;
        }
    
    }
    
}