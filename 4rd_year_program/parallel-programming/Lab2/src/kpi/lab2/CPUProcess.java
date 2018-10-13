package kpi.lab2;

import java.util.Random;

class CPUProcess extends Daemon {
    private long timeDelay;
    private CPUQueue queue;

    CPUProcess(int timeDelay, CPUQueue queue) {
        this.timeDelay = timeDelay;
        this.queue = queue;
    }

    private ProcessBuilder generateProcess() {
        Random r = new Random();
        int min = 1, max = 7;
        int randomNum = r.nextInt((max - min) + 1) + min;
        return new ProcessBuilder("sleep", Integer.toString(randomNum));
    }

    private void putProcess() throws InterruptedException {
        while(true) {
            if (this.queue.size() >= this.queue.maxSize) {
                System.out.println("QUEUE: Queue is full");
                Thread.sleep(5000);
            }
            else {
                break;
            }
        }

        System.out.println("Generate new process and put into the queue");
        this.queue.addProcess(generateProcess());
    }

    @Override
    protected void process() {
        while(true) {
            try {
                Thread.sleep(this.timeDelay);
                putProcess();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
