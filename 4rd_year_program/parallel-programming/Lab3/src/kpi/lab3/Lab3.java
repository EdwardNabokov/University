package kpi.lab3;

import java.util.*;
import java.util.concurrent.*;

public class Lab3 {
    public interface ActionWrapper {
        Action action(int[] array, Object... objects);
    }

    private static Callable createTask(ActionContext context) {
        Callable task;

        task = () -> {
            System.out.println("Asynchronous callable");
            return context.executeAction();
        };

        return task;
    }

    private static List<Callable> generateTasks(int[] array, int totalThreads, ActionWrapper wrapper, Object... objects) {
        ActionContext context;
        List<Callable> tasks = new ArrayList<>();
        for(int i = 0; i < array.length; i += array.length / totalThreads) {
            context = new ActionContext();
            context.setAction(wrapper.action(Arrays.copyOfRange(array, i, i + array.length / totalThreads), objects));
            tasks.add(createTask(context));
        }

        return tasks;
    }

    private static List<Future> executeTasks(ExecutorService executor, List<Callable> tasks) {
        List<Future> futures = new ArrayList<>();
        for(Callable task : tasks) {
            futures.add(executor.submit(task));
        }

        return futures;
    }

    private static void printFutureResults(List<Future> futures) throws ExecutionException, InterruptedException {
        for(Future s: futures) {
            System.out.println(s.get());
        }
    }

    public static void main(String... args) throws ExecutionException, InterruptedException {
        Utils utils = new Utils();

        int totalThreads = 3;

        int[] array = utils.generateArray(15);
        utils.printArray(array);

        ExecutorService executorService = Executors.newFixedThreadPool(totalThreads);

        ActionWrapper wrapper = new ActionWrapper() {
            @Override
            public Action action(int[] array, Object... objects) {
                return new FindElementsMinMax(array, (String)objects[0]);
            }
        };

        List<Callable> tasks = generateTasks(array, totalThreads, wrapper, "min");
        List<Future> futures = executeTasks(executorService, tasks);

        printFutureResults(futures);
        executorService.shutdown();
    }
}
