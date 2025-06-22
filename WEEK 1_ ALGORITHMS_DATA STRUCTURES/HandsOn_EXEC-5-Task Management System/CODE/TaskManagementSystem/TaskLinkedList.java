package TaskManagementSystem;

public class TaskLinkedList {
    Node head;

    public void addTask(Task task) {
        Node newNode = new Node(task);
        if (head == null) {
            head = newNode;
        } else {
            Node curr = head;
            while (curr.next != null) {
                curr = curr.next;
            }
            curr.next = newNode;
        }
    }

    public Task searchTask(int taskId) {
        Node curr = head;
        while (curr != null) {
            if (curr.task.taskId == taskId) {
                return curr.task;
            }
            curr = curr.next;
        }
        return null;
    }

    public void deleteTask(int taskId) {
        if (head == null)
            return;

        if (head.task.taskId == taskId) {
            head = head.next;
            return;
        }

        Node curr = head;
        while (curr.next != null && curr.next.task.taskId != taskId) {
            curr = curr.next;
        }

        if (curr.next != null) {
            curr.next = curr.next.next;
        }
    }

    public void displayTasks() {
        Node curr = head;
        while (curr != null) {
            System.out.println(curr.task);
            curr = curr.next;
        }
    }
}
