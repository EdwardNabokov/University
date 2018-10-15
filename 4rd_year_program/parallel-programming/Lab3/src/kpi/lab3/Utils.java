package kpi.lab3;

import java.util.Random;

class Utils {
     int[] generateArray(int total) {
        int[] array = new int[total];

        int min = 1, max = 20;
        for(int i = 0; i < total; i++) {
            array[i] = new Random().nextInt(max - min) + min;
        }

        return array;
    }

    void printArray(int[] array) {
        for (int element: array) System.out.printf("%d ", element);
        System.out.println();
    }
}
