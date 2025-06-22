import MVCPatternExample.Student;
import MVCPatternExample.StudentController;
import MVCPatternExample.StudentView;
public class MVCPatternDemo {
    public static void main(String[] args) {
        Student stdnt = new Student("Sony", "S123", "A+");

        StudentView view = new StudentView();

        StudentController controller = new StudentController(stdnt, view);

        controller.updateView();
        System.out.println("\nUpdating student details...\n");

        controller.setStudentName("Bunny");
        controller.setStudentId("S456");
        controller.setStudentGrade("B+");

        controller.updateView();
    }

}
