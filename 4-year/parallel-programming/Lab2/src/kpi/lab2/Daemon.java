package kpi.lab2;

abstract class Daemon implements Runnable {
    private Thread t;
    String threadName = "default";

    protected synchronized void process() {}

    @Override
    public void run() {
        System.out.println("Running " +  this.threadName);
        this.process();
    }

    void start() {
        System.out.println("Starting " +  this.threadName);
        if (this.t == null) {
            this.t = new Thread(this);
            this.t.start();
        }
    }
}
