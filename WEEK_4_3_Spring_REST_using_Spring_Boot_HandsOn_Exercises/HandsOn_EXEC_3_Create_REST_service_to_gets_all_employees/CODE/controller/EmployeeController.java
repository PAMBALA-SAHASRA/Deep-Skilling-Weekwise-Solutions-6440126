package com.cognizant.spring_rest.controller;

import com.cognizant.spring_rest.model.Employee;
import com.cognizant.spring_rest.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/employees")  // ✅ REQUIRED
    public List<Employee> getAllEmployees() {
        return employeeService.getAllEmployees();
    }
}
