// import { LightningElement } from 'lwc';

// export default class DelCmp extends LightningElement {}

import { LightningElement,wire,track,api} from 'lwc';
import { createRecord,deleteRecord  } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import getRelatedContactRec from '@salesforce/apex/ContactHandlerGet.fetchContactAccountRecords';
import deleteContactRecord from '@salesforce/apex/ContactHandlerDelete.deleteContactRecord';

export default class DelCmp extends LightningElement {
    contactRecords; 
    inputForm={};

    @api recordId;
    @api objectApiName;

    @wire(getRelatedContactRec,{ accountId: '$recordId'}) 
    contactRec({ error, data }) {
            if (data) {
                //console.log('recordId : ',this.recordId);
                console.log('data from get method : ',JSON.stringify(data));
                this.contactRecords = data;
              
            } else if (error){
                console.log('error : ',error);
                
            }
    }//contactRec Ends

   deleteContactRec(event){
       
        let contactidtobedeleted = event.currentTarget.dataset.contactid;

        deleteContactRecord({contactId: contactidtobedeleted})
        .then((data) => {
            console.log('data of delete record-'+data);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Record deleted',
                    variant: 'success'
                })
            );
            
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error deleting record',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        })
        .finally(() => {
            this.isLoading = false;
        });
    }//deleteContactRec Ends
}