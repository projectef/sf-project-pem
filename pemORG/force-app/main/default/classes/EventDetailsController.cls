public with sharing class EventDetailsController {
    @AuraEnabled(cacheable = true)
    public static List<Event_Speaker__c> getSpeakers(String eventId) {
      List<Event_Speaker__c> speakerList = [SELECT Id,Name,Speaker__c,Speaker__r.Name,Speaker__r.Phone__c,Speaker__r.Email__c,Speaker__r.Company__c FROM Event_Speaker__c WHERE Event__c = :eventId];
      return speakerList;
    }
  
    @AuraEnabled(cacheable = true)
    public static Event__c getLocationDetails(String eventId) {
      Event__c eventRecord = [SELECT Id,Name__c,Location_Address_Book__c,Location_Address_Book__r.Name,Location_Address_Book__r.City__c,Location_Address_Book__r.Country__c,Location_Address_Book__r.Landmark__c,Location_Address_Book__r.Postal_Code__c,Location_Address_Book__r.State__c,Location_Address_Book__r.Street__c FROM Event__c WHERE Id = :eventId];
      return eventRecord;
    }
  
    @AuraEnabled(cacheable = true)
    public static List<Event_Attendee__c> getAttendees(String eventId) {
      List<Event_Attendee__c> eventAttendeeList = [SELECT Id,Name,Attendee__c,Attendee__r.Name,Attendee__r.Email__c,Attendee__r.Company_Name__c,Attendee__r.Location_Address_Book__c,Attendee__r.Location_Address_Book__r.Name,Attendee__r.Location_Address_Book__r.Landmark__c FROM Event_Attendee__c WHERE Event__c = :eventId];
      return eventAttendeeList;
    }
} 