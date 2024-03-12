//start of tut
//void because we dont want to return any valaue or type
//1.Methods
private void run(){
printToDebugLog(); //debug log in salesforce is basically a document which show the orde rof execution 
VaraiableAndPrimaryDataTypes();
mathOperators();
ComparisonOperator();
logicalOperators();
conditionalStatement();
arrays();
Collections();
loops();
classes();
Exceptionhandling();


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


    Integer quantity;
    quantity=3;
    debug('Quantity',quantity); //System.debug(+), debug(,)


    Date myDate = Date.newInstance(2024, 03, 12);
    Datetime myDateTime =  Datetime.newInstance(2024,03,12,11,49,0);
    debug('Date',myDate);
    debug( 'Date Time',myDateTime);

    Time currentTime = System.now().time();
    debug('today time',currentTime);


    Object obj ='Tommy';
    String objValue = String.valueOf(obj);
    debug('Object value',objValue);

}

private void mathOperators(){
    Integer num1= 10;
    Integer num2= 5;

    Integer sum = num1+num2;
    debug('summm-',sum);

    Integer diff=num1-num2;
    debug('Difference--',diff);


    Integer product = num1 * num2;
    debug('Product',product);

    Integer quotient = num1/num2;
    debug('Quotient--',quotient);


    Integer num3 =24;
    Integer remainder=Math.mod(num3, num1);
    debug('Modulus/remainder',remainder);
}

private void ComparisonOperator(){
    Integer a =10;
    Integer b =5;
    Boolean isEqual=a==b;
    debug('Are numbers  equal?',isEqual);

    Boolean isNotEqual = a != b;
    debug('Are numbers not equal?',isNotEqual);


    Boolean isGretaer = a>b;
    debug('Is a greater than b?',   isGretaer );

    Boolean isLess =a<b;
     Boolean isGretaerThanorEqual=a>=b;
     Boolean isLessThanorEqual = a<=b;

     debug('Less than?',isLess);
     debug('greater than or equal?',isGretaerThanorEqual);
     debug('less than or equal?',isLessThanorEqual);
}


private void logicalOperators(){
    Boolean x =true;
    Boolean y=false;

    Boolean andResult= x && y; //if both are true then return true 
    debug('and operator &&',andResult);

    Boolean orResult = x || y;
    debug('or operatot oror',orResult); //if one of them are true return true


    Boolean notResult=!x;
    debug('Not result',notResult);
}

private void conditionalStatement(){
    Integer age =25;
    if(age<18){
        System.debug('You are a minor.');
    }else if(age >=18 && age<=65){
        System.debug('You are an adult.');
    }
    else{
        System.debug('You are a senior citizen.');
    }


    Integer dayOfWeek = 3;
    String dayName;
    
    switch on dayofWeek{
       when 1 {
      dayName = 'Monday';
       }

       when 2 {
 dayName = 'Tuesday';
       }

       when 3 {
 dayName = 'Wednesday';
       }

       when 4{
 dayName = 'Thursday';
       }

       when 5{
 dayName = 'Friday';
       }

       when else{
        System.debug('its a weekedn');
       }
        
    }
 debug('Day name',dayName);
  
}


//use to store values of same data type 
private void arrays(){
     Integer[] numbers =new Integer[3]; 
     numbers[0]=1;
     numbers[1]=2;
     numbers[2]=3;
     debug('Numbers array',numbers);


String[] animals=new String[]{'zebra','horse','elephant','gorilla'};
debug('animals arry',animals);
debug('0 index data',animals[0]);
debug('1 index data',animals[1]);
debug('Last animal',animals[animals.size()-1]);
}

private void Collections(){
    //  List<String> data = new List<String>{
    //     'x','y' ,'z'    };
    List<String> data = new List<String>(); // list are ordered collections of data
    data.add('berlin');
     data.add('NY');
     data.add('Tokyo'); 

     debug('Second city',data[1]);



     Set<String>  names=new Set<String>();//sets are unordered so cannot call the elements like names[0] it will t row error
     names.add('john');
     names.add('katie');
     names.add('jackson');

debug('names of --',names.size());
debug('names inside set --',names);

Map<String,Integer> inventory =  new Map<String,Integer>();  //maps are unonrdered unlike list
inventory.put('tshirt', 10);
inventory.put('jeans', 143);
inventory.put('belt', 12);

debug('inventory map',inventory);
debug('belt count',inventory.get('belt'));

//how to get list of keys and values from map
//list of keys
Set<String> mapKeys=inventory.keySet();
debug('maps keys',mapKeys);


//list of values
List<Integer> mapValues =inventory.values();
debug('map valus',mapValues);



    

}


private void loops(){
    for(Integer i=0; i<5;i++){
        debug('i',i);
    }

    Integer count =0;
    while(count<=3){
        debug('while loop count',count);
        count++;
        // debug('while coun++',count++); while loop is sued when we dont know how lonng the loop will execute 
        //always define counter varaiable else loop will run uncountable times and throw error of heap memeory full
       // 2:33:30 VIdeo ma bataya ha usne 

       
    }

    Double[] temperatures = new Double[]{
        24.5,34.6,56.7,89.0
    };

    for (Double temp:temperatures){
        //debug('data inside temp we stored',temperatures); 2:3:31 iss time pr btaya ha video ke
         debug('data inside temp we stored',temp);
    }

    List<String> groceries = new List<String>{'apple','bananaa','pineapple','grapes'};

    for(String item:groceries){
        debug('data inside item',item);
    }

    for(Integer i=0; i<groceries.size();i++){
        debug('daata inside for loop groc',groceries[i]);
    }

    Set<String> cards = new Set<String>{
        'A','J', 'K','Q','Joker'
    };

    for(String suit:cards){
        debug('Current suit',suit);
    }


    //MAP 
    Map<String,String> capital=new Map<String,String>{
        'New York' => 'Albany','Switzerland' => 'Bern','United Kingdom' =>'London'
    };

    //loop through set of map keys
    for(String region:capital.keySet()){
        debug('region',region);
        debug('capital',capital.get(region));
    }


    //loop through list of values
    for(String capitals:capital.values()){
        debug('values of map ',capitals);
    }
}

private void classes(){
    Person person = new Person('ayush',10);
    person.greet();
    person.incrementage();
}


private void Exceptionhandling(){
    try{
Integer a=10;
Integer b=0;
Integer result= a/b;
    }
    catch(MathException mex){
  debug('error of math ',mex.getMessage());
    }catch(Exception e ){
        debug('An error occurs',e.getMessage());
    }
}
// private String run(){

// }

// private Integer run(){

// }

// private object run(){

// }