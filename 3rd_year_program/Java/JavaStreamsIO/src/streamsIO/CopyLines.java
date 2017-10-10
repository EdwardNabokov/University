package com.practice.streamsIO;

import java.io.IOException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;

public class CopyLines {
    public static void main(String[] args) throws IOException {

        BufferedReader in = null;
        BufferedWriter out = null;

        try {
            in = new BufferedReader(new FileReader("text.txt"));
            out = new BufferedWriter(new FileWriter("out.txt"));

            String s;
            while ((s = in.readLine()) != null) {
                System.out.println(s);
                out.write(s + '\n');
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
