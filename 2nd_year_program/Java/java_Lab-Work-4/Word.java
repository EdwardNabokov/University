/**
 * Created by Edward on 5/22/2017
 */



class Word {
    String myWord;
    Letter[] arraychars;
    int len = 0;

    Word(String word){
        myWord = word;
        int count_letters = word.length();
        len = count_letters;

        arraychars = new Letter[count_letters];
        for(int i = 0; i < count_letters; i++){
            arraychars[i] = new Letter(word.charAt(i));
        }
    }

    void print(int z, int z1){
        for(int i = 0; i < len; i++) {
            System.out.printf("\t\t%d-%d-%d) letter -> %s\n", z+1, z1+1, i+1, arraychars[i].myLetter);
        }
    }
}
