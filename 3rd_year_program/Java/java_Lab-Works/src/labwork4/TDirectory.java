package com.solutions.labwork4;

import java.io.File;
import java.util.ArrayList;

/**
 * Class Directory.
 * Implements common methods
 * for handling.
 *
 * @author Eduard Nabokov
 * @version 0.1
 * @since 9.11.17
 */
public class TDirectory implements IDirectory, Component {

    private String name = "default";
    private ArrayList<Component> components = new ArrayList<>();

    TDirectory(String name){
        this.name = name;
    }

    @Override
    public Component create(String path){
        File dir = new File(path);

        String[] entries = path.split("/");
        String name = entries[entries.length - 1];

        if(!dir.exists()){
            dir.mkdir();
            System.out.println("Folder ----"+name+"---- was created");
        }

        return new TDirectory(name);
    }

    @Override
    public void rmdir(String path){
        File dir = new File(path);
        String parent = dir.getParent();

        File currentFile = new File(parent, name);
        currentFile.delete();
    }


    @Override
    public int getSize() {
        int size = 0;
        for(Component component: components) {
            size += component.getSize();
        }

        return size;
    }

    @Override
    public void addComponent(Component obj, boolean createIfNotExists) {
        this.components.add(obj);
    }

    @Override
    public void dropComponent(Component obj) {
        this.components.remove(obj);
    }

    @Override
    public String toString() {
        String content = getPath()+": ";
        if (!components.isEmpty()) {
            for (Component component : components) {
                content += "\n  " + component;
            }
        }
        else {
            return content + "nothing";
        }

        return content;
    }

    @Override
    public String getPath(){
        return this.name;
    }
}
