package com.library.service;

import com.library.repository.BookRepository;

public class BookService {
    // Book repository is created using private class
    private BookRepository bookRepository;

    // Spring will inject the dependency here
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void displayBookTitle() {
        System.out.println("Book Title: " + bookRepository.getBookTitle());
    }
}
