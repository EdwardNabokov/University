package kpi.lab3;

import java.util.ArrayList;
import java.util.List;

class Element {
    private int value = 0;
    private int index = 0;

    Element(int value, int index) {
        this.value = value;
        this.index = index;
    }

    int getValue() {
        return this.value;
    }

    int getIndex() {
        return this.index;
    }
}

public class FindElementsMinMax implements Action {

    private int[] array;
    private String condition;

    FindElementsMinMax(int[] array, String condition) {
        this.array = array;
        this.condition = condition;
    }

    private Element findMaxElement() {
        int index = 0;
        int value = Integer.MIN_VALUE;
        for(int i = 0; i < array.length; i++) {
            if(array[i] > value) {
                value = array[i];
                index = i;
            }
        }

        return new Element(value, index);
    }

    private Element findMinElement() {
        int index = 0;
        int value = Integer.MAX_VALUE;
        for(int i = 0; i < array.length; i++) {
            if(array[i] < value) {
                value = array[i];
                index = i;
            }
        }

        return new Element(value, index);
    }

    @Override
    public List<Integer> execute() {
        Element el = null;
        switch (this.condition) {
            case "max" : {
                el = findMaxElement();
                break;
            }
            case "min" : {
                el = findMinElement();
                break;
            }
            default: {
                System.out.println("No such condition");
            }
        }
        List<Integer> results = null;
        if (el != null) {
            results = new ArrayList<>();
            results.add(el.getIndex());
            results.add(el.getValue());
        }

        return results;
    }
}
