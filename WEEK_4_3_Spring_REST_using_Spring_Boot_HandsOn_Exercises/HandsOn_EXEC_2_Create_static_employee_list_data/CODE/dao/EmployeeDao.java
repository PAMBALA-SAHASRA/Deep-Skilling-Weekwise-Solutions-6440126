package com.cognizant.spring_rest.dao;

import com.cognizant.spring_rest.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class EmployeeDao {

    public static List<Employee> EMPLOYEE_LIST = new ArrayList<>();

    @Autowired
    public EmployeeDao(@Qualifier("employeeList") List<Employee> employees) {
        EMPLOYEE_LIST = employees;
    }

    public List<Employee> getAllEmployees() {
        return EMPLOYEE_LIST;
    }
}
