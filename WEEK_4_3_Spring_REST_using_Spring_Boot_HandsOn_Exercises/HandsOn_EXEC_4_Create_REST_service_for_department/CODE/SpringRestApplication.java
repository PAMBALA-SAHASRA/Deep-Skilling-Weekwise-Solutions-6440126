package com.cognizant.spring_rest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@ImportResource("classpath:employee.xml")  // VERY IMPORTANT
public class SpringRestApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringRestApplication.class, args);
    }
}
