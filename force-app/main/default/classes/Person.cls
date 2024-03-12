public with sharing class Person {
    private String name;
    private Integer age;

    //constructor
    public Person(String name,Integer age) {
    this.name=name;  //this refer to class within the scope
    this.age=age;
    }


    public void greet(){
        System.debug('hello my name is '+this.name +'my age is'+this.age);
    }

    public Integer incrementage(){
        return this.age+1;
    }
}