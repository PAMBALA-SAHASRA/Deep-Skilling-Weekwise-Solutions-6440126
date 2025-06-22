package DecoratorPatternExample;

public class NotificationTest {
    public static void main(String[] args) {
        Notifier baseNotifier = new EmailNotifier();

        Notifier smsDecorator = new SMSNotifierDecorator(baseNotifier);

        Notifier slackDecorator = new SlackNotifierDecorator(smsDecorator);

        slackDecorator.send("Your order has been shipped.");
    }
}
