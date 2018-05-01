package com.solutions.labwork5;

import java.util.List;

/**
 * Class IteratorStraight
 * It implements Iterator interface
 * and it's just a simple iterator
 *
 * @author Eduard Nabokov
 * @since 19.10.17
 * @version 1.1.1
 */

public class IteratorStraight implements Iterator {

    private boolean globalLoopLock = false;
    private int lowerBound = -1;
    private int higherBound;

    private int index = lowerBound;
    private List<Integer> list = null;

    public IteratorStraight(List<Integer> newList) {
        this.list = newList;
        this.higherBound = this.list.size();
    }

    @Override
    public Integer next() {
        try {
            return this.list.get(++index);
        }
        catch (IndexOutOfBoundsException exc) {
            System.out.println("Error: (" + exc.getMessage() + ") in next");
            this.globalLoopLock = true;
            return -1;
        }
    }

    @Override
    public Integer previous() {
        return this.list.get(--index);
    }

    @Override
    public void add(Integer obj) {
        try {

            this.list.add(index, obj);
            this.higherBound++;
        }
        catch (IndexOutOfBoundsException exc){
            System.out.print("\nError: (" + exc.getMessage() + ") in add\n");
            this.globalLoopLock = true;
        }
    }

    @Override
    public void add(int index, Integer obj) {
        try {

            this.list.add(index, obj);
            this.higherBound++;
        }
        catch (IndexOutOfBoundsException exc){
            System.out.print("\nError: (" + exc.toString() + ") in add\n");
            this.globalLoopLock = true;
        }
    }

    @Override
    public void remove(Integer obj) {
        try{
            this.list.remove(index);
            this.higherBound--;
        }
        catch (IndexOutOfBoundsException exc){
            System.out.print("\nError: (" + exc.toString() + " ) in remove\n");
            this.globalLoopLock = true;
        }
    }

    @Override
    public void remove(int index) {
        try{
            this.list.remove(index);
            this.higherBound--;
        }
        catch (IndexOutOfBoundsException exc){
            System.out.print("\nError: (" + exc.toString() + ") in remove\n");
            this.globalLoopLock = true;
        }
    }

    @Override
    public boolean hasNext() {
        if(this.globalLoopLock){
            return false;
        }

        if(this.list.size() == 0)
            return false;

        if(this.index < lowerBound){
            this.index = lowerBound;
        }

        if(this.index + 1 < higherBound){
            return true;
        }

        this.index++;
        return false;
    }

    @Override
    public boolean hasPrev() {
        if(this.globalLoopLock){
            return false;
        }

        if(this.list.size() == 0)
            return false;

        if (this.index > higherBound){
            this.index = higherBound;
        }

        if(this.index - 1 > lowerBound) {
            return true;
        }

        this.index--;
        return false;
    }
}
