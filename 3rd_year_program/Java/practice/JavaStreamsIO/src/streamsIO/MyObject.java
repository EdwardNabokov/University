package com.practice.streamsIO;

import java.io.Serializable;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.IOException;


class MyObject implements Serializable {

    private String firstname;
    private String secondname;
    private double[] marks;

    MyObject(String first, String second) {
        this.firstname = first;
        this.secondname = second;
        this.marks = new double[]{1, 4, 2, 3, 4, 2, 1, 2};
    }

    public String getFirstname() {
        return this.firstname;
    }

    public String getSecondname() {
        return this.secondname;
    }

    public StringBuilder getMarks() {

        StringBuilder s = new StringBuilder();
        for(double i : this.marks){
            s.append(i + ", ");
        }
        return s;
    }

    private void writeObject(ObjectOutputStream o) throws IOException {

        o.writeObject(this.firstname);
        o.writeObject(this.secondname);
        o.writeObject(this.marks);
    }

    private void readObject(ObjectInputStream o) throws IOException, ClassNotFoundException {

        try {
            this.firstname = (String) o.readObject();
            this.secondname = (String) o.readObject();
            this.marks = (double[]) o.readObject();
        } catch (ClassNotFoundException e){
           e.getException();
        }
    }

}

