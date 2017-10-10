package com.practice.streamsIO;

import java.io.IOException;
import java.io.FileReader;
import java.io.FileWriter;

public class CopyCharacters {
    public static void main(String[] args) throws IOException {

        FileReader in = null;
        FileWriter out = null;

        try {
            in = new FileReader("text.txt");
            out = new FileWriter("out.txt");

            int c;
            while ((c = in.read()) != -1) {
//                System.out.println((char) c);
                out.write(c);
            }
        } finally {
            if (in != null) {
                in.close();
            }

            if (out != null) {
                out.close();
            }
        }

    }
}
