package kpi.lab2;

import java.io.IOException;
import java.util.Random;

class CPU extends Daemon {
    private CPUQueue queue;

    CPU(CPUQueue queue, String threadName) {
        this.queue = queue;
        this.threadName = threadName;
    }

    private ProcessBuilder getProcess() throws InterruptedException {
        while(true) {
            if (this.queue.size() == 0) {
                System.out.println(this.threadName + ": no process in queue. Waiting...");
                Thread.sleep(new Random().nextInt((5000 - 2000) + 1) + 2000);
            } else {
                break;
            }
        }

        System.out.println(this.threadName + ": get available process from queue");
        return queue.getProcess();
    }

    private void executeProcess() throws InterruptedException, IOException {
        ProcessBuilder processBuilder = getProcess();
        processBuilder.inheritIO();
        Process process = processBuilder.start();
        System.out.println(this.threadName + ": execute process " + process.pid());
        process.waitFor();
    }

    @Override
    protected void process() {
        while(true) {
            try {
                this.executeProcess();
            } catch (InterruptedException | IOException e) {
                e.printStackTrace();
            }
        }
    }
}
