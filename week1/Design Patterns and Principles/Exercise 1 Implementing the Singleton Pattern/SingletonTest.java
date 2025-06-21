public class SingletonTest {
    public static void main(String[] args) {
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();
        
        System.out.println();

        if (logger1 == logger2) {
            System.out.println("Logger instances are the same.");
        } else {
            System.out.println("Logger instances are different.");
        }
        
        logger1.log("This is a test log message.");
        logger2.log("This is another test log message.");
    }
}