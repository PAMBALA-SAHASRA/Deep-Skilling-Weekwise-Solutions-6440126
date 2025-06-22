// class named Test has created 
public class Test {
    public static void main(String[] args) {
        System.out.println("Testing Singleton Logger.");

        Logger loggerA = Logger.getInstance();
        loggerA.log("It is the first Log message");

        Logger loggerB = Logger.getInstance();
        loggerB.log("It is the second Log message");

        if (loggerA == loggerB) {
            System.out.println("Both logger instances are the same,Singleton Verified.");
        } else {
            System.out.println("Different logger instances, Singleton Failed.");
        }

    }

}
