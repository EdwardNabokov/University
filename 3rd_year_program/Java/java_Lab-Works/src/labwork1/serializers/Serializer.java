package com.solutions.labwork1.serializers;

import com.solutions.labwork1.banks.Bank;
import com.google.gson.Gson;
import com.solutions.labwork1.myCollection.myLinkedList;

import java.io.*;

public class Serializer {

    // is used to serialize collection as a whole object
    public static void serializeWholeObject(myLinkedList obj) throws IOException {

        String filename = "serializedWholeObject.ser";

        ObjectOutputStream out = null;

        try {
            out = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream(filename)));
            out.writeObject(obj);
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    // is used to deserialize collection as a whole object
    public static myLinkedList deserializeWholeObject() throws IOException {

        String filename = "serializedWholeObject.ser";

        ObjectInputStream in = null;

        myLinkedList obj = null;

        try {
            in = new ObjectInputStream(new BufferedInputStream(new FileInputStream(filename)));
            obj = (myLinkedList)in.readObject();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return obj;
    }
    // is used to serialize collection as a sequence of objects
    public static void serializeSequenceObjects(myLinkedList obj) throws IOException {

        String filename = "serializedSequenceObjects.ser";

        ObjectOutputStream out = null;

        try {
            out = new ObjectOutputStream(new BufferedOutputStream(new FileOutputStream(filename)));
            out.writeInt(obj.size());
            for (Bank x : obj) {
                out.writeObject(x);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    // is used to deserialize collection as a sequence of objects
    public static myLinkedList deserializeSequenceObjects() throws IOException {

        String filename = "serializedSequenceObjects.ser";

        ObjectInputStream in = null;

        myLinkedList obj = new myLinkedList();

        try {
            in = new ObjectInputStream(new BufferedInputStream(new FileInputStream(filename)));

            int size = in.readInt();

            for (int i = 0; i < size; i++) {
                Bank x = (Bank)in.readObject();
                obj.add(x);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return obj;
    }
    // is used to serialize collection as a JSON object
    public static void serializeAsJSON(myLinkedList obj) throws IOException {

        String filename = "serializedAsJSON.json";

        Gson gson = new Gson();

        PrintWriter out = null;

        try {
            out = new PrintWriter(filename);
            String json = gson.toJson(obj);
            out.write(json);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    // is used to deserialize collection as a JSON object
    public static myLinkedList deserializeAsJSON() throws IOException {

        String filename = "serializedAsJSON.json";

        BufferedReader in = null;

        myLinkedList obj = null;

        Gson gson = new Gson();

        try {
            in = new BufferedReader(new FileReader(filename));
            String json = in.readLine();
            obj = gson.fromJson(json, myLinkedList.class);
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return obj;
    }

}
