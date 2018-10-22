package kpi.lab2;

public class Lab2 {
    public static void main(String... args) {
        CPUQueue queue = new CPUQueue(10);

        CPUProcess processGenerator = new CPUProcess(queue);
        new Thread(processGenerator,"processGenerator").start();

        CPU cpuHandler1 = new CPU(queue);
        CPU cpuHandler2 = new CPU(queue);

        new Thread(cpuHandler1, "cpuHandler1").start();
        new Thread(cpuHandler2, "cpuHandler2").start();
    }
}
