/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import Modelo.Usuario;
import Modelo.UsuarioDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Para que las tildes y la ñ se guarden bien
        request.setCharacterEncoding("UTF-8");

        Usuario u = new Usuario();
        u.setNombre(request.getParameter("nombres"));
        u.setUsuario(request.getParameter("usuario"));
        u.setCorreo(request.getParameter("correo"));
        u.setClave(request.getParameter("clave"));
        u.setRol(2); // el rol se fija aquí, no se recibe del formulario

        int resultado = new UsuarioDao().NuevaCuenta(u);

        if (resultado > 0) {
            response.sendRedirect(request.getContextPath() + "/index.jsp?registro=ok");
        } else {
            response.sendRedirect(request.getContextPath() + "/Vista/Acounts/registro.jsp?error=1");
        }
    }
}
