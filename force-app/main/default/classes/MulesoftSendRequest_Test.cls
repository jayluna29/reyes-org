@isTest
public class MulesoftSendRequest_Test {
    static testMethod void validateJson() {
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
        r = [Select Name, NameofBusinessDBA__c, StreetName__c, State__c, ContactPersonName__c,ContactPhone__c From Request__c Where Id =: r.Id];
        system.debug('r.Name ' + r.Name);
        MulesoftSendRequest.jsonGen(r);
    }
}