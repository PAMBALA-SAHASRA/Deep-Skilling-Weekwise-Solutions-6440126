package LibraryManagementSystem;

import java.util.*;

public class LibrarySearch {

    public static Book linearSearchByTitle(ArrayList<Book> books, String title) {
        for (Book b : books) {
            if (b.getTitle().equalsIgnoreCase(title)) {
                return b;
            }
        }
        return null;
    }

    public static Book binarySearchByTitle(ArrayList<Book> books, String title) {
        int left = 0;
        int right = books.size() - 1;

        while (left <= right) {
            int middle = (left + right) / 2;
            Book midBook = books.get(middle);

            int cmp = midBook.getTitle().compareToIgnoreCase(title);

            if (cmp == 0) {
                return midBook;
            } else if (cmp < 0) {
                left = middle + 1;
            } else {
                right = middle - 1;
            }
        }
        return null;
    }
}
