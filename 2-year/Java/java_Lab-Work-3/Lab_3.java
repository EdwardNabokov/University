import java.util.Scanner;

public class Lab_3 {
    public static void main(String [] args){

        // C3 -> StringBuffer
        // C17 -> 10

        // input of strings and chars using scanner
        System.out.print("Enter the text or a string: ");
        Scanner scan = new Scanner(System.in);
        StringBuffer sstring = new StringBuffer(scan.nextLine());
        System.out.print("Enter the first letter: ");
        scan = new Scanner(System.in);
        StringBuffer firstChar = new StringBuffer(scan.nextLine());
        System.out.print("Enter the second letter: ");
        scan = new Scanner(System.in);
        StringBuffer secondChar = new StringBuffer(scan.nextLine());

        // output of given strings and chars
        System.out.println(sstring);
        System.out.println(firstChar);
        System.out.println(secondChar);

        // output of a new string
        System.out.println(delete_substring(sstring, firstChar.charAt(0), secondChar.charAt(0)));

    }

    private static StringBuffer delete_substring(StringBuffer ss, Character first, Character second){
        boolean found = false;
        int index_first = 0;
        int index_last = 0;
        for(int i = 0; i < ss.length(); i++){
            if(ss.charAt(i) == first && !found){
                index_first = i;
                found = true;
            }
            if(index_first < i){
                if(ss.charAt(i) == second){
                    index_last = i;
                }
            }
        }
        return ss.delete(index_first, index_last+1);
    }
}
