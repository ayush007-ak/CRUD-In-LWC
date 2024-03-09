// import { LightningElement, api } from 'lwc';
// import createContact from '@salesforce/apex/ContactHandler.createContactRecords';
// import {ShowToastEvent} from 'lightning/platformShowToastEvent';


// export default class CreateData extends LightningElement {

//     contactRecord;
//     inputForm={};

//     @api recordId;
//     @api objectApiName;

//      /*The below syntax dynamically created the JSON Object.
//      Sample JSON that gets created
//        inputForm = {
//            "firstName" : "elon",
//            "lastName"  : "grey",
//            "email"     : "sampleemail.gmail.com"
//        }
//     */


//        handleChange(event){
//         this.inputForm[event.target.value]=event.target.value;

//        }

//        //Method fired when clicked on the Submit button.

//        submitForm(event){
//          //Populating another JSON. We could have used inputForm directly here.
//          let contactSubmitForm ={
//             firstName:this.inputForm.firstName,
//             lastName:this.inputForm.lastName,
//             email:this.inputForm.email,
//             accountId:this.recordId
//          }
//           //Converting the whole JSON int   o string and passing as a parameter
//         let contactString = JSON.stringify(contactSubmitForm);

//         createContact({contactJSON:contactString})
//         .then((contact) => {
//             this.contact = contact.id;
//             console.log("data inside--"+this.contact)
//             this.dispatchEvent(
//                 new ShowToastEvent({
//                     title: "Success",
//                     message: "Contact created successfully!",
//                     variant: "success"
//                 })
//             );

//         })
//         .catch((error) => {
//             console.log('error : ',error);
//             this.dispatchEvent(
//                 new ShowToastEvent({
//                     title: "Error",
//                     message: error.body.message,
//                     variant: "error"
//                 })
//             );
//         });
        
//        }
// }


import { LightningElement,wire,track,api} from 'lwc';
import createContactRecords from '@salesforce/apex/ContactHandler.createContactRecords';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateData extends LightningElement {
    contactRecords;
    inputForm={};

    @api recordId;
    @api objectApiName;

    /*The below syntax dynamically created the JSON Object.
     Sample JSON that gets created
       inputForm = {
           "firstName" : "elon",
           "lastName"  : "grey",
           "email"     : "sampleemail.gmail.com"
       }
    */
    handleChange(event){
        this.inputForm[event.target.name] = event.target.value;
    }
    
    //Method fired when clicked on the Submit button.
    
    submitForm(event){
        //Populating another JSON. We could have used inputForm directly here.
        let contactSubmitForm ={
            firstName:this.inputForm.firstName,
            lastName:this.inputForm.lastName,
            email:this.inputForm.email,
            accountId:this.recordId
        }

        //Converting the whole JSON into string and passing as a parameter
        let contactString = JSON.stringify(contactSubmitForm);

        createContactRecords({contactJSON:contactString})
        .then((contact) => {
            this.contact = contact.id;
            this.dispatchEvent(
                new ShowToastEvent({
                    title: "Success",
                    message: "Contact created successfully!",
                    variant: "success"
                })
            );

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
        });
    }
}