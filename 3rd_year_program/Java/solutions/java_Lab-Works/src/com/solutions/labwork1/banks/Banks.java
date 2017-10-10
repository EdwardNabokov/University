package com.solutions.labwork1.banks;

import java.util.ArrayList;

public class Banks {

    private ArrayList<Bank> banks;

    Banks(){
        this.banks = new ArrayList<Bank>();
    }

    // add bank to the array
    void addBank(Bank bank){
        this.banks.add(bank);
    }

    // remove Bank from the list
    void removeBank(Bank bank){
        banks.remove(bank);
    }

    // print out all com.solutions.labwork1.banks that are in array list
    void printAll(){
        System.out.println("Banks: ");
        for (Bank b : this.banks){
            System.out.println(b);
        }
    }

    // find total sum of interest rate through each bank
    int getTotalInterestRate() {
        int total = 0;
        for (Bank b : this.banks){
            total += b.getInterestRate_1();
            total += b.getInterestRate_2();
        }
        return total;
    }
}
