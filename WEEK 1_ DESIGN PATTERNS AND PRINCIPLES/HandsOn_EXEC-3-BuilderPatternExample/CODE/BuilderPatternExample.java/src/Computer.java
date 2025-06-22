public class Computer {
    private String CPU;
    private String RAM;
    private String Storage;
    private String GraphicsCard;
    private String Os;

    private Computer(Builder builder) {
        this.CPU = builder.CPU;
        this.RAM = builder.RAM;
        this.Storage = builder.Storage;
        this.GraphicsCard = builder.GraphicsCard;
        this.Os = builder.Os;
    }

    public static class Builder {
        private String CPU;
        private String RAM;
        private String Storage;
        private String GraphicsCard;
        private String Os;

        public Builder(String CPU, String RAM) {
            this.CPU = CPU;
            this.RAM = RAM;
        }

        public Builder setStorage(String Storage) {
            this.Storage = Storage;
            return this;
        }

        public Builder setGraphicsCard(String graphicsCard) {
            this.GraphicsCard = graphicsCard;
            return this;
        }

        public Builder setOs(String Os) {
            this.Os = Os;
            return this;
        }

        public Computer build() {
            return new Computer(this);
        }
    }

    public void showSpecs() {
        System.out.println("CPU: " + CPU);
        System.out.println("RAM: " + RAM);
        System.out.println("Storage: " + (Storage != null ? Storage : "Not included"));
        System.out.println("Graphics Card: " + (GraphicsCard != null ? GraphicsCard : "Not included"));
        System.out.println("Operating System: " + (Os != null ? Os : "Not included"));
        System.out.println("------------------------------------");
    }
}
