package kpi.lab2;


public class Lab2 {
    public static void main(String... args) {
        CPUQueue queue = new CPUQueue(10);

        CPUProcess processGenerator = new CPUProcess(4000, queue);
        processGenerator.start();

        CPU cpuHandler1 = new CPU(queue, "CPU 1");
        CPU cpuHandler2 = new CPU(queue, "CPU 2");

        cpuHandler1.start();
        cpuHandler2.start();

    }
}
