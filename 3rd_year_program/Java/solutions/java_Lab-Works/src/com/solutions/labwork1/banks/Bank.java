package com.solutions.labwork1.banks;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class Bank implements Serializable{

    protected String myName;
    protected double interestRate_1;
    protected double interestRate_2;

    public Bank(String name, double rate_1, double rate_2){
        this.myName = name;
        this.interestRate_1 = rate_1;
        this.interestRate_2 = rate_2;
    }

    public void addClient(Client client){}

    public String getMyName(){
        return this.myName;
    }

    public double getInterestRate_1(){
        return this.interestRate_1;
    }

    public double getInterestRate_2(){
        return this.interestRate_2;
    }

    private void writeObject(ObjectOutputStream out) throws IOException {

        out.writeObject(this.myName);
        out.writeObject(this.interestRate_1);
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {

        try {
            this.myName = (String)in.readObject();
            this.interestRate_1 = (double)in.readObject();
        } catch (ClassNotFoundException e){
            e.getException();
        }
    }

    public String toString(){
        return String.format("Bank [name: %s, interest rate: %s]", this.myName, this.interestRate_1);
    }

}
