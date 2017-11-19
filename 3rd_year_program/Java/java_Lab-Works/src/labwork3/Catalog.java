package com.lab111.labwork3;

import java.util.ArrayList;
import java.util.List;

/**
 * @author dima_
 * @version 1.0
 * Composite class
 */
public class Catalog implements Component {
    /**
     * List with all catalog components
     */
    private List<Component> components = new ArrayList<>();

    /**
     *
     * @param component is catalog or file
     * add component to list
     */
    public void addComponent(Component component) {
        components.add(component);
    }

    /**
     *
     * @param component is catalog or file
     * remove component from list
     */
    public void removeComponent(Component component) {
        components.remove(component);
    }

    /**
     *
     * @return size of catalog
     */
    @Override
    public int getSize() {
        int size = 0;
        for (Component component : components) {
            size += component.getSize();
        }
        return size;
    }

    @Override
    public boolean isCatalog() {
        return true;
    }
}
