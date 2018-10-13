package kpi.lab2;

import java.util.ArrayDeque;
import java.util.Queue;


public class CPUQueue {
    int maxSize;
    private Queue<ProcessBuilder> cpuQueue = new ArrayDeque<>();

    CPUQueue(int maxSize) {
        this.maxSize = maxSize;
    }

    void addProcess(ProcessBuilder newCPU) {
        this.cpuQueue.add(newCPU);
    }

    ProcessBuilder getProcess() {
        return this.cpuQueue.poll();
    }

    int size() {
        return this.cpuQueue.size();
    }

    public int getMaxSize() {
        return this.maxSize;
    }
}
