package com.works;

import java.io.*;

public class TMain {
    public static void main(String[] args) throws IOException, ClassNotFoundException {

        // create linked list
        LinkedList myList = new LinkedList();
        // add element to it
        myList.add("Edward");
        myList.add("Nabokov");
        myList.add(15);

        // create stream to the file
        ObjectOutputStream out = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream("out.txt")));

        // write into file serialized data
        out.writeObject(myList);

        // close file (important!)
        out.close();


        // define linked list for future value
        LinkedList myNewList;

        // create stream from the file
        ObjectInputStream in = new ObjectInputStream(new BufferedInputStream(new FileInputStream("out.txt")));

        // read from the file serialized data and deserialize it
        myNewList = (LinkedList)in.readObject();

        // close file (important!)
        in.close();

        System.out.println("___SERIALIEZED_DATA___");
        System.out.println(myList.toString());
        System.out.println();
        System.out.println("___RESULT___");
        System.out.println(myNewList.toString());



    }
}
