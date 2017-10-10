package com.solutions.labwork1.banks;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class Client implements Serializable {
    public String myName;
    public String nameBank;
    public double wantMoney = 0;
    public double myCredit = 0;
    public double payout = 0;
    public double rate;

    public Client(String name, double money){
        this.myName = name;
        this.wantMoney = money;
    }

    void payout(double pay){
        myCredit -= pay;
        payout += pay;
    }

    void print(){
        System.out.printf("I'm %s. I use %s bank. Credit with %3.2f rate. And now credit %s\n", myName, nameBank, rate, myCredit);
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeObject(this.myName);
        out.writeObject(this.wantMoney);
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {

        try {
            this.myName = (String)in.readObject();
            this.wantMoney = (double)in.readObject();
        } catch (ClassNotFoundException e){
            e.getException();
        }
    }

    public String toString() {
        return String.format("[ 'data': [%s, %s]", this.myName, this.wantMoney);
    }
}
