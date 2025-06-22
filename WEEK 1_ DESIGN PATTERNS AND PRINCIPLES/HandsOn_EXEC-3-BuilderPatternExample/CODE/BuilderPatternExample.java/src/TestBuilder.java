public class TestBuilder {
    public static void main(String[] args) {
        // Basic computer
        Computer basicComputer = new Computer.Builder("Intel i3", "4GB").build();
        basicComputer.showSpecs();

        // Gaming computer
        Computer gamingComputer = new Computer.Builder("Intel i9", "32GB")
                .setStorage("2TB SSD")
                .setGraphicsCard("NVIDIA RTX 4090")
                .setOs("Windows 11 Pro")
                .build();
        gamingComputer.showSpecs();

        // Workstation computer
        Computer workstation = new Computer.Builder("AMD Ryzen 9", "64GB")
                .setStorage("1TB SSD + 2TB HDD")
                .setOs("Linux Ubuntu 24.04")
                .build();
        workstation.showSpecs();
    }
}
