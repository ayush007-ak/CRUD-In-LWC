public with sharing class ContactHandlerGet {
    @AuraEnabled(cacheable=true)
    public static List<Contact> fetchContactAccountRecords(String accountId){
        try {
            if(!String.isBlank(accountId)){
                List<Contact> contactRecords = [select id,Name,Title,Email,Phone from Contact where AccountId=:accountId limit 10];
                return contactRecords;
            }
            return null;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}