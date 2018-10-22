package kpi.lab2;

import java.util.ArrayDeque;
import java.util.Queue;

public class CPUQueue {
    private int maxSize;
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

    int getSize() {
        return this.cpuQueue.size();
    }

    int getMaxSize() {
        return this.maxSize;
    }
}
