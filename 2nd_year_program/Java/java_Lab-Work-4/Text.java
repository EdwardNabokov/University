/**
 * Created by Edward on 5/22/2017
 */
class Text {
    String myText;
    Sentence[] arraysentences;
    int len = 0;

    Text(String text){
        myText = text.replaceAll("(\n|\t)", "\\ ");
        System.out.println(text);
        int count_sentences = text.split("\\.").length;
        len = count_sentences;

        arraysentences = new Sentence[count_sentences];
        for(int i = 0; i < count_sentences; i++){
            arraysentences[i] = new Sentence(text.replaceAll("(\n|\t)", "\\ ").split("\\.")[i]);
        }

    }

    void print(){
        for(int i = 0; i < len; i++) {
            System.out.printf("%d) sentence -> %s\n", i+1, arraysentences[i].mySentence);
            arraysentences[i].print(i);
        }
    }
}
