@isTest 
      public class TestAutoConvertLeads{
      static testMethod void CreateNewLead() {
      User userToCreate = [Select id from user where profile.name='System Administrator' Limit 1];
      
      Test.startTest();    
      Lead leadToCreate =new Lead();
      List<id> Ids= New List<Id>();
      leadToCreate.ownerid= userToCreate.id;
      leadToCreate.LastName ='Justin';
      leadToCreate.Company='Salesforce';
      leadToCreate.Status='Request Submitted';
      leadToCreate.Customer_Number__c = '123';
      insert leadToCreate; 
      
      Ids.add(leadToCreate.id);
      AutoConvertLeads.LeadAssign(Ids);
      
      Test.stopTest();
   }
}