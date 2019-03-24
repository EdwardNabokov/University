public class Lab_2  {
    public static void main(String [] args){

        // C5 -> C = A + B;
        // C7 -> long
        // C11 -> 9 task

        // declaring and initializing variables
        Matrix A = new Matrix(3, 2);
        Matrix B = new Matrix(2, 3);
        Matrix C = new Matrix(A, B, '*');
        Matrix D = new Matrix(2, 3);
        Matrix E = new Matrix(2, 3);
        Matrix F = new Matrix(D, E, '+');

        // output two matrices
        A.print('A');
        B.print('B');
        // output the result of multiplication A and B
        C.print('C');

        System.out.println();
        // output two matrices
        D.print('D');
        E.print('E');
        // output the result of adding D and E
        F.print('F');

        System.out.println();

        // output found mean of every columns of the matrix
        output_mean_of_columns(A);

    }

    private static void output_mean_of_columns(Matrix A) {
        System.out.println("*****Mean of columns*****");
        A.print('A');
        float s;
        for(int j = 0; j < A.getArray()[0].length; j++){
            s = 0;
            for(int i = 0; i < A.getArray().length; i++){
                s += A.getArray()[i][j];
            }
            System.out.printf("%d column mean = %3.2f  \n", j, (s / A.getArray().length));
        }
    }
}
