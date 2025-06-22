//creation of class named Logger
public class Logger {
    // created an instance using private static with Logger class
    private static volatile Logger oneinstance;

    // Logger constructor is created as private
    private Logger() {
        System.out.println("The Logger instance has Created.");
    }

    public static Logger getInstance() {
        if (oneinstance == null) {
            synchronized (Logger.class) {
                if (oneinstance == null) {
                    oneinstance = new Logger();
                }
            }
        }
        return oneinstance;
    }

    public void log(String message) {
        System.out.println("Log: " + message);
    }
}