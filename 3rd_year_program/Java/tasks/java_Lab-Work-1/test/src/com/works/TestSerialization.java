package com.works;

import junit.framework.TestCase;

import java.io.*;
import java.util.LinkedList;

public class TestSerialization extends TestCase {

    public void testCheckSimilarityTask1() throws IOException, ClassNotFoundException {
        System.out.println("Task 1");
        // create linked list
        myLinkedList myList = new myLinkedList();
        // add element to it
        myList.add("David");
        myList.add("Lourece");
        myList.add(15);

        // create stream to the file
        ObjectOutputStream out = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream("out.txt")));

        // write into file serialized data
        out.writeObject(myList);

        // close file (important!)
        out.close();

        // define linked list for future value
        myLinkedList myNewList;

        // create stream from the file
        ObjectInputStream in = new ObjectInputStream(new BufferedInputStream(new FileInputStream("out.txt")));

        // read from the file serialized data and deserialize it
        myNewList = (myLinkedList)in.readObject();

        // close file (important!)
        in.close();

        assertEquals(myList.toString(), myNewList.toString());
    }

    public void testCheckSimilarityTask2() throws IOException, ClassNotFoundException {
        Bank a = new Bank("A", 1.3);
        Bank a1 = new Bank("B", 3.2);
        Bank a2 = new Bank("C", 3.3);
        Bank a3 = new Bank("D", 3.4);
        Bank a4 = new Bank("E", 3.5);
        // initialize generic object
        BanksGeneric<Bank> myBank = new BanksGeneric<>();
        // set bank to generic class
        myBank.addBank(a);
        myBank.addBank(a1);
        myBank.addBank(a2);
        myBank.addBank(a3);
        myBank.addBank(a4);
        // create stream
        ObjectOutputStream outb = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream("outb.txt")));
        // write to file serialized data
        outb.writeObject(myBank);
        // close file (important!)
        outb.close();

        // create stream
        ObjectInputStream inb = new ObjectInputStream(new BufferedInputStream(new FileInputStream("outb.txt")));
        // read from file deserialized data
        BanksGeneric<Bank> myNewBank = (BanksGeneric<Bank>) inb.readObject();
        // close file (important!)
        inb.close();

        assertEquals(myBank.toString(), myNewBank.toString());

    }

    public void testCheckSimilarityTask3() throws IOException, ClassNotFoundException {
        LinkedList<Bank> banks = new LinkedList<>();

        Bank a_ = new Bank("A", 1.1);
        Bank b_ = new Bank("B", 1.2);
        Bank c_ = new Bank("C", 1.3);
        Bank d_ = new Bank("D", 1.4);

        banks.add(a_);
        banks.add(b_);
        banks.add(c_);
        banks.add(d_);

        readWriteAsString<LinkedList<Bank>> o = new readWriteAsString<>(banks);

        o.write_to("outs.txt");
        String s = o.read_from("outs.txt");

        assertEquals(banks.toString(), s);
    }
}
