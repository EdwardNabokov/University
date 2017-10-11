package patterns;

import java.util.ArrayList;

public class CompositePattern {

    public static void main(String [] args) {

        Composite test = new Composite();

        Shape obj1 = new Rectangle();
        Shape obj2 = new Circle();
        Shape obj3 = new Triangle();
        Shape obj4 = new Circle();
        Shape obj5 = new Circle();
        Shape obj6 = new Rectangle();

        test.add(obj1);
        test.add(obj2);
        test.add(obj3);
        test.add(obj4);
        test.add(obj5);
        test.add(obj6);

        test.draw();

        test.add(new Circle());
        System.out.println("\nNew draw\n--------");
        test.draw();
    }
}

interface Shape {
    void draw();
}

class Rectangle implements Shape {
    public void draw() {
        System.out.println("Draws Rectangle");
    }
}

class Circle implements Shape {
    public void draw() {
        System.out.println("Draw Circle");
    }
}

class Triangle implements Shape {
    public void draw() {
        System.out.println("Draw Triangle");
    }
}

class Composite implements Shape {

    private ArrayList<Shape> components = new ArrayList<Shape>();


    public void add(Shape obj) {
        components.add(obj);
    }

    public void drop(Shape obj) {
        components.remove(obj);
    }

    public void draw() {
        for(Shape obj : components) {
            obj.draw();
        }
    }
}
