package com.solutions.labwork5;

/**
 * Interface Iterator
 * It defines basic mandatory iterator's api
 *
 *
 * @author Eduard Nabokov
 * @since 19.10.17
 * @version 1.1.1
 */

public interface Iterator {
    Integer next();
    Integer previous();
    void add(Integer obj);
    void add(int index, Integer obj);
    void remove(Integer obj);
    void remove(int index);
    boolean hasNext();
    boolean hasPrev();
}
