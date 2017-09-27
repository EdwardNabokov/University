package com.works;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

class Bank implements Serializable{

    protected String myName;
    protected double interestRate;

    Bank(String name, double rate){
        this.myName = name;
        this.interestRate = rate;
    }

    void addClient(Client client){}

    public String getMyName(){
        return this.myName;
    }

    public double getInterestRate(){
        return this.interestRate;
    }

    private void writeObject(ObjectOutputStream out) throws IOException {

        out.writeObject(this.myName);
        out.writeObject(this.interestRate);
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {

        try {
            this.myName = (String)in.readObject();
            this.interestRate = (double)in.readObject();
        } catch (ClassNotFoundException e){
            e.getException();
        }
    }

    public String toString(){
        return String.format("Bank name: %s\nInterest rate: %s\n", this.myName, this.interestRate);
    }

}
