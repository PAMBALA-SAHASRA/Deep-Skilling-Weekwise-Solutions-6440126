package com.example.country;

import org.springframework.context.ApplicationContext;
import com.example.country.entity.Country;
import com.example.country.service.CountryService;
import com.example.country.service.exception.CountryNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CountryAppApplication {

    private static CountryService countryService;

    private static final Logger LOGGER = LoggerFactory.getLogger(CountryAppApplication.class);

    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(CountryAppApplication.class, args);
        countryService = context.getBean(CountryService.class);
        testFindCountryByCode();
    }

    private static void testFindCountryByCode() {
        LOGGER.info("Start");
        try {
            Country country = countryService.findCountryByCode("IN");
            LOGGER.debug("Country: {}", country);
        } catch (CountryNotFoundException e) {
            LOGGER.error("Exception: {}", e.getMessage());
        }
        LOGGER.info("End");
    }
}
