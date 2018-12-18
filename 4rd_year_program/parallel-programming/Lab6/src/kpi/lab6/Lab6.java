package kpi.lab6;

import mpi.MPI;
import java.util.*;

public class Lab6 {
    static int SIZE = 5000000;

    public static void main(String [] args) throws InterruptedException {
        MPI.Init(args);
        double[] vector = new double[SIZE];
        int rank = MPI.COMM_WORLD.Rank();
        int size = MPI.COMM_WORLD.Size();
        if (rank == 0) {
            for(int i = 0; i < SIZE; i++) {
                vector[i] = new Random().nextDouble();
            }
        }

        double startTime = System.nanoTime();
        MPI.COMM_WORLD.Bcast(vector, 0, SIZE, MPI.DOUBLE, 0);

        int end = (rank == (size - 1)) ? SIZE : (SIZE / size) * (rank + 1);

        double sum = 0;
        for (int i = (SIZE / size) * rank; i < end; i++) {
            sum += Math.pow(vector[i], 2);
        }

        double[] parallelResult = new double[1];
        parallelResult[0] = sum;
        MPI.COMM_WORLD.Reduce(parallelResult, 0, parallelResult, 0, 1, MPI.DOUBLE, MPI.SUM, 0);
        if (rank == 0) {
            double parallel_time = System.nanoTime() - startTime;
            parallelResult[0] = Math.sqrt(parallelResult[0]);
            System.out.format("\tParallel results: %.6f\n", parallelResult[0]);
            System.out.format("\tParallel time: %.3fs\n", parallel_time / 1e9);
        }

        MPI.Finalize();
    }
}
