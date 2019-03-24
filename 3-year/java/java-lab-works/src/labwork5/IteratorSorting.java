package com.solutions.labwork5;

import java.util.HashSet;
import java.util.List;

/**
 * Class IteratorSorting
 * It implements Iterator interface
 * and it's sorting iterator
 *
 * @author Eduard Nabokov
 * @since 19.10.17
 * @version 1.1.1
 */

public class IteratorSorting implements Iterator {

    private boolean globalLoopLock = false;
    private int lowerBound = 0;
    private int higherBound;

    private int index = lowerBound;
    private List<Integer> list = null;
    private HashSet<Integer> hash = new HashSet<>();

    public IteratorSorting(List<Integer> newList) {
        this.list = newList;
        this.higherBound = this.list.size();
    }

    private Integer lookForNextBackward(){
        int min = Integer.MAX_VALUE;
        int min_index = 0;
        boolean flag = false;

        for(int i = lowerBound; i <= this.index; i++){
            if ((this.list.get(i) <= min) && !this.hash.contains(i)) {
                min = this.list.get(i);
                min_index = i;
                flag = true;
            }
        }

        if (!flag){
            return -1;
        }

        return min_index;
    }

    private Integer lookForNextForward(){
        int min = Integer.MAX_VALUE;
        int min_index = 0;
        boolean flag = false;

        for(int i = this.index; i < higherBound; i++){
            if ((this.list.get(i) <= min) && !this.hash.contains(i)) {
                min = this.list.get(i);
                min_index = i;
                flag = true;
            }
        }

        if (!flag){
            return -1;
        }

        return min_index;
    }

    private Integer lookForPrevBackward(){
        int max = Integer.MIN_VALUE;
        int max_index = 0;
        boolean flag = false;

        for(int i = this.index; i < higherBound; i++){
            if ((this.list.get(i) >= max) && !this.hash.contains(i)) {
                max = this.list.get(i);
                max_index = i;
                flag = true;
            }
        }

        if (!flag) {
            return -1;
        }

        return max_index;
    }

    private Integer lookForPrevForward(){
        int max = Integer.MIN_VALUE;
        int max_index = 0;
        boolean flag = false;

        for(int i = this.index; i >= lowerBound; i--){
            if ((this.list.get(i) >= max) && !this.hash.contains(i)) {
                max = this.list.get(i);
                max_index = i;
                flag = true;
            }
        }

        if (!flag) {
            return -1;
        }

        return max_index;
    }

    @Override
    public Integer next() {
        int minIndex_next = -1, minIndex_pass = -1;

        try {
            minIndex_next = this.lookForNextForward();
            minIndex_pass = this.lookForNextBackward();
        }
        catch (IndexOutOfBoundsException exc){
            System.out.println("Error: (" + exc.getMessage() + ") in next");
            this.globalLoopLock = true;
        }


        int minValue_next = Integer.MAX_VALUE;
        if(minIndex_next != -1)
            minValue_next = this.list.get(minIndex_next);

        int minValue_pass = Integer.MAX_VALUE;
        if(minIndex_pass != -1)
            minValue_pass = this.list.get(minIndex_pass);

        if (!this.hash.contains(minIndex_next) && !this.hash.contains(minIndex_pass))
            this.index = minValue_next <= minValue_pass ? minIndex_next : minIndex_pass;
        else if (this.hash.contains(minIndex_next)) {
            this.index = minIndex_pass;
        }
        else {
            this.index = minIndex_next;
        }

        if (this.index == -1){
            this.globalLoopLock = true;
            return -1;
        }
        this.hash.add(this.index);

        return this.list.get(this.index);
    }

    @Override
    public Integer previous() {
        int maxIndex_next = -1, maxIndex_pass = -1;
        try {
            maxIndex_next = this.lookForPrevForward();
            maxIndex_pass = this.lookForPrevBackward();
        }
        catch (IndexOutOfBoundsException exc){
            System.out.println("Error: (" + exc.getMessage() + ") in previous");
            this.globalLoopLock = true;
        }

        int maxValue_next = Integer.MIN_VALUE;
        if(maxIndex_next != -1)
            maxValue_next = this.list.get(maxIndex_next);

        int maxValue_pass = Integer.MIN_VALUE;
        if(maxIndex_pass != -1)
            maxValue_pass = this.list.get(maxIndex_pass);

        if (!this.hash.contains(maxIndex_next) && !this.hash.contains(maxIndex_pass))
            this.index = maxValue_next >= maxValue_pass ? maxIndex_next : maxIndex_pass;
        else if (this.hash.contains(maxIndex_next)) {
            this.index = maxIndex_pass;
        }
        else {
            this.index = maxIndex_next;
        }

        this.hash.add(this.index);

        return this.list.get(this.index);
    }

    @Override
    public void add(Integer obj) {
        try {

            this.list.add(obj);
            this.higherBound++;
        }
        catch (IndexOutOfBoundsException exc){
            System.out.print("\nError: (" + exc.getMessage() + ") in add(obj)\n");
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
            System.out.print("\nError: (" + exc.getMessage() + ") in add(index, obj)\n");
            this.globalLoopLock = true;
        }
    }

    @Override
    public void remove(Integer obj) {
        try {

            this.list.remove(obj);
            this.higherBound--;
        }
        catch (IndexOutOfBoundsException exc){
            System.out.print("\nError: (" + exc.getMessage() + ") in remove(Integer obj)\n");
            this.globalLoopLock = true;
        }
    }

    @Override
    public void remove(int index) {
        try {
            this.list.remove(index);
            this.higherBound--;
        }
        catch (IndexOutOfBoundsException exc){
            System.out.print("\nError: (" + exc.getMessage() + ") in remove(int index)\n");
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

        if (higherBound == this.hash.size()){
            this.hash.clear();
            return false;
        }

        return true;
    }

    @Override
    public boolean hasPrev() {
        if(this.globalLoopLock){
            return false;
        }

        if(this.list.size() == 0)
            return false;

        if (higherBound == this.hash.size()){
            this.hash.clear();
            return false;
        }

        if (this.index >= higherBound) {
            return false;
        }

        return true;
    }
}
