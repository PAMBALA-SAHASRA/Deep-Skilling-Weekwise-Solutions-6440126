package com.library.main;

import com.library.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LibraryManagementApplication {
    public static void main(String[] args) {
        // Loading the Spring container from XML file
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        // Getting the BookService bean
        BookService bookService = (BookService) context.getBean("bookService");

        // It is used to Run method
        bookService.displayBookTitle();
    }
}
