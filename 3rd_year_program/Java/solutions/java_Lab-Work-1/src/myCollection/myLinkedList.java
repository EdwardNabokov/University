package myCollection;

import banks.*;
import java.util.*;
import java.io.Serializable;


public class myLinkedList implements List<Bank>, Serializable {
    private Node firstNode;
    private Node lastNode;
    private int size = 0;

    public myLinkedList() {
        lastNode = new Node(null, firstNode, null);
        firstNode = new Node(null, null, lastNode);
    }

    public myLinkedList(Bank bank) {
        lastNode = new Node(null, firstNode, null);
        firstNode = new Node(null, null, lastNode);
        this.add(bank);
    }

    public myLinkedList(ArrayList<? extends Bank> arr) {
        lastNode = new Node(null, firstNode, null);
        firstNode = new Node(null, null, lastNode);
        this.addAll(arr);
    }

    public class bankIterator implements ListIterator<Bank> {
        private myLinkedList banks;
        private int cursor = -1;
        Node currentNode = firstNode;

        bankIterator(myLinkedList banks) {
            this.banks = banks;
        }

        bankIterator(myLinkedList banks, int index) {
            this.banks = banks;
            for (int i = 0; i < index + 1; i++) {
                this.next();
            }
        }

        @Override
        public boolean hasNext() {
            return cursor < banks.size() - 1;
        }

        @Override
        public Bank next() throws IndexOutOfBoundsException {
            if (currentNode.getNextElement().getCurrentElement() == null)
                throw new IndexOutOfBoundsException("Next element is null");
            currentNode = currentNode.getNextElement();
            cursor++;
            return currentNode.getCurrentElement();
        }

        @Override
        public boolean hasPrevious() {
            return currentNode.getPreviousElement() != null;
        }

        @Override
        public Bank previous() throws IndexOutOfBoundsException {
            if (currentNode.getPreviousElement().getCurrentElement() == null)
                throw new IndexOutOfBoundsException("Prev element is null");
            currentNode = currentNode.getPreviousElement();
            cursor--;
            return currentNode.getCurrentElement();
        }

        @Override
        public int nextIndex() {
            return cursor + 1;
        }

        @Override
        public int previousIndex() {
            return cursor - 1;
        }

        @Override
        public void remove() {
            Node target = firstNode.getNextElement();
            if (cursor == 0) {
                firstNode = firstNode.getNextElement();
                firstNode.setNextElement(target.getNextElement());
                firstNode.setCurrentElement(null);
                size--;
            }

            if (cursor == size() - 1) {
                lastNode = lastNode.getPreviousElement();
                size--;
                lastNode.setCurrentElement(null);
            }

            if (cursor > 0 && cursor < size()) {
                currentNode.getPreviousElement().setNextElement(currentNode.getNextElement());
                currentNode.getNextElement().setPreviousElement(currentNode.getPreviousElement());
                size--;
            }

        }

        @Override
        public void set(Bank bank)  {
            currentNode.setCurrentElement(bank);

        }

        @Override
        public void add(Bank bank) {
            if (cursor == -1) {
                Node next = firstNode;
                next.setCurrentElement(bank);
                firstNode = new Node(null, null, next);
                next.setPreviousElement(firstNode);
                size++;
                return;
            }

            if (cursor == size() - 1) {
                banks.add(bank);
                return;
            }

            Node target = firstNode.getNextElement();
            for (int i = 0; i < cursor - 1; i++) {
                target = target.getNextElement();
            }
            Node cur = new Node(bank, target, target.getNextElement());
            target.setNextElement(cur);
            target.getNextElement().setPreviousElement(cur);
            size++;
        }
    }

    public class _bankIterator implements Iterator<Bank> {
        private myLinkedList banks;
        private int cursor = -1;
        Node currentNode = firstNode;

        _bankIterator(myLinkedList banks) {
            this.banks = banks;
        }

        @Override
        public boolean hasNext() {
            return cursor < banks.size() - 1 && currentNode.getNextElement().getCurrentElement() != null;
        }

        @Override
        public Bank next() {
            if (currentNode.getNextElement().getCurrentElement() == null)
                throw new IndexOutOfBoundsException("Next element is null");
            currentNode = currentNode.getNextElement();
            cursor++;
            return currentNode.getCurrentElement();
        }
    }

    private class Node implements Serializable {
        private Bank currentEl;
        private Node nextEl;
        private Node prevEl;

        Node(Bank currentEl, Node prevEl, Node nextEl) {
            this.currentEl = currentEl;
            this.nextEl = nextEl;
            this.prevEl = prevEl;
        }

