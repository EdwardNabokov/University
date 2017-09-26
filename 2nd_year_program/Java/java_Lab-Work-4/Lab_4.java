import java.util.Scanner;

public class Lab_4 {
    public static void main(String []args){
        // input of strings and chars using scanner
        System.out.print("Enter the text or a string: ");
        Scanner scan = new Scanner(System.in);
        Text sstring = new Text(scan.nextLine());

        // output of strings in certain form
        sstring.print();
    }
}
