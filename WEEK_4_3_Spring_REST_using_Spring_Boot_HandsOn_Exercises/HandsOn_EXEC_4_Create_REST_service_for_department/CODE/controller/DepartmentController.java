package com.cognizant.spring_rest.controller;

import com.cognizant.spring_rest.model.Department;
import com.cognizant.spring_rest.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @GetMapping("/departments")
    public List<Department> getAllDepartments() {
        System.out.println("DepartmentController: /departments endpoint called");
        return departmentService.getAllDepartments();
    }
}
