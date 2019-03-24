package kpi.lab2;

import java.util.Random;

public class CPUProcess implements Runnable {
    private CPUQueue queue;

    CPUProcess(CPUQueue queue) {
        this.queue = queue;
    }

    private ProcessBuilder generateProcess() {
        Random r = new Random();
        int min = 1, max = 7;
        int randomNum = r.nextInt((max - min) + 1) + min;
        return new ProcessBuilder("sleep", Integer.toString(randomNum));
    }

    @Override
    public void run() {
        String name = Thread.currentThread().getName();
        while(true) {
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            synchronized (this.queue) {
                this.queue.addProcess(generateProcess());
                System.out.println(name + ": generating new process and adding to queue");
                this.queue.notify();
                System.out.println(name + ": notifying of newly created process");
            }
        }
    }
}
