/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author manja
 */
public class UsuarioDao {

    // funcion para validar usuarios
    public Usuario validar(String user, String pass) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE usuario = ? AND clave = ?";

        try (Connection conn = ConexionDao.getConexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user);
            pstmt.setString(2, pass);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setId(rs.getInt("id"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setRol(rs.getInt("rol"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al validar usuario: " + e.getMessage());
        }
        return usuario;
    }

    // metodo para registrar nueva cuenta (el rol 2 = estudiante se asigna al crear el Usuario)
    public int NuevaCuenta(Usuario user) {
        int result = 0;
        String sql = "INSERT INTO usuarios(nombre, usuario, correo, clave, rol) VALUES (?,?,?,?,?)";

        try(Connection conn = ConexionDao.getConexion();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getNombre());
            pstmt.setString(2, user.getUsuario());
            pstmt.setString(3, user.getCorreo());
            pstmt.setString(4, user.getClave());
            pstmt.setInt(5, user.getRol());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("Error al registrar usuario: " + e.getMessage());
        }
        return result;
    }
}