package kpi.lab4.reader_writer;

import java.util.ArrayList;
import java.util.List;

public class TaskReaderWriter {

    public void runTask() {

        Storage storage = new Storage();

        List<Writer> writers = new ArrayList<>();

        for (int i = 0; i < 5; ++i) {
            writers.add(new Writer("Writer-" + (i + 1), storage));
        }

        for (Writer writer : writers) {
            writer.start();
        }

        for (int i = 0; i < 300; ++i) {
            new Reader("Reader-" + (i + 1), storage).start();

            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
