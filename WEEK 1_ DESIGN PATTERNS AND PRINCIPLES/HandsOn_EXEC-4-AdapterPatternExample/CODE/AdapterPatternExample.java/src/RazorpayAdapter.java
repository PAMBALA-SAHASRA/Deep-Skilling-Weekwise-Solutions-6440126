public class RazorpayAdapter implements PaymentProcessor {
    private RazorPayGateway razorpayGateway;

    public RazorpayAdapter(RazorPayGateway razorpayGateway) {
        this.razorpayGateway = razorpayGateway;
    }

    @Override
    public void processPayment(double amount) {
        razorpayGateway.executePayment(amount);
    }
}