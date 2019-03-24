package kpi.lab4;

import kpi.lab4.consumer_producer.TaskConsumerProducer;
import kpi.lab4.philosophers.TaskPhilosopher;
import kpi.lab4.reader_writer.TaskReaderWriter;
import kpi.lab4.sleepy_barber.TaskSleepyBarber;

public class Lab4 {
    public static void main(String... args) {
//        TaskConsumerProducer task = new TaskConsumerProducer();
//        task.runTask();

        TaskPhilosopher task2 = new TaskPhilosopher();
        task2.runTask();

//        TaskReaderWriter task3 = new TaskReaderWriter();
//        task3.runTask();
//
//        TaskSleepyBarber task4 = new TaskSleepyBarber();
//        task4.runTask();
    }
}
