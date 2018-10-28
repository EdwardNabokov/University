package kpi.lab5;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

public class Utils {

    public List<Integer> generateArray(int total) {
        List<Integer> list = new ArrayList<>();

        int min = 1, max = 20;

        for(int i = 0; i < total; i++){
            list.add(ThreadLocalRandom.current().nextInt(min, max + 1));
        }

        return list;
    }

    public void printList(String message, List<Integer> list) {
        System.out.print(message);
        for(Integer el : list) {
            System.out.printf("%d ", el);
        }
        System.out.println();
    }
}
