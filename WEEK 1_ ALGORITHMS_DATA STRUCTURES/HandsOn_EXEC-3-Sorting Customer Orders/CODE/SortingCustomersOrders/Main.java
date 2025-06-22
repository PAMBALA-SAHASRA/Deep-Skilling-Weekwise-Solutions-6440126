package SortingCustomersOrders;

import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Order[] orders = {
                new Order("001", "Aliya", 1500.50),
                new Order("002", "Bobby", 700.00),
                new Order("003", "Cherry", 2300.75),
                new Order("004", "Danny", 1200.10),
                new Order("005", "Eesha", 850.25)
        };

        System.out.println("Original Orders:");
        printOrders(orders);

        Order[] bubbleSorted = Arrays.copyOf(orders, orders.length);
        long bubbleStart = System.nanoTime();
        OrderSorter.bubbleSort(bubbleSorted);
        long bubbleEnd = System.nanoTime();

        System.out.println("\nOrders after Bubble Sort:");
        printOrders(bubbleSorted);
        System.out.println("Bubble Sort Time: " + (bubbleEnd - bubbleStart) + " ns");

        Order[] quickSorted = Arrays.copyOf(orders, orders.length);
        long quickStart = System.nanoTime();
        OrderSorter.quickSort(quickSorted, 0, quickSorted.length - 1);
        long quickEnd = System.nanoTime();

        System.out.println("\nOrders after Quick Sort:");
        printOrders(quickSorted);
        System.out.println("Quick Sort Time: " + (quickEnd - quickStart) + " ns");

        System.out.println("\n--- Analysis ---");
        System.out.println("Bubble Sort: O(n^2)");
        System.out.println("Quick Sort: O(n log n) on average");
    }

    private static void printOrders(Order[] orders) {
        for (Order order : orders) {
            System.out.println(order);
        }
    }
}
