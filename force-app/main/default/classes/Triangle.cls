public class Triangle extends Shape {
    public Triangle() {
        System.debug('Constructor of Triangle Class');
    }

    // when we try to implement abstract method of parent class, the keyword 'override' is must
    public override void calculateArea(){
        System.debug('Area of a triangle is base*height/2');
    }

    // This is not possible as non-virtual, non-abstract methods cannot be overriden.
    // public override void normalMethod(){
    //     System.debug('inside normal method of triangle class');
    // }

}