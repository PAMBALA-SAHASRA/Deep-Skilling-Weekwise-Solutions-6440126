package com.library.service;

import com.library.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;
    private String serviceName;

    // Constructor injection mrthod
    public BookService(String serviceName) {
        this.serviceName = serviceName;
        System.out.println("Constructor called with serviceName = " + serviceName);
    }

    // Setter injection
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
        System.out.println("Setter for BookRepository called.");
    }

    public void performService(String bookName) {
        System.out.println("Service Name: " + serviceName);
        bookRepository.saveBook(bookName);
    }
}
