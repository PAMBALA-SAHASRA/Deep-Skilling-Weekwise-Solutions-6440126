package com.example.country.service;

import com.example.country.entity.Country;
import com.example.country.service.exception.CountryNotFoundException;

public interface CountryService {
    
    // Method to find a country by its code
    Country findCountryByCode(String code) throws CountryNotFoundException;

    // Method to add a new country
    void addCountry(Country country);
}
