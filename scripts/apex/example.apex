//start of tut
//void because we dont want to return any valaue or type
//1.Methods
private void run(){
printToDebugLog(); //debug log in salesforce is basically a document which show the orde rof execution 
VaraiableAndPrimaryDataTypes();

}

run();


//here we passing run method as an argument 
private void debug(String tag,Object valueobj){
System.debug('data inside =---'+ tag+' : '+valueobj);
}


private void printToDebugLog(){
    System.debug('hello woorld!!');
}


private void VaraiableAndPrimaryDataTypes(){
    Integer yearBuilt = 1998;
    debug('yearBuilt',yearBuilt);

    Long billion = 123475873L;  
    System.debug('long data type data--'+billion);

    Double pi =3.1232456;
    Decimal bankBalance =1234456.8495;

    String name='ROn';
    System.debug('name --'+name);

    String Jobtitle = 'Salesforce Developer';
    String Company = 'AWS';
    System.debug('Bobby is a'+ Jobtitle +'. He Workks for ' + Company);//string.valueof()

    //typcasting example to clear for you guys
    Integer num=40;
    String numAsString = String.valueOf(num);
    debug('Number as String',numAsString);

    Boolean isStudent= true;
    debug('Is  a Student?',isStudent);


    Blob binaryData=EncodingUtil.base64Decode('base64Data');
    debug('Binary data',binaryData);

}


// private String run(){

// }

// private Integer run(){

// }

// private object run(){

// }