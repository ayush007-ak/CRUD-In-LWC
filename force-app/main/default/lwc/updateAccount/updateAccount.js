import { LightningElement,api,wire } from 'lwc';
import { getRecord,getFieldValue  } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';


//Account Fields
import ACCOUNT_PHONE from '@salesforce/schema/Account.Phone';
import ACCOUNT_NO_OF_EMPLOYEES from '@salesforce/schema/Account.NumberOfEmployees';
import ACCOUNT_WEBSITE from '@salesforce/schema/Account.Website';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name'; 

import updateAccountRecords from '@salesforce/apex/ContactHandlerUpdate.updateAccountRecords';

export default class UpdateAccount extends LightningElement {
    inputForm={};

    @api recordId;

    accountName;
    accountWebsite;
    accountPhone;
    accountNoOfEmployees;

    handleChange(event){
        console.log('event.detals.name '+event.target.name+' : '+event.target.value);
       
        if(event.target.name=='accountName'){
            this.accountName = event.target.value;
        }

        if(event.target.name=='accountWebsite'){
            this.accountWebsite = event.target.value;
        }

        if(event.target.name=='accountPhone'){
            this.accountPhone = event.target.value;
        }

        if(event.target.name=='accountNoOfEmployees'){
            this.accountNoOfEmployees = event.target.value;
        }
    }//handleChange Ends


    //We will first get the Account Record to populate in the UI, using getRecord wire adapter
    @wire(getRecord, {
        recordId: "$recordId",
        fields: [ACCOUNT_NAME,ACCOUNT_NO_OF_EMPLOYEES,ACCOUNT_PHONE,ACCOUNT_WEBSITE]
      })
      record({ data, error }) {
        if(data){
            console.log('data : ',data);
            //this.accountName = data.accountname;//wrong

            this.accountName = getFieldValue(data, ACCOUNT_NAME);
            this.accountWebsite = getFieldValue(data, ACCOUNT_WEBSITE);
            this.accountPhone = getFieldValue(data, ACCOUNT_PHONE);
            this.accountNoOfEmployees = getFieldValue(data, ACCOUNT_NO_OF_EMPLOYEES);

            this.accountFields = data;
        } else if (error) {
            console.log("error", error);
        }
      }
   

    //We are calling the updateAccountRecords apex method and passing the JSON of fields to be updated
    submitForm(event){
        console.log('handle submit');
        let contactSubmitForm ={
            accountId:this.recordId,
            accountName:this.accountName,
            accountWebsite:this.accountWebsite,
            accountPhone:this.accountPhone,
            accountNoOfEmployees:this.accountNoOfEmployees
        }


        let contactString = JSON.stringify(contactSubmitForm);
        updateAccountRecords({accountJSON:contactString})
        .then((contact) => {
         
            this.dispatchEvent(
                new ShowToastEvent({
                    title: "Success",
                    message: "Contact created successfully!",
                    variant: "success"
                })
            );

            //this.accountRecord = {};
        })
        .catch((error) => {
            console.log('error : ',error);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: "Error",
                    message: error.body.message,
                    variant: "error"
                })
            );
        })
        .finally(() => {
            this.isLoading = false;
        });
    }//submitForm Ends
}
