package kpi.lab6;

import java.util.Random;

public class Matrix {
    private int rows, columns;
    private double[][] matrix;

    public Matrix(int rows, int columns) {
        this.rows = rows;
        this.columns = columns;
        this.matrix = new double[rows][columns];
    }

    public void fill() {
        final Random random = new Random();
        for(int i = 0; i < this.matrix.length; i++) {
            for(int j = 0; j < this.matrix[0].length; j++) {
                this.matrix[i][j] = random.nextDouble();
            }
        }
    }

    public void print() {
        for(int i = 0; i < this.matrix.length; i++) {
            for(int j = 0; j < this.matrix[0].length; j++) {
                System.out.format("%5f ", this.matrix[i][j]);
            }

            System.out.println();
        }
    }

    public int getRows() {
        return this.rows;
    }

    public int getColumns() {
        return this.columns;
    }

    public double[][] getMatrix() {
        return matrix;
    }
}
