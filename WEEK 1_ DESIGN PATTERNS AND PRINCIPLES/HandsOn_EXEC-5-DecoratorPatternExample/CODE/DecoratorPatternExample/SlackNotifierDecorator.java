package DecoratorPatternExample;

public class SlackNotifierDecorator extends NotifierDecorator {
    public SlackNotifierDecorator(Notifier notifier) {
        super(notifier);
    }

    @Override
    public void send(String msg) {
        super.send(msg);
        sendSlackMessage(msg);
    }

    private void sendSlackMessage(String msg) {
        System.out.println("Slack Message Posted: \" " + msg + "\"");
    }
}
