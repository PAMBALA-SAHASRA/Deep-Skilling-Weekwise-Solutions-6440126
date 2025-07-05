package com.di.service;

import com.di.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;

    // Setter for Spring DI
    public void setBookRepository(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void showBook(int id) {
        System.out.println(bookRepository.getBookNameById(id));
    }
}
