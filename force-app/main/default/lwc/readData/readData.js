import { LightningElement, api, wire } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import fetchContactAccountRecords from '@salesforce/apex/ContactHandlerGet.fetchContactAccountRecords';


export default class ReadData extends LightningElement {

    contactRecords;

    @api recordId;
    @api objectApiName;

    @wire(fetchContactAccountRecords,{accountId:'$recordId'})

    getcon({data,error}){
if(data){
   this.contactRecords = data;

}else if (error){
    console.log('error : ',error);
}
    }
}