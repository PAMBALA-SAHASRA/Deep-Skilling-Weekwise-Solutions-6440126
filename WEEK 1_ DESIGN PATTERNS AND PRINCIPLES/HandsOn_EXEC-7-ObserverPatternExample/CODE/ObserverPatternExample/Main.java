package ObserverPatternExample;

// It is  the main method.
public class Main {
    public static void main(String[] args) {
        StockMarket stockMarket = new StockMarket();

        Observer mobileA = new MobileApp("UserA");
        Observer mobileB = new MobileApp("UserB");
        Observer web1 = new WebApp("BrowserX");

        stockMarket.registerObserver(mobileA);
        stockMarket.registerObserver(mobileB);
        stockMarket.registerObserver(web1);

        stockMarket.setStockPrice(101.50);
        System.out.println();

        stockMarket.deregisterObserver(mobileB);
        stockMarket.setStockPrice(107.25);
    }

}
