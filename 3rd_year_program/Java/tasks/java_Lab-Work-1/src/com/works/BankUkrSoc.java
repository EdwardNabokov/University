package com.works;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class BankUkrSoc extends Bank {
    protected int number_of_clients = 2;
    protected Client[] clients = new Client[number_of_clients];
    protected double time = 3.2;
    protected int i_num_client = 0;

    public BankUkrSoc(){
        super("UkrSoc", 4);
    }

    void addClient(Client client){
        if(this.i_num_client == 2){
            System.out.printf("Unfortunately, we are not able to give you out the credit, %s.\n", client.myName);
            return;
        }
        clients[this.i_num_client] = client;
        client.myCredit = client.wantMoney * interestRate * time;
        client.nameBank = "UkrSoc";
        client.rate = interestRate;
        this.i_num_client++;
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeObject(this.myName);
        out.writeObject(this.interestRate);
        out.writeObject(this.time);
        out.writeObject(this.i_num_client);
        for(int i = 0; i < this.i_num_client; i++) {
            out.writeObject(this.clients[i]);
        }
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {

        try {
            this.myName = (String)in.readObject();
            this.interestRate = (double)in.readObject();
            this.time = (double)in.readObject();
            this.i_num_client = (int)in.readObject();
            clients = new Client[this.i_num_client];
            for(int i = 0; i < this.i_num_client; i++) {
                this.clients[i] = (Client)in.readObject();
            }
        } catch (ClassNotFoundException e){
            e.getException();
        }
    }

    double getTime(){
        return time;
    }

    void setTime(double t) { this.time = t; }

    public String toString(){
        return String.format("Bank Name: %s\nInterest rate: %s\nTime: %f\nClient 1: %s\nClient 2: %s\n",
                this.getMyName(),
                this.getInterestRate(),
                this.getTime(),
                this.clients[0].toString(),
                this.clients[1].toString());
    }
}
