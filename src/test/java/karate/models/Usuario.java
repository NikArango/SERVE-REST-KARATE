package karate.models;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Usuario {
    public static void limpiarTokenCsv() {
        String filename = "src/test/java/resources/response/usuarios/loginUsuario.csv";
        String data = "authorization"; // Datos a agregar; // Datos a agregar

        try (FileWriter fileWriter = new FileWriter(filename, false); // true para append
             PrintWriter printWriter = new PrintWriter(fileWriter)) {
            printWriter.println(data); // Escribir los datos en una nueva línea

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void registrarTokenEnCsv(String authorization ) {
        String filename = "src/test/java/resources/response/usuarios/loginUsuario.csv";

        try (FileWriter fileWriter = new FileWriter(filename, true); // true para append
             PrintWriter printWriter = new PrintWriter(fileWriter)) {
            printWriter.println(authorization); // Escribir los datos en una nueva línea

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void limpiarInformacionCsv() {
        String filename = "src/test/java/resources/response/usuarios/obtenerUsuario.csv";
        String data = "nome,email,password,administrador"; // Datos a agregar; // Datos a agregar

        try (FileWriter fileWriter = new FileWriter(filename, false); // true para append
             PrintWriter printWriter = new PrintWriter(fileWriter)) {
            printWriter.println(data); // Escribir los datos en una nueva línea

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void registrarInformacionEnCsv(String nome,String email,String password,String administrador) {
        String filename = "src/test/java/resources/response/usuarios/obtenerUsuario.csv";

        String data = nome+","+email+","+password+","+administrador; // Datos a agregar

        try (FileWriter fileWriter = new FileWriter(filename, true); // true para append
             PrintWriter printWriter = new PrintWriter(fileWriter)) {
            printWriter.println(data); // Escribir los datos en una nueva línea

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void limpiarCsv() {
        String filename = "src/test/java/resources/response/usuarios/registrarUsuario.csv";

        String data = "id"; // Datos a agregar

        try (FileWriter fileWriter = new FileWriter(filename, false); // true para append
             PrintWriter printWriter = new PrintWriter(fileWriter)) {
            printWriter.println(data); // Escribir los datos en una nueva línea

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void registrarEnCsv(String id) {

        String filename = "src/test/java/resources/response/usuarios/registrarUsuario.csv";
        String data = "Nuevo valor, otro valor, un valor más"; // Datos a agregar

        try (FileWriter fileWriter = new FileWriter(filename, true); // true para append
             PrintWriter printWriter = new PrintWriter(fileWriter)) {
            printWriter.println(id); // Escribir los datos en una nueva línea
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
