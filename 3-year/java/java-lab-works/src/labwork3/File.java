package com.lab111.labwork3;

/**
 * @author dima_
 * @version 1.0
 * Leaf class
 */
public class File implements Component {
    /**
     * size of File
     */
    private int size;

    /**
     * Constructor for File
     * @param size of File
     */
    File(int size){
        this.size = size;
    }

    /**
     *
     * @return size of file
     */
    @Override
    public int getSize() {
        return this.size;
    }

    @Override
    public boolean isCatalog() {
        return false;
    }

    @Override
    public void addComponent(Component component) {
        System.out.println("Данный объект не является каталогом");
    }

    @Override
    public void removeComponent(Component component) {
        System.out.println("Данный объект не является каталогом");
    }
}
