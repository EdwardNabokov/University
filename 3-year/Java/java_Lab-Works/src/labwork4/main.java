package com.solutions.labwork4;

public class main {
    public static void main(String[] args) {
        TDirectory filesystem = new TDirectory("root");
        Facade f = new TFacade(filesystem);

        System.out.println("\n====CREATION====");
        f.create("temp/new/something/foo/", true);
        f.create("temp/new/user/edward/hi", true);
        f.create("temp/new/temp.py", true);
        f.create("temp/new/text.txt", true);
        f.create("temp/txt.txt", true);
        f.seeTree();

        System.out.println("\n====DELETION====");
        f.destroy("temp/new/");
        f.seeTree();
    }
}