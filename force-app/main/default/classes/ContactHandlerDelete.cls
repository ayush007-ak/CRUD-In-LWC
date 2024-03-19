public with sharing class ContactHandlerDelete { 
    @AuraEnabled
    public static Boolean deleteContactRecord(String contactId){
        try {
            if(!String.isBlank(contactId)){
                Contact contactRec = new Contact(Id=contactId);
                delete contactRec;
                return true;
            }
            return false;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}