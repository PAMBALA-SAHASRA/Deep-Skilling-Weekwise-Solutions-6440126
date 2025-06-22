package StrategyPatternExample;

import StrategyPatternExample.strategy.PaymentContext;
import StrategyPatternExample.strategy.CreditCardPayment;
import StrategyPatternExample.strategy.PayPalPayment;

public class Main {
    public static void main(String[] args) {
        PaymentContext context = new PaymentContext();

        // Payment using Credit Card
        context.setPaymentStrategy(new CreditCardPayment());
        context.payAmount(2500.00);

        // Payment using PayPal
        context.setPaymentStrategy(new PayPalPayment());
        context.payAmount(3200.00);
    }
}
