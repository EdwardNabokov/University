package kpi.lab1;

public class CustomThread extends Thread {
    Matrix matrix;
    Matrix vector;

    int rowIndex;

    double result = 0;

    public CustomThread(Matrix matrix, Matrix vector, int rowIndex) {
        this.matrix = matrix;
        this.vector = vector;

        this.rowIndex = rowIndex;
    }

    public double getResult() {
        return result;
    }

    @Override
    public void run() {
        if(this.vector.getMatrix().length > 1) {
            for (int i = 0; i < this.matrix.getMatrix()[0].length; i++) {
                this.result += this.matrix.getMatrix()[this.rowIndex][i] * this.vector.getMatrix()[i][0];
            }
        } else {
            for (int i = 0; i < this.matrix.getMatrix()[0].length; i++) {
                this.result += this.vector.getMatrix()[0][i] * this.matrix.getMatrix()[i][this.rowIndex];
            }
        }
    }
}
