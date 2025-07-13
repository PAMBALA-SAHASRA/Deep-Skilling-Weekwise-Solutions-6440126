package com.cognizant.spring_rest.service;

import com.cognizant.spring_rest.dao.EmployeeDao;
import com.cognizant.spring_rest.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    public List<Employee> getAllEmployees() {
        return employeeDao.getAllEmployees();
    }
}
