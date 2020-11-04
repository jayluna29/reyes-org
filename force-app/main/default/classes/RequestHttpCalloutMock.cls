@isTest
global class RequestHttpCalloutMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        //Request__c req = [Select Id, Name, NameofBusinessDBA__c, StreetName__c, State__c, ContactPersonName__c,ContactPhone__c From Request__c limit 1]; 
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"DEBMAS07": {"IDOC": {"EDI_DC40": {"TABNAM": "EDI_DC40","MANDT": "800","DOCNUM": "","DOCREL": "","STATUS": "","DIRECT": "2","OUTMOD": "","IDOCTYP": "DEBMAS071","MESTYP": "DEBMAS","SNDPOR": "SAPECC","SNDPRT": "LS","SNDPRN": "ECC800","RCVPOR": "SAPECC","RCVPRT": "LS","RCVPRN": "ECC820"},"E1KNA1M": {"MSGFN": "009","KUNNR": "IND","ANRED": "COMPANY","KTOKD": "0001","LAND1": "US","NAME1": "NELSON TAX ASSOCIATES TEST10","ORT01": "MUENCHEN","REGIO": "PA","SORTL": "FORSCHUNG","SPRAS": "D","TELF1": "089-1210-0","LZONE": "0000000001"}}}}');
        response.setStatusCode(200);
        return response; 
    }
}