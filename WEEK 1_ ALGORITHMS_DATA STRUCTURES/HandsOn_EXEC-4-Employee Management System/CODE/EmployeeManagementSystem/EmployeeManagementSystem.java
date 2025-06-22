package EmployeeManagementSystem;

public class EmployeeManagementSystem {
    private Employee[] employees;
    private int count;

    public EmployeeManagementSystem(int size) {
        employees = new Employee[size];
        count = 0;
    }

    // Adding employee
    public void addEmployee(Employee emp) {
        if (count < employees.length) {
            employees[count++] = emp;
        } else {
            System.out.println("Employee list is full!");
        }
    }

    // Searching employee by their ID
    public Employee searchEmployee(int id) {
        for (int i = 0; i < count; i++) {
            if (employees[i].getEmployeeId() == id) {
                return employees[i];
            }
        }
        return null;
    }

    // Traversing entire system (display all)
    public void displayAllEmployees() {
        for (int i = 0; i < count; i++) {
            employees[i].display();
        }
    }

    // Deleting employee by ID
    public void deleteEmployee(int id) {
        boolean found = false;
        for (int i = 0; i < count; i++) {
            if (employees[i].getEmployeeId() == id) {
                // Shifting elements left
                for (int j = i; j < count - 1; j++) {
                    employees[j] = employees[j + 1];
                }
                employees[--count] = null;
                found = true;
                System.out.println("Employee deleted.");
                break;
            }
        }
        if (!found) {
            System.out.println("Employee not found.");
        }
    }
}
