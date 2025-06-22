public class ForecastCalculator {
    public double getFutureValue(double currentValue, double growthRate, int remainingYears) {
        // using of base condition : no more years to grow
        if (remainingYears == 0) {
            return currentValue;
        }
        // using Recursive Approach
        return getFutureValue(currentValue, growthRate, remainingYears - 1) * (1 + growthRate);
    }
}