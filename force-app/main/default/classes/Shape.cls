// // This is an abstract class, hence it can't be instantiated directly.
// abstract public class Shape {
//     protected String name{get; protected set;} // here getter is public while setter is protected
//     // which essentially applies that only subclasses can access setter function.
    
//     public Shape() {
//         System.debug('Constructor of Shape Class');
//     }

//     public void normalMethod(){
//         System.debug('This is a normal method');
//     }

//     public abstract void calculateArea(); // Abstract method, subclass is expected to implement the abstract method

// }



// Virtual class can be instantiated
public virtual class Shape{
    protected String name{get; protected set;}
    public Shape(){
        System.debug('Constructor of Shape class');
    }

    // virtual functions can have virtual methods and these methods can have body.
    public virtual void calculateArea(){
        System.debug('Calculating area in calculateArea() function of shape class');
    }

    public void normalMethod(){
        System.debug('This is a normal method');
    }
}