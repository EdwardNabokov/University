package kpi.lab5;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.stream.Collectors;

public class Lab5 {
    public static void main(String... args) throws ExecutionException, InterruptedException {
        Utils utils = new Utils();

        List<Integer> list1 = utils.generateArray(15);
        List<Integer> list2 = utils.generateArray(15);
        List<Integer> list3 = utils.generateArray(15);

        utils.printList("First: ", list1);
        utils.printList("Second: ", list2);
        utils.printList("Third: ", list3);

        CompletableFuture<List<Integer>> future = squared(list1);
        CompletableFuture<List<Integer>> future1 = filter(list2, "odd");
        CompletableFuture<List<Integer>> future2 = ratioMaxValue(list3, 0.4, 0.6);

        utils.printList("Result first: ", future.get());
        utils.printList("Result second: ", future1.get());
        utils.printList("Result third: ", future2.get());

        utils.printList("Merge (second list & third list) - first list: ", mergeLists(future.get(), future1.get(), future2.get()).get());
    }

    private static CompletableFuture<List<Integer>> squared(List<Integer> list) {
        return CompletableFuture
                .supplyAsync(() -> list.stream().map(i -> i * 2).collect(Collectors.toList()))
                .thenApplyAsync((squaredList) -> squaredList.stream().sorted().collect(Collectors.toList()));
    }

    private static CompletableFuture<List<Integer>> filter(List<Integer> list, final String condition) {
        int oddOrEven = 0;
        if (condition.equals("odd")) {
            oddOrEven = 1;
        }

        final int finalOddOrEven = oddOrEven;
        return CompletableFuture
                .supplyAsync(() -> list.stream().parallel().filter((i) -> i % 2 == finalOddOrEven).collect(Collectors.toList()))
                .thenApplyAsync((filteredList) -> filteredList.stream().parallel().sorted().collect(Collectors.toList()));
    }

    private static CompletableFuture<List<Integer>> ratioMaxValue(List<Integer> list, final double lowerBound, final double higherBound) {
        return CompletableFuture
                .supplyAsync(() -> list.stream().parallel().mapToInt(i -> i).max().getAsInt())
                .thenApplyAsync((max) -> list.stream().parallel().filter((i) -> (lowerBound * max) <= i && i <= (higherBound * max)).collect(Collectors.toList()))
                .thenApplyAsync((newList) -> newList.stream().parallel().sorted().collect(Collectors.toList()));
    }

    private static CompletableFuture<List<Integer>> mergeLists(List<Integer> list1, List<Integer> list2, List<Integer> list3) {
        List<Integer> mergedList = new ArrayList<>();

        CompletableFuture.supplyAsync(() -> mergedList).thenAcceptBothAsync(CompletableFuture.supplyAsync(() -> list2), List::addAll);
        CompletableFuture.supplyAsync(() -> mergedList).thenAcceptBothAsync(CompletableFuture.supplyAsync(() -> list3), List::addAll);
        return CompletableFuture
                .supplyAsync(() -> new ArrayList<>(mergedList.stream().parallel().filter((i) -> !list1.contains(i)).collect(Collectors.toList())))
                .thenApplyAsync((newList) -> newList.stream().parallel().sorted().collect(Collectors.toList()));
    }
}
