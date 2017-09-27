package com.works;

import sun.security.smartcardio.SunPCSC;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.LinkedList;

public class BanksGeneric<T> implements Serializable {

    public LinkedList<T> myBanks = new LinkedList<>();

    BanksGeneric(){}

    public void addBank(T bank){
        this.myBanks.add(bank);
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeObject(this.myBanks.size());
        for (T obj : this.myBanks) {
            out.writeObject(obj);
        }
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        try {
            int size = (int)in.readObject();
            myBanks = new LinkedList<>();
            for(int i =0; i< size; i++) {
                myBanks.add((T) in.readObject());
            }
        } catch (ClassNotFoundException e){
            e.getException();
        }
    }

    public String toString(){
        return this.myBanks.toString();
    }
}
