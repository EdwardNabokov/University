package com.solutions.labwork2;

/**
 * Class, called Class_1, implements the interface called Interface1
 * and overrides each method of it, that print out current class name,
 * and current method name, that was called.
 *
 * @author Eduard Nabokov
 * @version 0.1
 * @since 2017.10.10
 */

public class Class_1 implements Interface1 {

    public Class_1 cl1;

    public void meth1() { System.out.println("Class: Class_1, method: meth1"); }
    public void meth2(){
        System.out.println("Class: Class_1, method: meth2");
    }
    public void meth3(){
        System.out.println("Class: Class_1, method: meth3");
    }
}
