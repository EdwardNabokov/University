package com.solutions.labwork5;

/**
 * Interface Collection
 * It defines two basic iterators
 * - plain iterator, that iterate list sequentially
 * - sorted iterator, that iterate in incr order or decr
 *
 * @author Eduard Nabokov
 * @since 19.10.17
 * @version 1.1.1
 */

public interface Collection {
    Iterator getIterator();
    Iterator getIteratorSorting();
}
