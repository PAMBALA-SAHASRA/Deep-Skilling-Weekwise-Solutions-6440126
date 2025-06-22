import java.util.Arrays;
import java.util.Comparator;

public class Main {
    public static Product linearSearch(Product[] products, String tName) {
        for (Product product : products) {
            if (product.productName.equalsIgnoreCase(tName)) {
                return product;
            }
        }
        return null;
    }

    public static Product binarySearch(Product[] products, String tName) {
        // using of arrays to sort them and comparison to arragne them in order
        Arrays.sort(products, Comparator.comparing(p -> p.productName.toLowerCase()));
        int left = 0, right = products.length - 1;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            int compare = products[mid].productName.compareToIgnoreCase(tName);
            if (compare == 0) {
                return products[mid];
            } else if (compare < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null;
    }

    public static void main(String[] args) {
        Product[] products = {
                new Product(1, "Laptop", "Electronics"),
                new Product(2, "Shampoo", "Beauty"),
                new Product(3, "Mobile", "Electronics"),
                new Product(4, "T-shirt", "Clothing"),
                new Product(5, "Headphones", "Electronics")
        };
        Product result1 = linearSearch(products, "Mobile");
        System.out.println("Linear Search Output: " + (result1 != null ? result1 : "Not Found"));

        Product result2 = binarySearch(products, "Mobile");
        System.out.println("Binary Search Output: " + (result2 != null ? result2 : "Not Found"));

    }
}
