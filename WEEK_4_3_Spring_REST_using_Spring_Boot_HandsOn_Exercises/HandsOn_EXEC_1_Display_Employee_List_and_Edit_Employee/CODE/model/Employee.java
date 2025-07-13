package com.cognizant.spring_rest.model;

import java.util.List;

public class Employee {
    private String id;
    private String name;
    private Department department;
    private List<String> skills;

    public Employee(String id, String name, Department department, List<String> skills) {
        this.id = id;
        this.name = name;
        this.department = department;
        this.skills = skills;
    }

    public Employee() {
        // No-arg constructor needed by Spring/XML
    }

    //  Getters
    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Department getDepartment() {
        return department;
    }

    public List<String> getSkills() {
        return skills;
    }

    // ✅ Setters
    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills;
    }
}
