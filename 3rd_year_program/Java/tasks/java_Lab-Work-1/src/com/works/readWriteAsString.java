package com.works;

import java.io.*;
import java.util.LinkedList;

class readWriteAsString<T> {

    public T myObj;

    readWriteAsString(T obj){
        this.myObj = obj;
    }

    public void write_to(String filename) throws IOException {
        ObjectOutputStream out = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream(filename)));
        out.writeUTF(myObj.toString());
        out.close();
    }

    public String read_from(String filename) throws IOException {
        ObjectInputStream in = new ObjectInputStream((new BufferedInputStream(new FileInputStream(filename))));
        String obj = in.readUTF();
        return obj;
    }
}
