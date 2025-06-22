package TaskManagementSystem;

public class Main {
    public static void main(String[] args) {
        TaskLinkedList taskList = new TaskLinkedList();

        taskList.addTask(new Task(1, "Design UI", "Pending"));
        taskList.addTask(new Task(2, "Build Backend", "In Progress"));
        taskList.addTask(new Task(3, "Testing", "Not Started"));

        System.out.println("All Tasks:");
        taskList.displayTasks();

        System.out.println("\nSearch for Task ID 3:");
        Task foundTask = taskList.searchTask(3);
        System.out.println(foundTask != null ? foundTask : "Task not found");

        System.out.println("\nDelete Task ID 2");
        taskList.deleteTask(2);
        taskList.displayTasks();
    }
}
