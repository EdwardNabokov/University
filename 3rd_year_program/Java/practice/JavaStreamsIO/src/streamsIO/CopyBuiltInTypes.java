package com.practice.streamsIO;

import java.io.*;

public class CopyBuiltInTypes {
    public static void main(String[] args) throws IOException {

        String dataFile = "invoicedata";

        double[] prices = { 19.99, 9.99, 15.99, 3.99, 4.99 };
        int[] units = { 12, 8, 13, 29, 50 };
        String[] descs = {
                "Java T-shirt",
                "Java Mug",
                "Duke Juggling Dolls",
                "Java Pin",
                "Java Key Chain"
        };

        DataInputStream in = null;
        DataOutputStream out = null;

        out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream("out_.txt")));

        for(int i = 0; i < prices.length; i++) {
            out.writeDouble(prices[i]);
            out.writeInt(units[i]);
            out.writeUTF(descs[i]);
        }
        out.close();

        double total = 0;
        double price;
        int unit;
        String desc;

        try {
            in = new DataInputStream(new BufferedInputStream(new FileInputStream("out_.txt")));

            while (true) {
                price = in.readDouble();
                unit = in.readInt();
                desc = in.readUTF();
                System.out.format("You ordered: %d units of %s at $%.2f \n", unit, desc, price);
                total += unit * price;
            }
        } catch (EOFException e) {
            e.getMessage();
        }
        System.out.format("Total is %.2f\n", total);
        in.close();

    }
}