        public void setCurrentElement(Bank currentEl) {
            this.currentEl = currentEl;
        }

        public void setNextElement(myLinkedList.Node nextEl) {
            this.nextEl = nextEl;
        }

        public void setPreviousElement(myLinkedList.Node prevEl) {
            this.prevEl = prevEl;
        }

        public Bank getCurrentElement() {
            return currentEl;
        }

        public myLinkedList.Node getNextElement() {
            return nextEl;
        }

        public myLinkedList.Node getPreviousElement() {
            return prevEl;
        }

    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }

    @Override
    public <T> T[] toArray(T[] a) {
        if (a.length == size()) {
            Iterator<Bank> iterator = this.iterator();
            Bank target = iterator.next();
            for (int i = 0; i < size(); i++) {
                a[i] = (T) target;
                target = iterator.next();
            }
            return a;
        }
        if (a.length > size()) {
            Iterator<Bank> iterator = this.iterator();
            Bank target = iterator.next();
            for (int i = 0; i < size(); i++) {
                a[i] = (T) target;
                target = iterator.next();
            }
            for (int i = size(); i < a.length; i++) {
                a[i] = null;
            }
            return a;
        }
        a = (T[]) (new Bank[size()]);
        Iterator<Bank> iterator = this.iterator();
        Bank target = iterator.next();
        for (int i = 0; i < size(); i++) {
            a[i] = (T) target;
            target = iterator.next();
        }
        return a;
    }

    @Override
    public Iterator<Bank> iterator() {
        return new _bankIterator(this);
    }

    @Override
    public boolean contains(Object o) {
        if (o instanceof Bank) {
            Node target = firstNode.getNextElement();
            for (int i = 0; i < size; i++) {
                if (target.getCurrentElement().equals(o)) return true;
                target = target.getNextElement();
            }
        }
        return false;
    }

    @Override
    public boolean add(Bank bank) {
        Node prev = lastNode;
        prev.setCurrentElement(bank);
        lastNode = new Node(null, prev, null);
        prev.setNextElement(lastNode);
        size++;
        return true;
    }

    @Override
    public boolean remove(Object o) {
        Node target = firstNode.getNextElement();

        if (target.getCurrentElement() == o) {
            firstNode = firstNode.getNextElement();
            firstNode.setNextElement(target.getNextElement());
            size--;
            firstNode.setCurrentElement(null);
            return true;
        }
        for (int i = 0; i < size() - 1; i++) {
            if (target.getCurrentElement() == o) {
                target.getPreviousElement().setNextElement(target.getNextElement());
                target.getNextElement().setPreviousElement(target.getPreviousElement());
                size--;
                return true;
            }
            target = target.getNextElement();
        }

        // check last one
        if (target.getCurrentElement() == o) {
            lastNode = lastNode.getPreviousElement();
            lastNode.setPreviousElement(target.getPreviousElement());
            size--;
            lastNode.setCurrentElement(null);
            return true;
        }
        return false;
    }

    @Override
    public boolean containsAll(Collection<?> c) {
        for (Object i : c) {
            if (this.contains(i)) continue;
            return false;
        }
        return true;
    }

    @Override
    public boolean addAll(int index, Collection<? extends Bank> c) {
        if (index == 0) {
            Node cur = firstNode.getNextElement();
            firstNode.setNextElement(((myLinkedList) c).firstNode.getNextElement());
            firstNode.getNextElement().setPreviousElement(firstNode);
            ((myLinkedList) c).lastNode.getPreviousElement().setNextElement(cur);
            size = size + c.size();
            return true;
        }
        if (index == size() - 1) {
            addAll((myLinkedList) c);
            return true;
        }
        Node cur = firstNode.getNextElement();
        for (int i = 0; i < index - 1; i++) {
            cur = cur.getNextElement();
        }
        Node next = cur.getNextElement();
        cur.setNextElement(((myLinkedList) c).firstNode.getNextElement());
        ((myLinkedList) c).firstNode.getNextElement().setPreviousElement(cur);
        ((myLinkedList) c).lastNode.getPreviousElement().setNextElement(next);
        next.setPreviousElement(((myLinkedList) c).lastNode.getPreviousElement());
        size = size + c.size();
        return true;
    }

    @Override
    public boolean addAll(Collection<? extends Bank> c) {
        for (Bank i : c) {
            if (this.add(i)) continue;
            return false;
        }
        return true;
    }

