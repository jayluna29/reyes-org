@isTest
//https://confluex.com/blog/salesforce-streaming-api-using-mule-esb-saleforce-connector/
private class RequestCallouts_Test {
    @testSetup static void testSetup(){
        Contact c = new Contact();
        c.FirstName = 'Bob';
        c.LastName = 'Reilly';
        c.MobilePhone = '222-222-2222';
        insert c;
        Request__c r = new Request__c();
        r.NameofBusinessDBA__c = 'Hey';
        r.StreetName__c = '8644 calhoun place';
        r.State__c = 'IN';
        r.ContactPersonName__c = c.Id;
        insert r;
    }
    @isTest(SeeAllData = false) static void testPostCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new RequestHttpCalloutMock()); 
        Request__c req = [Select Id, Name, NameofBusinessDBA__c, StreetName__c, State__c, ContactPersonName__c,ContactPhone__c From Request__c limit 1]; 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        // Verify that the response received contains fake values
        Test.startTest();
        HttpResponse response = RequestCallouts.makePostCallout(req);
        system.debug('response ' + response);
        String contentType = response.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = response.getBody();
        String expectedValue = '{"DEBMAS07": {"IDOC": {"EDI_DC40": {"TABNAM": "EDI_DC40","MANDT": "800","DOCNUM": "","DOCREL": "","STATUS": "","DIRECT": "2","OUTMOD": "","IDOCTYP": "DEBMAS071","MESTYP": "DEBMAS","SNDPOR": "SAPECC","SNDPRT": "LS","SNDPRN": "ECC800","RCVPOR": "SAPECC","RCVPRT": "LS","RCVPRN": "ECC820"},"E1KNA1M": {"MSGFN": "009","KUNNR": "IND","ANRED": "COMPANY","KTOKD": "0001","LAND1": "US","NAME1": "NELSON TAX ASSOCIATES TEST10","ORT01": "MUENCHEN","REGIO": "PA","SORTL": "FORSCHUNG","SPRAS": "D","TELF1": "089-1210-0","LZONE": "0000000001"}}}}';
        System.debug('body ' + response.getBody());
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, response.getStatusCode());
        Test.stopTest();
    }
}