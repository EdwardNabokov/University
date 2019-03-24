package com.solutions.labwork4;

/**
 * Interface Component.
 * It's common access to handle
 * multiple objects as one object.
 *
 * @author Eduard Nabokov
 * @version 0.1
 * @since 23.10.17
 */

public interface Component {

    /**
     * Calculate size or return given size
     * @return size (int)
     */
    int getSize();

    /**
     * Add component to the list
     * @param obj (Component)
     */
    void addComponent(Component obj, boolean createIfNotExists);

    /**
     * Drop component from the list
     * @param obj (Component)
     */
    void dropComponent(Component obj);

    /**
     * Get Path of folder or a file
     */
    String getPath();

}
