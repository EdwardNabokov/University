package com.lab111.labwork3;

/**
 * @author dima_
 * @version 1.0
 * Component interface
 */
public interface Component {
    /**
     *
     * @return size of object
     */
    int getSize();
    boolean isCatalog();
    void addComponent(Component component);
    void removeComponent(Component component);
}
