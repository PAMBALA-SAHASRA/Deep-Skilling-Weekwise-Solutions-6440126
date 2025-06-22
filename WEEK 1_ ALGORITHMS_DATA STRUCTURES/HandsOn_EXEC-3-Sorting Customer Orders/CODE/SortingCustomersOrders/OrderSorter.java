package SortingCustomersOrders;

public class OrderSorter {
    public static void bubbleSort(Order[] orders) {
        int n = orders.length;
        for (int p = 0; p < n - 1; p++) {
            for (int q = 0; q < n - p - 1; q++) {
                if (orders[q].totalPrice > orders[q + 1].totalPrice) {
                    Order temp = orders[q];
                    orders[q] = orders[q + 1];
                    orders[q + 1] = temp;
                }
            }
        }
    }

    public static void quickSort(Order[] orders, int low, int high) {
        if (low < high) {
            int pivotIndex = partition(orders, low, high);
            quickSort(orders, low, pivotIndex - 1);
            quickSort(orders, pivotIndex + 1, high);
        }
    }

    private static int partition(Order[] orders, int low, int high) {
        double pivot = orders[high].totalPrice;
        int p = low - 1;
        for (int q = low; q < high; q++) {
            if (orders[q].totalPrice <= pivot) {
                p++;
                Order temp = orders[p];
                orders[p] = orders[q];
                orders[q] = temp;
            }
        }
        Order temp = orders[p + 1];
        orders[p + 1] = orders[high];
        orders[high] = temp;
        return p + 1;
    }
}
