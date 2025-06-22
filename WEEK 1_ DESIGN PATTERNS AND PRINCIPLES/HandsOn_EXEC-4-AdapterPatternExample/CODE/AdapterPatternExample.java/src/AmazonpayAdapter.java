public class AmazonpayAdapter implements PaymentProcessor {
    private AmazonPayGateway amazonPayGateway;

    public AmazonpayAdapter(AmazonPayGateway amazonPayGateway) {
        this.amazonPayGateway = amazonPayGateway;
    }

    @Override
    public void processPayment(double amount) {
        amazonPayGateway.makePayment(amount);

    }
}
