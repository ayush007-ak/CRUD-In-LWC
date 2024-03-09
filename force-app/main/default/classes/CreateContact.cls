public with sharing class CreateContact {

   @AuraEnabled(cacheable=true)
    public static Contact createContactRecords(String contactJSON){
        try{
            ContactWrapper contactWrapperRec= (ContactWrapper)JSON.deserialize(contactJSON, ContactWrapper.class);
          //  JSON.deserialize(jsonString, apexType)

            if(contactWrapperRec!=null){
                Contact conRec=new Contact();
                conRec.FirstName=contactWrapperRec.firstName;
                conRec.LastName=contactWrapperRec.lastName;
                conRec.Email = contactWrapperRec.email;
                conRec.AccountId=contactWrapperRec.accountId;

                insert conRec;

                return conRec;
            }
            return null;


        }catch (Exception e){
            throw new AuraHandledException(e.getMessage());

        }
    }
    

    public class ContactWrapper{
        public String firstName;
        public String lastName;
        public String accountId;
        public String email;

    }
}