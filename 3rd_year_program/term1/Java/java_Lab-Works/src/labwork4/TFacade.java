package com.solutions.labwork4;

import java.io.File;

/**
 * Class Facade.
 * Implements methods.
 *
 * @author Eduard Nabokov
 * @version 0.1
 * @since 9.11.17
 */
public class TFacade implements Facade {

    TDirectory filesystem = null;
    TFile file = new TFile("default", 10);

    TFacade(TDirectory filesystem) {
        this.filesystem = filesystem;
    }

    @Override
    public void create(String path, boolean createIfNotExists) {
        String[] entries = path.split("/");

        String namedirCurr = entries[0];

        Component currFolder = this.filesystem.create(namedirCurr);
        Component rootFolder = currFolder;
        Component nextFolder = null;

        if(entries.length > 1) {
            for (int i = 1; i < entries.length; i++) {
                namedirCurr += "/" + entries[i];

                if (!entries[i].contains(".")) {
                    nextFolder = this.filesystem.create(namedirCurr);
                    currFolder.addComponent(nextFolder, createIfNotExists);
                    currFolder = nextFolder;
                } else {
                    this.file = new TFile(entries[i], 10);
                    Component file_ = this.file.open(namedirCurr, createIfNotExists);
                    currFolder.addComponent(file_, createIfNotExists);
                }
            }
        }
        else {
            this.file = new TFile(path, 10);
            Component file = this.file.open(path, createIfNotExists);
            currFolder.addComponent(file, createIfNotExists);
        }


        this.filesystem.addComponent(rootFolder, createIfNotExists);
    }

    @Override
    public void destroy(String path) {
        File dir = new File(path);

        String[] entries = path.split("/");
        String name = entries[entries.length - 1];

        String parent = dir.getParent();

        if(dir.isDirectory()) {
            for (File c : dir.listFiles())
                destroy(c.getPath());

            File currentFile = new File(parent, name);
            currentFile.delete();
            this.filesystem.rmdir(path);
        }
        else{
            this.file = new TFile(path, 10);
            this.file.close();
            this.file.delete(path);
        }

        File currentFile = new File(parent, name);
        currentFile.delete();

        System.out.println("Folder "+currentFile.toString()+" was deleted");
    }

    @Override
    public void seeTree(){
        System.out.println(this.filesystem.toString());
    }
}
