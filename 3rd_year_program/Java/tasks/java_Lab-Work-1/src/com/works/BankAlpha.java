package com.works;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class BankAlpha extends Bank implements Serializable {
    protected int number_of_clients;
    protected Client[] clients;
    protected double time;
    protected int i_num_client;

    public BankAlpha(){
        super("Alpha", 1.5);
        this.number_of_clients = 2;
        this.clients = new Client[number_of_clients];
        this.time = .9;
        this.i_num_client = 0;

    }

    void addClient(Client client){
        if(i_num_client == 2){
            System.out.printf("Unfortunately, we are not able to give you out the credit, %s.\n", client.myName);
            return;
        }
        client.myCredit = client.wantMoney * interestRate * time;
        client.nameBank = "Alpha";
        client.rate = interestRate;
        clients[i_num_client] = client;
        i_num_client++;
    }

    public void setTime(double t){
        this.time = t;
    }

    public void setTotalNumOfClients(int n){
        this.number_of_clients = n;
    }

    public int getTotalPossibleClients(){
        return this.number_of_clients;
    }

    public int getCurrentNumClients(){
        return this.i_num_client;
    }

    public double getTime(){
        return time;
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

    public String toString(){
        return String.format("Bank Name: %s\nInterest rate: %s\nTime: %f\nClient 1: %s\nClient 2: %s\n",
                this.getMyName(),
                this.getInterestRate(),
                this.getTime(),
                this.clients[0].toString(),
                this.clients[1].toString());
    }
}
