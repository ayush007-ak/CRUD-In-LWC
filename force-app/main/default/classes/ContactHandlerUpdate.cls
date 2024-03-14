public with sharing class ContactHandlerUpdate {    
   @AuraEnabled
    public static Account updateAccountRecords(String accountJSON){
        try {
            AccountWrapper accountWrapperRec =  (AccountWrapper)JSON.deserialize(accountJSON,AccountWrapper.class);
            system.debug('updateAccountRecords accountWrapperRec : '+accountWrapperRec);

            if(accountWrapperRec!=null && accountWrapperRec.accountId!=null){
                Account accRec   = new Account(Id=accountWrapperRec.accountId);
                accRec.Name = accountWrapperRec.accountName;
                accRec.Website  = accountWrapperRec.accountWebsite;
                accRec.Phone     = accountWrapperRec.accountPhone;
                accRec.NumberOfEmployees = accountWrapperRec.accountNoOfEmployees;

                update accRec;

                return accRec;
            }

            return null;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
   public class AccountWrapper{
        public String accountId;
        public String accountName;
        public String accountWebsite;
        public String accountPhone;
        public Integer accountNoOfEmployees;
    }
}
