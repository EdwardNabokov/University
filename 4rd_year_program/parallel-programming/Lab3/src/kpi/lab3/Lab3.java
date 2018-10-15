package kpi.lab3;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerArray;
import java.util.stream.IntStream;

public class Lab3 {
    public static void main(String[] args) {
        Utils utils = new Utils();

        int[] array = utils.generateArray(15);
        utils.printArray(array);
        System.out.println("- - - - - - - - - - - - -");
        System.out.println("Number of elements greater than 5 is " + FindElementsByCondtion(array, 5));

        MinMaxPair<Integer, Integer> minMaxResults = FindMinMaxElements(array);
        System.out.println("Min element is " + array[minMaxResults.first] + " -- index " + minMaxResults.first);
        System.out.println("Max element is " + array[minMaxResults.second] + " -- index " + minMaxResults.second);
        System.out.println("Control Hash Sum of array is " + FindChecksum(array));
    }

    private static int FindElementsByCondtion(int[] array, int threshold) {
        AtomicInteger counter = new AtomicInteger();

        IntStream.of(array).parallel().forEach(x -> {
            if (x < threshold) {
                int oldValue;
                int newValue;

                oldValue = counter.get();
                newValue = oldValue + 1;
                counter.compareAndSet(oldValue, newValue);
            }
        });

        return counter.get();
    }

    private static MinMaxPair<Integer, Integer> FindMinMaxElements(int[] array) {
        AtomicInteger minIndex = new AtomicInteger();
        AtomicInteger maxIndex = new AtomicInteger();

        IntStream.range(0, array.length).parallel().forEach(i -> {
            int oldValue;
            int newValue;

            do {
                oldValue = minIndex.get();
                newValue = i;
            } while (((array[i] < array[oldValue]) || (array[i] == array[oldValue] && i < oldValue))
                    && !minIndex.compareAndSet(oldValue, newValue));

            do {
                oldValue = maxIndex.get();
                newValue = i;
            } while (((array[i] > array[oldValue]) || (array[i] == array[oldValue] && i < oldValue))
                    && !maxIndex.compareAndSet(oldValue, newValue));
        });

        return new MinMaxPair<>(minIndex.get(), maxIndex.get());
    }

    private static int FindChecksum(int[] array) {
        AtomicInteger controlHashSum = new AtomicInteger();

        IntStream.of(array).parallel().forEach(x -> {
            int oldValue;
            int newValue;

            do {
                oldValue = controlHashSum.get();
                newValue = oldValue ^ x;
            } while (!controlHashSum.compareAndSet(oldValue, newValue));
        });

        return controlHashSum.get();
    }
}
