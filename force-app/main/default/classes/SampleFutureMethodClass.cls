public with sharing class SampleFutureMethodClass {
    // Future methods can have parameters but these parameters must be of primitive data type.
    // Future methods can not take sObjects as their argument.
    // You are not allowed to call another future method from a future method.
    @future
    public static void method(id recordId, integer val){
        
    }
}