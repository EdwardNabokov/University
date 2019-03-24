package com.solutions.labwork4;

/**
 * Interface Facade.
 * Simplified interface for usage.
 *
 * @author Eduard Nabokov
 * @version 0.1
 * @since 9.11.17
 */
public interface Facade {
    void create(String path, boolean createIfExists);
    void destroy(String path);
    void seeTree();
}
