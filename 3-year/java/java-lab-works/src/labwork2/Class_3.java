package com.solutions.labwork2;

/**
 * Class, called Class_3, implements the interface called Interface3
 * and overrides each method of it, that print out current class name,
 * and current method name, that was called.
 *
 * @author Eduard Nabokov
 * @version 0.1
 * @since 2017.10.10
 */

public class Class_3 implements Interface3 {

    Interface1 if1;

    public void meth1(){
        System.out.println("Class: Class_3, method: meth1");
    }
    public void meth2(){
        System.out.println("Class: Class_3, method: meth2");
    }
    public void meth3(){
        System.out.println("Class: Class_3, method: meth3");
    }
}
