package com.solutions.labwork4;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * Class File.
 * Implements common methods.
 *
 * @author Eduard Nabokov
 * @version 0.1
 * @since 9.11.17
 */

public class TFile implements IFile, Component{

    private int size;
    private String name = "default";
    private FileWriter fileObj;

    TFile(String name, int size){
        this.size = size;
        this.name = name;
    }

    @Override
    public Component open(String path, boolean createIfNotExists) {
        File file = new File(path);
        if (file.exists()) {
            try {
                this.fileObj = new FileWriter(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println("File exists");
            System.out.println("File was opened");
        }
        else{
            if (createIfNotExists) {
                try {
                    this.fileObj = new FileWriter(path);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                System.out.println("File didn't exist, but was created");
                System.out.println("File was opened");
            }
            else {
                System.out.println("File didn't exist and was not created");
                System.out.println("File was not opened");
            }
        }
        return this;
    }

    @Override
    public void close(){
        if (this.fileObj != null) {
            try {
                this.fileObj.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println("File was closed");
        }
        else{
            System.out.println("File was not open or not exists yet");
        }
    }

    @Override
    public void delete(String path) {
        if (new File(path).delete()){
            System.out.println("File was dropped");
        }
        else{
            System.out.println("File was not dropped");
        }
    }

    @Override
    public int getSize() {
        return this.size;
    }

    @Override
    public void addComponent(Component obj, boolean createIfNotExists) {
        System.out.println("It's a file. You cannot add anything");
    }

    @Override
    public void dropComponent(Component obj) {
        System.out.println("It's a file. You cannot drop anything.");
    }

    @Override
    public String toString(){
        return this.name;
    }

    @Override
    public String getPath(){
        return this.name;
    }
}
