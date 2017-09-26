/**
 * Created by Edward on 5/22/2017
 */
class Sentence {
    String mySentence;
    Word[] arraywords;
    Punctuation[] arraypunctions;
    int len = 0;

    Sentence(String sentence){
        mySentence = sentence;
        int count_words = sentence.split("\\ ").length;
        len = count_words;

        arraywords = new Word[count_words];
        for(int i = 0; i < count_words; i++){
            arraywords[i] = new Word(sentence.split("\\ ")[i]);
        }
    }


    void print(int z){
        for(int i = 0; i < len; i++) {
            System.out.printf("\t%d-%d) word -> %s\n", z+1, i+1, arraywords[i].myWord);
            arraywords[i].print(z, i);
        }
    }

}
