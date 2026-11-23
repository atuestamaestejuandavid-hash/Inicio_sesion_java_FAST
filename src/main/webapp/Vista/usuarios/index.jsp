<%-- 
    Document   : index
    Created on : 22/11/2026, 7:50:03 p. m.
    Author     : atues
--%>

<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Protege la página si no hay sesión, redirigir al login
    Usuario usuarioLogeado = (Usuario) session.getAttribute("usuario");
    if (usuarioLogeado == null || usuarioLogeado.getRol() != 2) {
        response.sendRedirect(request.getContextPath() + "/index.jsp?error=acceso");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fast Gestion de Calidad| Dashboard Usuario</title>
    </head>
    <body>
        <h1>Bienvenido, Nuevo Usuario: <%= usuarioLogeado.getNombre() %></h1>
        <a href="<%= request.getContextPath() %>/LogoutServlet">Cerrar sesión</a>
    </body>
</html>
