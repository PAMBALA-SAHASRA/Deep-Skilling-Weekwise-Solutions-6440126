public class TestAdapterPattern {
    public static void main(String[] args) {
        // Using Razorpay payemnt method
        RazorPayGateway razorpay = new RazorPayGateway();
        PaymentProcessor razorpayProcessor = new RazorpayAdapter(razorpay);
        razorpayProcessor.processPayment(1500.00);

        // Using Amazonpay payment method
        AmazonPayGateway amazonPay = new AmazonPayGateway();
        PaymentProcessor amazonPayProcessor = new AmazonpayAdapter(amazonPay);
        amazonPayProcessor.processPayment(2200.00);
    }
}
