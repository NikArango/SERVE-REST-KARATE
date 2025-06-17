package karate.models;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Producto {
    public static void limpiarCsv() {
        String filename = "src/test/java/resources/response/productos/registrarProductos.csv";
        String data = "id"; // Datos a agregar

        try (FileWriter fileWriter = new FileWriter(filename, false); // true para append
             PrintWriter printWriter = new PrintWriter(fileWriter)) {
            printWriter.println(data); // Escribir los datos en una nueva línea

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void registrarEnCsv(String id) {
        String filename = "src/test/java/resources/response/productos/registrarProductos.csv";

        try (FileWriter fileWriter = new FileWriter(filename, true); // true para append
             PrintWriter printWriter = new PrintWriter(fileWriter)) {
            printWriter.println(id); // Escribir los datos en una nueva línea

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
