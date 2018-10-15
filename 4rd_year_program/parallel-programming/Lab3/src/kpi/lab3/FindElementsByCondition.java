package kpi.lab3;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicIntegerArray;

public class FindElementsByCondition implements Action {

    private int[] array;
    private Integer threshold;
    private String condition;

    FindElementsByCondition(int[] array, String condition, Integer threshold) {
        this.threshold = threshold;
        this.array = array;
        this.condition = condition;
    }

    private List<Integer> findElementsBiggerThan() {
        List<Integer> tempArray = new ArrayList<>();

        for (int array : array) {
            if (array > this.threshold) {
                tempArray.add(array);
            }
        }

        return tempArray;
    }

    private List<Integer> findElementsBiggerOrEqualThan() {
        List<Integer> tempArray = new ArrayList<>();

        for (int array : array) {
            if (array >= this.threshold) {
                tempArray.add(array);
            }
        }

        return tempArray;
    }

    private List<Integer> findElementsLowerThan() {
        List<Integer> tempArray = new ArrayList<>();

        for (int array : array) {
            if (array < this.threshold) {
                tempArray.add(array);
            }
        }

        return tempArray;
    }

    private List<Integer> findElementsLowerOrEqualThan() {
        List<Integer> tempArray = new ArrayList<>();

        for (int array : array) {
            if (array <= this.threshold) {
                tempArray.add(array);
            }
        }

        return tempArray;
    }

    @Override
    public List<Integer> execute() {
        List<Integer> results = null;

        switch (this.condition) {
            case ">":
                results = findElementsBiggerThan();
                break;
            case ">=":
                results = findElementsBiggerOrEqualThan();
                break;
            case "<":
                results = findElementsLowerThan();
                break;
            case "<=":
                results = findElementsLowerOrEqualThan();
                break;
            default:
                System.out.println("No such comparison");
        }

        return results;
    }
}
