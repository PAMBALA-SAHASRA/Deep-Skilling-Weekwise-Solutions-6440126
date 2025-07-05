package com.example.country;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {
    "com.example.country.controller",
    "com.example.country.service",
    "com.example.country.repository",
    "com.example.country.entity"
})
public class CountryAppApplication {

    public static void main(String[] args) {
        SpringApplication.run(CountryAppApplication.class, args);
    }
}
