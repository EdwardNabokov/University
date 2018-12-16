package kpi.lab4.consumer_producer;

import java.util.ArrayList;
import java.util.List;

public class TaskConsumerProducer {

    public void runTask() {
        TQueue queue = new TQueue();

        List<Producer> producers = new ArrayList<>();
        for (int i = 0; i < 10; ++i) {
            producers.add(new Producer("Producer-" + (i + 1), queue));
        }

        List<Consumer> consumers = new ArrayList<>();
        for (int i = 0; i < 10; ++i) {
            consumers.add(new Consumer("Consumer-" + (i + 1), queue));
        }

        for (Producer producer : producers) {
            producer.start();
        }

        for (Consumer consumer : consumers) {
            consumer.start();
        }

        try {
            try {
                Thread.sleep(10000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } finally {
            System.out.println("Terminate all process.");
            terminateConsumers(consumers);
        }
    }

    private void terminateConsumers(List<Consumer> consumers) {
        for (Consumer consumer : consumers) {
            consumer.interrupt();
        }
    }
}