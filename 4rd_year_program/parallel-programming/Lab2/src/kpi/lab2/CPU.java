package kpi.lab2;


import java.io.IOException;

public class CPU implements Runnable {
    private CPUQueue queue;

    CPU(CPUQueue queue) {
        this.queue = queue;
    }

    private void executeProcess(String threadName) {
        ProcessBuilder processBuilder = this.queue.getProcess();
        System.out.println(threadName + ": get available process from queue");
        processBuilder.inheritIO();
        Process process;
        try {
            process = processBuilder.start();
        } catch (IOException e) {
            e.printStackTrace();
            return;
        }

        System.out.println(threadName + ": executing process " + process.pid());
    }

    @Override
    public void run() {
        String name = Thread.currentThread().getName();
        while(true) {
            synchronized (this.queue) {
                try {
                    System.out.println(name + ": waiting");
                    this.queue.wait();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println(name + ": notified");
                this.executeProcess(name);
            }
        }
    }
}
