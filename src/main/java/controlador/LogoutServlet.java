/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author atues
 */
public class LogoutServlet extends HttpServlet {

    /**
     * Procesa las peticiones GET y POST: cierra la sesión del usuario.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos la sesión actual si existe
        HttpSession session = request.getSession(false);

        // Si la sesión no es nula, se invalida: elimina todos sus atributos, incluido el objeto usuario
        if (session != null) {
            session.invalidate();
        }

        // Redirigir al usuario a la página de inicio de sesión
        response.sendRedirect(request.getContextPath() + "/index.jsp?estado=cerrado");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Cierra la sesión del usuario";
    }
}