    @Override
    public boolean retainAll(Collection<?> c) {
        for (Bank i : this) {
            if (!((myLinkedList) c).contains(i)) {
                while (remove(i)) ;
            }
        }
        return true;
    }

    @Override
    public boolean removeAll(Collection<?> c) {
        for (Bank i : (myLinkedList) c) {
            while (remove(i)) {
            }
        }
        return true;
    }

    @Override
    public Bank get(int index) {
        if (index >= size()) throw new IndexOutOfBoundsException("Index out of bounds!");
        Node target = firstNode.getNextElement();
        for (int i = 0; i < index; i++) {
            target = target.getNextElement();
        }
        Bank result = target.getCurrentElement();
        return result;
    }

    @Override
    public void clear() {
        firstNode.setNextElement(lastNode);
        lastNode.setPreviousElement(firstNode);
        size = 0;
    }

    @Override
    public Bank set(int index, Bank element) {
        if (index >= size()) throw new IndexOutOfBoundsException("Index out of bounds!");
        Node target = firstNode.getNextElement();
        for (int i = 0; i < index; i++) {
            target = target.getNextElement();
        }
        target.setCurrentElement(element);
        return element;
    }

    @Override
    public List<Bank> subList(int fromIndex, int toIndex) {
        myLinkedList list = new myLinkedList();
        for (Bank i : this) {
            list.add(i);
        }
        return list;
    }

    @Override
    public Bank remove(int index) {
        if (index >= size()) throw new IndexOutOfBoundsException("Index is out of bounds!");
        Node target = firstNode.getNextElement();

        if (index == 0) {
            firstNode = firstNode.getNextElement();
            firstNode.setNextElement(target.getNextElement());
            firstNode.setCurrentElement(null);
            size--;
            return target.getCurrentElement();
        }

        if (index == size() - 1) {
            lastNode = lastNode.getPreviousElement();
            size--;
            Bank result = lastNode.getCurrentElement();
            lastNode.setCurrentElement(null);
            return result;
        }

        for (int i = 0; i < index; i++) {
            target = target.getNextElement();
        }

        target.getPreviousElement().setNextElement(target.getNextElement());
        target.getNextElement().setPreviousElement(target.getPreviousElement());
        size--;

        return target.getCurrentElement();
    }

    @Override
    public void add(int index, Bank element) {
        if (index >= size()) throw new IndexOutOfBoundsException("Индекс выходит за пределы коллекции");
        if (index == 0) {
            Node next = firstNode;
            next.setCurrentElement(element);
            firstNode = new Node(null, null, next);
            next.setPreviousElement(firstNode);
            size++;
            return;
        }

        if (index == size() - 1) {
            add(element);
            return;
        }

        Node target = firstNode.getNextElement();
        for (int i = 0; i < index - 1; i++) {
            target = target.getNextElement();
        }
        Node cur = new Node(element, target, target.getNextElement());
        target.setNextElement(cur);
        target.getNextElement().setPreviousElement(cur);
        size++;
    }

    @Override
    public int lastIndexOf(Object o) {
        Node target = lastNode.getPreviousElement();
        for (int i = size() - 1; i >= 0; i--) {
            if (target.getCurrentElement().equals(o)) return i;
            target = target.getPreviousElement();
        }
        return -1;
    }

    @Override
    public ListIterator<Bank> listIterator() {
        return new bankIterator(this);
    }

    @Override
    public int indexOf(Object o) {
        Iterator<Bank> iterator = this.iterator();
        Bank target = iterator.next();
        for (int i = 0; i < size(); i++) {
            if (target.equals(o)) {
                return i;
            }
            target = iterator.next();
        }
        return -1;
    }

    @Override
    public ListIterator<Bank> listIterator(int index) {
        return new bankIterator(this, index);
    }

    @Override
    public Object[] toArray() {
        Bank[] result = new Bank[size()];
        Iterator<Bank> iterator = this.iterator();
        Bank target = iterator.next();
        for (int i = 0; i < size(); i++) {
            result[i] = target;
            target = iterator.next();
        }
        return result;
    }

    @Override
    public void sort(Comparator<? super Bank> c) {
        Object[] a = this.toArray();
        Arrays.sort(a, (Comparator) c);
        ListIterator<Bank> i = this.listIterator();
        for (Object e : a) {
            i.next();
            i.set((Bank) e);
        }
    }

    @Override
    public String toString() {
        StringBuilder strB = new StringBuilder();
        for (Bank x : this) {
            if (x == null) continue;

            strB.append(x.toString() + "\n");
        }

//        String ss = strB.toString();

        return strB.toString();
    }
}
