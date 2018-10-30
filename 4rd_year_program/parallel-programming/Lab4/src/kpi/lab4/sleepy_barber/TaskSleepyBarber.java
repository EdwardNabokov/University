package kpi.lab4.sleepy_barber;

import java.util.ArrayList;
import java.util.List;

public class TaskSleepyBarber {

    public void runTask() {

        WaitingRoom waitingRoom = new WaitingRoom();

        Barber barber = new Barber(waitingRoom);
        barber.start();

        List<Customer> customers = new ArrayList<>();
        for (int i = 0; i < 20; ++i) {
            Customer customer = new Customer("Customer-" + (i + 1), waitingRoom);
            customer.start();
            customers.add(customer);
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        for (Customer customer : customers) {
            try {
                customer.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        barber.interrupt();
    }
}