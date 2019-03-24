package kpi.lab4.sleepy_barber;

import java.util.LinkedList;

public class WaitingRoom {

    private  int placesInWaitingRoom = 3;
    private final Object Lock = new Object();
    private LinkedList<Customer> customers = new LinkedList<>();

    Customer getCustomerForHaircut() throws InterruptedException {

        synchronized (Lock) {
            Customer customer = customers.pollFirst();
            if (customer == null) {
                Lock.wait();
                customer = customers.pollFirst();
            }

            placesInWaitingRoom++;
            return customer;
        }
    }

    boolean getAHaicut(Customer customer) throws InterruptedException {
        synchronized (Lock) {
            boolean status = false;

            if(placesInWaitingRoom > 0) {
                customers.push(customer);
                status = true;
                placesInWaitingRoom--;
                Lock.notify();
            }

            return status;
        }
    }
}
