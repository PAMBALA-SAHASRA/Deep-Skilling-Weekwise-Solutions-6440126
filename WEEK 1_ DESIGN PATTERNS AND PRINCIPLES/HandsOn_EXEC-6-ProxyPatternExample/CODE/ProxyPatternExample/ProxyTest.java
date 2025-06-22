package ProxyPatternExample;
// it is the main class 
public class ProxyTest {
    public static void main(String[] args) {
        Image imgA = new ProxyImage("photo1.jpg");
        Image imgB = new ProxyImage("photo2.jpg");

        System.out.println("\n--- First call to imageA ---");
        imgA.display();
        System.out.println("\n--- First call to imageB---");
        imgB.display();

    }
}