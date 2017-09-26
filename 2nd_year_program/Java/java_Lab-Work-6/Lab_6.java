public class Lab_6 {
    public static void main(String []args){
        // List
        // 1
        // create list
        LinkedList myList = new LinkedList();

        // add more elements to LinkedList
        myList.add("1");
        myList.add("2");
        myList.add("3");
        myList.add("4");
        myList.add("5");
        myList.add("100");

        // output list
        System.out.println("List: " + myList);
        System.out.println("Size: " + myList.size());
        System.out.println("Get one element: " + myList.get(3));
        System.out.println("Remove one element: " + myList.remove(2));
        System.out.println("Get one more element: " + myList.get(3));
        System.out.println("Size: " + myList.size());
    }
}
