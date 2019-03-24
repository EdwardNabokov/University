import java.util.Random;

class Matrix {
    private int n, m;
    private long[][] newMatrix;
    private Random rand;

    // constructor with n rows and m columns
    Matrix(int n_input, int m_input) {
        n = n_input;
        m = m_input;
        rand = new Random();

        newMatrix = new long[n][m];

        for(int i=0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                newMatrix[i][j] = rand.nextInt(15);
            }
        }
    }

    // construct with two matrices and sign of action
    Matrix(Matrix A, Matrix B, char sign){
        n = A.rows();
        m = B.columns();

        newMatrix = new long[n][m];


        if(sign == '+'){
            if((A.rows() != B.rows()) && (A.columns() != B.columns())){
                System.out.println("Adding is not able. Dimension is not equal!");
            }
            else {
                for (int i = 0; i < n; i++) {
                    for (int j = 0; j < m; j++) {
                        newMatrix[i][j] = A.getArray()[i][j] + B.getArray()[i][j];
                    }
                }
            }
        }
        else if(sign == '*') {
            if(A.columns() != B.rows()){
                System.out.println("Multiplication is not able. Dimension is not equal!");
            }
            else {
                for(int i = 0; i < A.rows(); i++){
                   for(int j = 0; j < B.columns(); j++) {
                       long temp = 0;
                       for(int z = 0; z < A.columns(); z++){
                           temp += A.getArray()[i][z] * B.getArray()[z][j];
                       }
                       newMatrix[i][j] = temp;
                   }
                }
            }
        }
    }

    // return number rows
    private int rows(){
        return n;
    }

    // return number of columns
    private int columns(){
        return m;
    }

    // return array of the current matrix
    long [][]getArray(){
        return newMatrix;
    }

    // return the result of addition
    long [][]add(Matrix A, Matrix B){
        long [][]C = new long[A.rows()][A.columns()];
        for(int i = 0; i < A.rows(); i++){
            for(int j = 0; j< A.columns(); j++){
                C[i][j] = A.getArray()[i][j] + B.getArray()[i][j];
            }
        }
        return C;
    }

    // print out the matrix
    void print(char name){
        System.out.printf("***** Matrix %c *****", name);
        for(int i = 0; i < n; i++){
            for(int j = 0; j< m; j++){
                System.out.printf("%3d ", newMatrix[i][j]);
            }
            System.out.println();
        }
    }
}
