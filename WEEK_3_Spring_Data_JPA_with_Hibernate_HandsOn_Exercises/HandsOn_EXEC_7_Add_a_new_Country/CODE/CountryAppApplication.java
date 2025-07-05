package com.example.country;

import com.example.country.entity.Country;
import com.example.country.repository.CountryRepository;
import com.example.country.service.CountryService;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class CountryAppApplication {

    public static void main(String[] args) {
        SpringApplication.run(CountryAppApplication.class, args);
    }

    // Define service as a Spring Bean (without creating a separate class)
    @Bean
    public CountryService countryService(CountryRepository countryRepository) {
        return new CountryService() {
            @Override
            public void addCountry(Country country) {
                countryRepository.save(country);
            }

            @Override
            public Country findCountryByCode(String code) {
                return countryRepository.findById(code)
                        .orElseThrow(() -> new RuntimeException("Country not found for code: " + code));
            }
        };
    }

    // Main runner
    @Bean
    public CommandLineRunner run(CountryService countryService) {
        return args -> {
            System.out.println("== Running testAddCountry() ==");
            testAddCountry(countryService);
            System.out.println("== testAddCountry() complete ==");
        };
    }

    // Simulated test method
    public void testAddCountry(CountryService countryService) {
        try {
            Country newCountry = new Country("XY", "Xyland");
            countryService.addCountry(newCountry);
            System.out.println("Added country: " + newCountry.getCoCode());

            Country fetched = countryService.findCountryByCode("XY");
            System.out.println("Fetched country: " + fetched.getCoCode() + " - " + fetched.getCoName());

        } catch (Exception e) {
            System.out.println("Test failed: " + e.getMessage());
        }
    }
}
