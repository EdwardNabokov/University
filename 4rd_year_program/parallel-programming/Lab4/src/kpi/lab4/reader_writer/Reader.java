package kpi.lab4.reader_writer;

public class Reader extends Thread {

    private String name;
    private Storage storage;

    Reader(String name, Storage storage) {
        this.name = name;
        this.storage = storage;
    }

    public void run() {
        System.out.println(name + " wants to read");

        String text;
        try {
            text = storage.read();
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

        System.out.println(name + " read:" + text);
    }
}
