public class Main {
    public static void main(String[] args) {
        // WOrd document creating part
        DocumentFactory wordFactory = new WordDocumentFactory();
        Document wordD = wordFactory.createDocument();
        wordD.open();
        wordD.save();
        // Pdf document creating part
        DocumentFactory pdfFactory = new PdfDocumentFactory();
        Document pdfD = pdfFactory.createDocument();
        pdfD.open();
        pdfD.save();
        // Excel Sheet document creating part
        DocumentFactory excelFactory = new ExcelDocumentFactory();
        Document excelD = excelFactory.createDocument();
        excelD.open();
        excelD.save();

    }
}