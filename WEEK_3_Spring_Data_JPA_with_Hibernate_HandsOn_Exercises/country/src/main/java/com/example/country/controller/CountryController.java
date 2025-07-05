package com.example.country.controller;

import com.example.country.entity.Country;
import com.example.country.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/countries")
public class CountryController {

    @Autowired
    private CountryRepository countryRepository;

    @PostMapping("/add")
    public String addCountry(@RequestBody Country country) {
        countryRepository.save(country);
        return "Country added: " + country.getCoCode();
    }

    @GetMapping("/{code}")
    public Country getCountryByCode(@PathVariable String code) throws Exception {
        Optional<Country> country = countryRepository.findById(code);
        if (country.isPresent()) {
            return country.get();
        } else {
            throw new Exception("Country not found: " + code);
        }
    }
}
