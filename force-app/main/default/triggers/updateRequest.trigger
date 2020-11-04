trigger updateRequest on Case (after insert, after update) {
    

    List<Request__c> requestToUpdate = new List<Request__c>();
    if(trigger.isInsert){
        for(Case objCase : trigger.New){
            String IdPrefix = String.valueOf(objCase.OwnerId).substring(0,3);
            system.debug('Case id prefix:'+ IdPrefix);
            system.debug('Case owner id: '+objCase.OwnerID);
            Request__c objRequest = [Select Id, Name, Case__c, Request_Status__c from request__c where Name=: objCase.Request__c];
            objRequest.Case__c = objCase.Id;
            if(IdPrefix == '00G'){
                objRequest.Request_Status__c = 'Send for Approval';
            }
            requestToUpdate.add(objRequest);
        
        }
    }
    if(trigger.isUpdate){
        for(Case objCase : trigger.New){
            String IdPrefix = String.valueOf(objCase.OwnerId).substring(0,3);
            Request__c objRequest = [Select Id, Name, Case__c, Request_Status__c from request__c where Name=: objCase.Request__c];
            if(IdPrefix == '005'){ 
                
                objRequest.Request_Status__c = 'In-Progress';
                requestToUpdate.add(objRequest);
            }
            else{
                objRequest.Request_Status__c = 'Send for Approval';
                requestToUpdate.add(objRequest);
            }
            
        
        }
    }
    if(!requestToUpdate.isEmpty()){
        update requestToUpdate;
    }
}