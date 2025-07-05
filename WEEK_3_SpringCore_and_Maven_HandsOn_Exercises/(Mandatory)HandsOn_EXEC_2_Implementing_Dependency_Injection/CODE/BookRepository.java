package com.di.repository;

public class BookRepository {
    public String getBookNameById(int id) {
        return "Dependency Injection in Spring (Book ID: " + id + ")";
    }
}
