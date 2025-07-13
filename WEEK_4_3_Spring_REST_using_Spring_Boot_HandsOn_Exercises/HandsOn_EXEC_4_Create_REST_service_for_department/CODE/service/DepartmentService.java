package com.cognizant.spring_rest.service;

import com.cognizant.spring_rest.dao.DepartmentDao;
import com.cognizant.spring_rest.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentDao departmentDao;

    @Transactional
    public List<Department> getAllDepartments() {
        System.out.println("DepartmentService: Fetching all departments");
        return departmentDao.getAllDepartments();
    }
}
