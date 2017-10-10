package com.solutions.labwork1.serializers;

import java.io.*;

import com.solutions.labwork1.myCollection.*;
import com.solutions.labwork1.banks.*;

public class TMain {
    public static void main(String[] args) throws IOException {

        myLinkedList myTrainListBanks = new myLinkedList();

        Bank a = new BankAlpha("A", 3.5, 4, 4);
        Bank b = new BankTempoo("B", .9, 2.7, 2);
        Bank c = new BankUkrSoc("C", 4.3, 2, 3);
        Bank d = new BankAlpha("D", 45, 5, 2);

        Client ac = new Client("Mark", 1000);
        Client bc = new Client("Louise", 540);
        Client cc = new Client("Brad", 150);
        Client dc = new Client("Fred", 234);
        Client ec = new Client("Pavlo", 123);
        Client fc = new Client("David", 555);

        a.addClient(ac);
        b.addClient(bc);
        b.addClient(cc);
        c.addClient(dc);
        d.addClient(ec);
        d.addClient(fc);

        myTrainListBanks.add(a);
        myTrainListBanks.add(b);
        myTrainListBanks.add(c);
        myTrainListBanks.add(d);

        /*
        TASK 1 Serialize collection as a whole object
         */
        System.out.println("__TASK 1__: Serialize/Deserialize collection as a whole object.");

        Serializer.serializeWholeObject(myTrainListBanks);

        myLinkedList myTestListBanks = Serializer.deserializeWholeObject();

        System.out.println("__BEFORE SERIALIZATION__");
        System.out.println(myTrainListBanks.toString());
        System.out.println("__AFTER DESERIALIZATION....");
        System.out.println(myTestListBanks.toString());


        System.out.println("__TASK 2__: Serialize/Deserialize collection as a sequence of objects.");

        Serializer.serializeSequenceObjects(myTrainListBanks);

        myLinkedList myTestListBanks2 = Serializer.deserializeSequenceObjects();

        System.out.println("__BEFORE SERIALIZATION__");
        System.out.println(myTrainListBanks.toString());
        System.out.println("__AFTER DESERIALIZATION....");
        System.out.println(myTestListBanks2.toString());


        System.out.println("__TASK 3__: Serialize/Deserialize collection as a string (JSON).");

        Serializer.serializeAsJSON(myTrainListBanks);

        myLinkedList myTestListBanks3 = Serializer.deserializeAsJSON();

        System.out.println("__BEFORE SERIALIZATION__");
        System.out.println(myTrainListBanks.toString());
        System.out.println("__AFTER DESERIALIZATION....");
        System.out.println(myTestListBanks3.toString());

    }

}