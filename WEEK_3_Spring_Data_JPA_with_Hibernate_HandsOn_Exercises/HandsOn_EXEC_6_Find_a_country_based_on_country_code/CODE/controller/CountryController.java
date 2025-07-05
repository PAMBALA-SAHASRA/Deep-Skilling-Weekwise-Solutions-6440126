package com.example.country.controller;

import com.example.country.entity.Country;
import com.example.country.service.CountryService;
import com.example.country.service.exception.CountryNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/countries")
public class CountryController {

    @Autowired
    private CountryService countryService;

    @GetMapping("/{code}")
    public Country getCountryByCode(@PathVariable String code) throws CountryNotFoundException {
        return countryService.findCountryByCode(code);
    }

    @GetMapping("/")
    public String home() {
        return "Welcome to the Country App!";
    }
}
