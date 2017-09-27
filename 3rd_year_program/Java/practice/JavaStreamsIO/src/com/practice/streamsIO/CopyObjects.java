package com.practice.streamsIO;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.ObjectInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.FileInputStream;


public class CopyObjects {
    public static void main(String[] args) throws IOException, ClassNotFoundException {

        MyObject train = new MyObject("David", "Lourece");
        MyObject train2 = new MyObject("Hellen", "Brown");

        ObjectInputStream in = null;
        ObjectOutputStream out = null;


        out = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream("out_cust_obj.txt")));

        out.writeObject(train);
        out.writeObject(train2);

        out.close();

        MyObject test;
        MyObject test2;

        in = new ObjectInputStream(new BufferedInputStream(new FileInputStream("out_cust_obj.txt")));

        test = (MyObject)in.readObject();
        test2 = (MyObject)in.readObject();

        in.close();

        System.out.println("--Serialized object--");
        System.out.println("first: " + train.getFirstname());
        System.out.println("second: " + train.getSecondname());
        System.out.println("marks: " + train.getMarks());
        System.out.println("first: " + train2.getFirstname());
        System.out.println("second: " + train2.getSecondname());
        System.out.println("marks: " + train2.getMarks());
        System.out.println("");
        System.out.println("--Read object--");
        System.out.println("first: " + test.getFirstname());
        System.out.println("second: " + test.getSecondname());
        System.out.println("marks: " + test.getMarks());
        System.out.println("first: " + test2.getFirstname());
        System.out.println("second: " + test2.getSecondname());
        System.out.println("marks: " + test2.getMarks());
    }
}
