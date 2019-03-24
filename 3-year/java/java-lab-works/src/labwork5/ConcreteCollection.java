package com.solutions.labwork5;

import java.util.LinkedList;
import java.util.List;

/**
 * Class ConcreteCollection
 * It implements Collection interface
 * and can return two iterator
 * getIterator - plain Iterator
 * getIteratorSorting - sorted Iterator
 * Moreover, it definc LinkedList,
 * that can be modified, read by client
 * using one of the basic iterators
 *
 * @author Eduard Nabokov
 * @since 19.10.17
 * @version 1.1.1
 */

public class ConcreteCollection implements Collection {

    private List<Integer> list = new LinkedList<>();

    public ConcreteCollection(){
        this.list.add(-123);
        this.list.add(1234);
        this.list.add(10);
        this.list.add(9);
        this.list.add(8);
        this.list.add(7);
        this.list.add(6);
        this.list.add(5);
        this.list.add(4);
        this.list.add(3);
        this.list.add(2);
        this.list.add(1);
        this.list.add(0);
        this.list.add(1);
        this.list.add(2);
        this.list.add(3);
        this.list.add(4);
        this.list.add(5);
        this.list.add(6);
        this.list.add(7);
        this.list.add(8);
        this.list.add(9);
        this.list.add(10);
        this.list.add(-666);
        this.list.add(666);
        this.list.add(-666);
    }

    public Iterator getIterator() {
        return new IteratorStraight(this.list);
    }

    public Iterator getIteratorSorting() {
        return new IteratorSorting(this.list);
    }
}
