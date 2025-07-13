package com.cognizant.spring_rest.dao;

import com.cognizant.spring_rest.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmployeeDao {

    private final List<Employee> employeeList;

    @Autowired
    public EmployeeDao(@Qualifier("employeeList") List<Employee> employeeList) {
        this.employeeList = employeeList;
    }

    public List<Employee> getAllEmployees() {
        return employeeList;
    }

    public Employee getEmployeeById(String id) {
        return employeeList.stream()
                .filter(emp -> emp.getId().equalsIgnoreCase(id))
                .findFirst()
                .orElse(null);
    }
}
