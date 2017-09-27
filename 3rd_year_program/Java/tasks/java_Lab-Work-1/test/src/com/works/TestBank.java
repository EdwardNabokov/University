package com.works;

import junit.framework.TestCase;

public class TestBank extends TestCase {

    public Bank a = new Bank("A", 1.2);
    public BankAlpha b = new BankAlpha();
    public BankUkrSoc c = new BankUkrSoc();

    public void testArgsBank(){
        assertEquals(a.getMyName(), "A");
        assertEquals(a.getInterestRate(), 1.2);
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

}