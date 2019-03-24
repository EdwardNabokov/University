package kpi.lab1;

/*
Create square matrix nxn and vector n, n > 100
Write parallel program multipling matrix on vector
 */

public class Lab1 {
    public static int SIZE = 300;
    public static int NUMBER_JOBS = SIZE;

    public static void main(String... args) throws InterruptedException {
        System.out.println("Matrix");
        Matrix matrix = new Matrix(SIZE, SIZE);
        matrix.fill();
        matrix.print();

        System.out.println("Vector");
        Matrix vector = new Matrix(SIZE, 1);
        vector.fill();
        vector.print();

        CustomThread[] threadArray = new CustomThread[NUMBER_JOBS];

        for(int i = 0; i < NUMBER_JOBS; i++) {
            threadArray[i] = new CustomThread(matrix, vector, i);
            threadArray[i].start();
        }

        for(int i = 0; i < NUMBER_JOBS; i++) {
            threadArray[i].join();
        }

        Matrix result = new Matrix(vector.getRows(), vector.getColumns());
        for(int i = 0; i < NUMBER_JOBS; i++) {
            result.getMatrix()[i][0] = threadArray[i].getResult();
        }

        System.out.println("Result");
        result.print();
    }
}
