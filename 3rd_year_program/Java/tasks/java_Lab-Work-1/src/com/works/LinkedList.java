package com.works;

import java.io.*;

class LinkedList implements Serializable {

    private static int size;
    private Node root;

    //constructor for linked list
    LinkedList() {}

    // appends the specified element to the end of list.
    void add(Object data) {

        if (root == null) {
            root = new Node(data);
        }

        Node givenNode = new Node(data);
        Node currentNode = root;

        if (currentNode != null) {
            while (currentNode.getNext() != null) {
                currentNode = currentNode.getNext();
            }
            currentNode.setNext(givenNode);
        }

        // increment size
        size++;
    }
    // removes the element at the specified position in this list.
    public boolean remove(int index) {

        // if the index is out of range, exit
        if (index < 1 || index > getSize())
            return false;

        Node currentNode = root;
        if (root != null) {
            for (int i = 0; i < index; i++) {
                if (currentNode.getNext() == null)
                    return false;

                currentNode = currentNode.getNext();
            }
            currentNode.setNext(currentNode.getNext().getNext());

            // decrement size
            size--;

            return true;

        }
        return false;
    }
    // return total size of the list
    public int getSize() {
        return size;
    }
    // returns the element at the specified position in this list.
    Object get(int index) {
        // index must be 1 or higher
        if (index < 0)
            return null;

        Node currentNode = null;

        if (root != null) {
            currentNode = root.getNext();
            for (int i = 0; i < index; i++) {
                if (currentNode.getNext() == null)
                    return null;

                currentNode = currentNode.getNext();
            }
            return currentNode.getData();
        }
        return null;
    }
    // convert list to string representation
    public String toString() {
        String output = "";

        if (root != null) {
            Node currentNode = root.getNext();
            while (currentNode != null) {
                output +=  currentNode.getData().toString() + ", ";
                currentNode = currentNode.getNext();
            }

        }
        return output;
    }

    // define writeObject from Serializable interface
    private void writeObject(ObjectOutputStream out) throws IOException {

        for(int i=0; i < this.getSize(); i++){
            System.out.println("To write: " + this.get(i));
            out.writeObject(this.get(i));
        }

    }

    // define readObject from Serializable interface
    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        LinkedList tempList = new LinkedList();
        try {
            Object c;
            while (true) {
              c = in.readObject();
              System.out.println("Read from: " + c);
              tempList.add(c);
            }


        } catch (OptionalDataException e1) {
           e1.getMessage();
        } catch (IOException e){
            e.printStackTrace();
        }

        this.root = tempList.root;
    }

    private class Node {
        // reference to the next node in the chain, or null if there isn't one.
        Node next;

        // data carried by this node. could be of any type you need.
        Object data;

        // Node constructor
        Node(Object value) {
            next = null;
            data = value;
        }

        // these methods should be self-explanatory
        Object getData() {
            return data;
        }

        Node getNext() {
            return next;
        }

        void setNext(Node nextValue) {
            next = nextValue;
        }

    }



}