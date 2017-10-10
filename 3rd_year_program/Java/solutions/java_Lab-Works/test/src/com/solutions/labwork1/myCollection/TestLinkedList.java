package com.solutions.labwork1.myCollection;

import com.solutions.labwork1.banks.*;
import junit.framework.TestCase;

import java.io.IOException;

public class TestLinkedList extends TestCase {

    public void testCheckSerWholeObj() throws IOException, ClassNotFoundException {

        // create linked list
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


        assertEquals(myTrainListBanks.get(0).getMyName(), a.getMyName());
        assertEquals(myTrainListBanks.get(2).getMyName(), c.getMyName());
    }
}
