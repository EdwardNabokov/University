package kpi.lab3;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerArray;
import java.util.stream.IntStream;

public class Lab3 {
    public static void main(String[] args) {
        Utils utils = new Utils();

        int[] array = utils.generateArray(15);
        utils.printArray(array);
        System.out.println("- - - - - - - - - - - - -");

        Pair<AtomicInteger, ArrayList> elementsResults = FindElementsByCondtion(array, 5);
        System.out.println("Number of elements lower than 5 is " + elementsResults.first + " -- " + elementsResults.second);

        Pair<Integer, Integer> minMaxResults = FindMinMaxElements(array);
        System.out.println("Min element: " + array[minMaxResults.first] + " -- index " + minMaxResults.first);
        System.out.println("Max element: " + array[minMaxResults.second] + " -- index " + minMaxResults.second);
        System.out.println("Checksum: " + FindChecksum(array));
    }

    private static Pair<AtomicInteger, ArrayList> FindElementsByCondtion(int[] array, int threshold) {
        AtomicInteger counter = new AtomicInteger();
        AtomicIntegerArray elements = new AtomicIntegerArray(array.length);

        IntStream.range(0, array.length).parallel().forEach(i -> {
            if (array[i] < threshold) {
                int oldValue;
                int newValue;

                oldValue = counter.get();
                newValue = oldValue + 1;
                counter.compareAndSet(oldValue, newValue);

                elements.getAndSet(i, array[i]);
            }
        });

        ArrayList<Integer> values = new ArrayList<>();
        for(int i = 0; i < elements.length(); i++) {
            if(elements.get(i) != 0)
                values.add(array[i]);
        }

        return new Pair<>(counter, values);
    }

    private static Pair<Integer, Integer> FindMinMaxElements(int[] array) {
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

        return new Pair<>(minIndex.get(), maxIndex.get());
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
