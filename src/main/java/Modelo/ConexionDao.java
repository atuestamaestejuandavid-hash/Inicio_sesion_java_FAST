/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDao {

    private static final String HOST = System.getenv("DB_HOST");
    private static final String PORT = System.getenv("DB_PORT");
    private static final String DB   = System.getenv("DB_NAME");
    private static final String USUARIO_NUBE = System.getenv("DB_USER");
    private static final String CLAVE_NUBE   = System.getenv("DB_PASS");

    public static Connection getConexion() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("No se encontró el driver de MySQL", e);
        }

        // En Render: usa TiDB Cloud con SSL
        if (HOST != null && !HOST.isEmpty()) {
            String url = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB
                    + "?useSSL=true&sslMode=VERIFY_IDENTITY&serverTimezone=UTC";
            return DriverManager.getConnection(url, USUARIO_NUBE, CLAVE_NUBE);
        }

        // En tu computador: MySQL local
        String urlLocal = "jdbc:mysql://localhost:3306/Inicio_secion?allowPublicKeyRetrieval=true&useSSL=false";
        return DriverManager.getConnection(urlLocal, "root", "");
    }

    public static void main(String[] args) {
        try (Connection con = getConexion()) {
            System.out.println("Conectado correctamente");
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}

