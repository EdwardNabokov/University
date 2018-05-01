package com.solutions.labwork5;

public class main {
    public static void main(String[] args) {

        Collection iterableCollection = new ConcreteCollection();

        Iterator iter = iterableCollection.getIterator();
        Iterator iterSort = iterableCollection.getIteratorSorting();

        System.out.println("====FORWARD PASS====");
        while(iter.hasNext()){
            System.out.print(iter.next() + " ");
        }

        System.out.println("\n====FORWARD SORTED PASS====");
        while(iterSort.hasNext()){
            System.out.print(iterSort.next() + " ");
        }

        System.out.println("\n====BACKWARD PASS====");
        while(iter.hasPrev()) {
            System.out.print(iter.previous() + " ");
//            iter.add(0);
        }

        System.out.println("\n====BACKWARD SORTED PASS====");
        while(iterSort.hasPrev()) {
            System.out.print(iterSort.previous() + " ");
//            iterSort.add(5);
//            iterSort.remove(5);
//            iterSort.remove(5);
        }

        System.out.println("\n====BACKWARD AND FORWARD PASS====");
        while(iter.hasNext() && iter.hasPrev()){
            System.out.print(iter.previous() + " ");
            System.out.print(iter.next() + " ");
        }

        System.out.println("\n====BACKWARD AND FORWARD SORTED PASS====");
        while(iterSort.hasNext() && iterSort.hasPrev()){
            System.out.print(iterSort.previous() + " ");
            System.out.print(iterSort.next() + " ");
        }

        System.out.println("\n====BACKWARD PASS====");
        while(iter.hasPrev()){
            System.out.print(iter.previous() + " ");
        }

        System.out.println("\n====BACKWARD SORTED PASS====");
        while(iterSort.hasPrev() ){
            System.out.print(iterSort.previous() + " ");
        }

        System.out.println("\n====FORWARD PASS====");
        while(iter.hasNext()){
            System.out.print(iter.next() + " ");
        }

        System.out.println("\n====FORWARD SORTED PASS====");
        while(iterSort.hasNext()){
            System.out.print(iterSort.next() + " ");
        }
    }
}
