package com.cognizant.springlearn.controller;

import com.cognizant.springlearn.model.Country;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

@RestController
public class CountryController {

    @GetMapping("/countries")
    public List<Country> getAllCountries() {
        ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");

        Country countryIN = context.getBean("country", Country.class);
        Country countryUS = context.getBean("countryUS", Country.class);
        Country countryDE = context.getBean("countryDE", Country.class);
        Country countryJP = context.getBean("countryJP", Country.class);

        return Arrays.asList(countryIN, countryUS, countryDE, countryJP);
    }
}
