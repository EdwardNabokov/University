public class Lab_1 {
    public static void main(String [] args){
        // C1 -> +
        // C3  -> 1
        // C5 -> %
        // C7 -> char

        // declaring and initializing variables
        int n = 10;
        int m = 5;
        double s = 0;
        for(int i=1; i<n; i++){
            for(int j=1; j<m; j++) {
                s += (i % j) / (float)(i + 1);
            }
        }

        // output
        System.out.println("Result: "+s);
    }
}

