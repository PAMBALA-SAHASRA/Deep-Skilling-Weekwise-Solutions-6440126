package com.cognizant.spring_rest.dao;

import com.cognizant.spring_rest.model.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DepartmentDao {

    public static List<Department> DEPARTMENT_LIST;

    @Autowired
    public DepartmentDao(@Qualifier("departmentList") List<Department> departments) {
        DEPARTMENT_LIST = departments;
    }

    public List<Department> getAllDepartments() {
        System.out.println("DepartmentDao: Returning department list from XML");
        return DEPARTMENT_LIST;
    }
}
