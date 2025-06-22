import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        // Collecting the user input such as present values , annual gwoth, number of
        // years.
        System.out.print("Enter the present value of the investment: ");
        double presentValue = sc.nextDouble();

        System.out.print("Enter the annual growth rate(e.g., 0.05 for 5%): ");
        double growthRate = sc.nextDouble();

        System.out.print("Enter the number of years to forecast: ");
        int years = sc.nextInt();
        // Creating an instance of ForcastCalculator
        ForecastCalculator calci = new ForecastCalculator();
        double futureValue = calci.getFutureValue(presentValue, growthRate, years);

        System.out.printf("Estimated future value after %d years: %.2f%n", years, futureValue);
        sc.close();
    }
}
