package LibraryManagementSystem;

import java.util.*;

public class Main {
    public static void main(String[] args) {
        ArrayList<Book> library = new ArrayList<>();

        library.add(new Book(101, "The Alchemist", "Paulo Coelho"));
        library.add(new Book(102, "Harry Potter", "J.K. Rowling"));
        library.add(new Book(103, "The Hobbit", "J.R.R. Tolkien"));
        library.add(new Book(104, "Atomic Habits", "James Clear"));

        Scanner sc = new Scanner(System.in);
        System.out.print("Enter book title to search: ");
        String searchTitle = sc.nextLine();

        System.out.println("\n-- Linear Search --");
        Book result1 = LibrarySearch.linearSearchByTitle(library, searchTitle);
        if (result1 != null) {
            System.out.println("Found: " + result1);
        } else {
            System.out.println("Book not found.");
        }

        Collections.sort(library, Comparator.comparing(Book::getTitle, String.CASE_INSENSITIVE_ORDER));

        System.out.println("\n-- Binary Search --");
        Book result2 = LibrarySearch.binarySearchByTitle(library, searchTitle);
        if (result2 != null) {
            System.out.println("Found: " + result2);
        } else {
            System.out.println("Book not found.");
        }

        sc.close();
    }
}
