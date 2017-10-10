package com.solutions.labwork1.banks;

import junit.framework.TestCase;

public class TestBank extends TestCase {

    public Bank a = new Bank("A", 1.2, 2.3);
    public BankAlpha b = new BankAlpha("B", 0.2, 1.45, 2);
    public BankUkrSoc c = new BankUkrSoc("C", 2.4, 1.2, 1);
    public BankTempoo d = new BankTempoo("D", 1.5, 1.22, 3);

    public void testArgsBank(){
        assertEquals(a.getMyName(), "A");
        assertEquals(a.getInterestRate_1(), 1.2);
    }

    public void testArgsBankAlpha(){
        b.setTime(0.9);
        assertEquals(b.getTime(), 0.9);
        assertEquals(b.getCurrentNumClients(), 0);
    }

    public void testArgsBankUkrSoc() {
        b.setTime(1.0);
        assertEquals(b.getTime(), 1.0);
        assertEquals(b.getCurrentNumClients(), 0);
    }

    public void testArgsBankTempoo() {
        b.setTime(1.1);
        assertEquals(b.getTime(), 1.1);
        assertEquals(b.getCurrentNumClients(), 0);
    }

}