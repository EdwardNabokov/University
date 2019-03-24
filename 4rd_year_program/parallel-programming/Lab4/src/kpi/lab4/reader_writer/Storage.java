package kpi.lab4.reader_writer;

import java.util.concurrent.Semaphore;

public class Storage {
    private Semaphore noUsages;
    private volatile int readersCount;
    private String storage;

    Storage() {
        noUsages = new Semaphore(1);
        storage = null;
    }

    String read() throws InterruptedException {

        if (readersCount == 0) {
            noUsages.acquire();
        }
        readersCount++;
        String result = this.storage;
        readersCount--;

        if (readersCount == 0) {
            noUsages.release();
        }

        return result;
    }

    void write(String string) throws InterruptedException {
        noUsages.acquire();
        storage = string;
        noUsages.release();
    }
}