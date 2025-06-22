package EmployeeManagementSystem;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        EmployeeManagementSystem system = new EmployeeManagementSystem(100);
        try (Scanner sc = new Scanner(System.in)) {

            while (true) {
                System.out
                        .println("\n1. Add Employee\n2. Search Employee\n3. Display All\n4. Delete Employee\n5. Exit");
                int choice = sc.nextInt();

                switch (choice) {
                    case 1:
                        System.out.print("Enter ID: ");
                        int id = sc.nextInt();
                        sc.nextLine();
                        System.out.print("Enter Name: ");
                        String name = sc.nextLine();
                        System.out.print("Enter Position: ");
                        String position = sc.nextLine();
                        System.out.print("Enter Salary: ");
                        double salary = sc.nextDouble();
                        system.addEmployee(new Employee(id, name, position, salary));
                        break;

                    case 2:
                        System.out.print("Enter ID to search: ");
                        int searchId = sc.nextInt();
                        Employee found = system.searchEmployee(searchId);
                        if (found != null) {
                            found.display();
                        } else {
                            System.out.println("Employee not found.");
                        }
                        break;

                    case 3:
                        system.displayAllEmployees();
                        break;

                    case 4:
                        System.out.print("Enter ID to delete: ");
                        int deleteId = sc.nextInt();
                        system.deleteEmployee(deleteId);
                        break;

                    case 5:
                        System.out.println("Exiting...");
                        return;

                    default:
                        System.out.println("Invalid choice.");
                }
            }
        }
    }
}
