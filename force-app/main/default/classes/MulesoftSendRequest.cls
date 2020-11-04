global with sharing class MulesoftSendRequest {
    //public static List<Request__c> request{ get; set; }
   // @InvocableMethod(label='Get Request Names' description='Returns the list of requests corresponding to the specified request IDs.')
    /*public static List<Request__c> getRequestNames(List<String> requestIds) {
        request = [SELECT Id, Name, NameofBusinessDBA__c,StreetName__c, State__c, ContactPersonName__c, ContactPhone__c FROM Request__c WHERE Id IN :requestIds];
        system.debug('request ' + request);
        RequestCallouts.makePostCallout(request[0]);
        return request;
    }
    
    public static String jsonGen(Request__c requestRecord){
        String strJson = '';
        
        JSONGenerator jsGen = JSON.createGenerator(true);
        
        jsGen.writeStartObject();
        jsGen.writeFieldName('DEBMAS07');
        jsGen.writeStartObject();
        
        jsGen.writeFieldName('IDOC');
        jsGen.writeStartObject();
        
        jsGen.writeFieldName('EDI_DC40');
        jsGen.writeStartObject();
        jsGen.writeStringField('TABNAM', 'EDI_DC40');
        jsGen.writeStringField('MANDT', '800');
        jsGen.writeStringField('DOCNUM', '');
        jsGen.writeStringField('DOCREL', '');
        jsGen.writeStringField('STATUS', '');
        jsGen.writeStringField('DIRECT', '2');
        jsGen.writeStringField('OUTMOD', '');
        jsGen.writeStringField('IDOCTYP', 'DEBMAS071');
        jsGen.writeStringField('MESTYP', 'DEBMAS');
        jsGen.writeStringField('SNDPOR', 'SAPECC');
        jsGen.writeStringField('SNDPRT', 'LS');
        jsGen.writeStringField('SNDPRN', 'ECC800');
        jsGen.writeStringField('RCVPOR', 'SAPECC');
        jsGen.writeStringField('RCVPRT', 'LS');
        jsGen.writeStringField('RCVPRN', 'ECC820');
        jsGen.writeEndObject();
        
        jsGen.writeFieldName(requestRecord.Name);
        
       
        jsGen.writeStartObject(); 
        jsGen.writeStringField('MSGFN', '009');
        jsGen.writeStringField('KUNNR', 'IND');
        jsGen.writeStringField('ANRED', 'COMPANY');
        jsGen.writeStringField('KTOKD', '0001');
        jsGen.writeStringField('LAND1', 'US');
        if(requestRecord.NameofBusinessDBA__c != null){
            jsGen.writeStringField('NAME', requestRecord.NameofBusinessDBA__c);
        }else{
            jsGen.writeStringField('NAME', '');
        }
        if(requestRecord.StreetName__c != null){
            jsGen.writeStringField('ORT01', requestRecord.StreetName__c);
        }else{
            jsGen.writeStringField('ORT01', '');
        }
        if(requestRecord.State__c != null){
            jsGen.writeStringField('REGIO', requestRecord.State__c);
        }else{
            jsGen.writeStringField('REGIO', '');
        }
        if(requestRecord.ContactPersonName__c != null){
            jsGen.writeStringField('SORTL', requestRecord.ContactPersonName__c);
        }else{
            jsGen.writeStringField('SORTL', '');
        }
        jsGen.writeStringField('SPRAS', 'E');
        if(requestRecord.ContactPhone__c != null){
            jsGen.writeStringField('TELF1', requestRecord.ContactPhone__c);
        }else{
            jsGen.writeStringField('TELF1', '');
        }
        jsGen.writeStringField('LZONE', '0000000002');                
        jsGen.writeEndObject();
       
        
        jsGen.writeEndObject();
        jsGen.writeEndObject();
        jsGen.writeEndObject();
        
        strJson = jsGen.getAsString();  
        
        return strJson;
    }
    */
}