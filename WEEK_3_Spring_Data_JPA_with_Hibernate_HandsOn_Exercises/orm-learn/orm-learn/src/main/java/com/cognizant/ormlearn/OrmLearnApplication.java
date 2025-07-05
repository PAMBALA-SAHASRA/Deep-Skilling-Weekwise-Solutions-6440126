package com.cognizant.ormlearn;

import com.cognizant.ormlearn.entity.Employee;
import com.cognizant.ormlearn.service.EmployeeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class OrmLearnApplication {

    private static final Logger LOGGER = LoggerFactory.getLogger(OrmLearnApplication.class);

    @Autowired
    private static EmployeeService employeeService;

    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(OrmLearnApplication.class, args);
        employeeService = context.getBean(EmployeeService.class);
        testAddEmployee();
    }

    private static void testAddEmployee() {
        LOGGER.info("Start testAddEmployee()");
        Employee emp = new Employee("Alice", 70000.0);
        employeeService.addEmployee(emp);
        LOGGER.info("Employee added: {}", emp);
        LOGGER.info("End testAddEmployee()");
    }
}
