<%-- 
    Document   : registro.jsp
    Created on : 19/11/2026, 10:54:50 p. m.
    Author     : atues
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registro — FAST Gestión de Calidad</title>
<!-- Mismo CSS del inicio de sesión -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Public/css/styles_inicio_secion.css">

</head>
<body>
  <div class="pagina">
    <aside class="panel-marca">
      <div class="marca-contenido">
        <div class="logo-caja">
          <img src="${pageContext.request.contextPath}/Public/Image/logo.png" alt="FAST Gestión de Calidad">
        </div>
        <h2>Únase a su equipo de calidad</h2>
        <p class="lead">Cree su cuenta para registrar inspecciones, controlar no conformidades y generar reportes desde la obra.</p>
        <ul class="caracteristicas">
          <li>Checklists de verificación según ISO 9001</li>
          <li>Registro fotográfico de inspecciones en campo</li>
          <li>Reportes listos para auditoría en minutos</li>
        </ul>
      </div>
    </aside>

    <main class="panel-form">
      <form class="formulario" id="formRegistro"
            action="${pageContext.request.contextPath}/RegistroServlet" method="post" novalidate>
        <h1>Crear cuenta</h1>
        <p class="sub">Complete sus datos para solicitar acceso</p>

        <p class="aviso" id="aviso" role="alert"></p>

        <div class="dos-columnas">
          <!-- nombre -->
          <div class="campo">
            <label for="nombres">Nombres</label>
            <input id="nombres" name="nombres" type="text" autocomplete="given-name"
                   placeholder="Juan David" required>
            <span class="error-campo">Ingrese sus nombres.</span>
          </div>
          <!-- usuario -->
          <div class="campo">
            <label for="usuario">Usuario</label>
            <input id="usuario" name="usuario" type="text" autocomplete="username"
                   placeholder="juanperez" required>
            <span class="error-campo">Ingrese un nombre de usuario.</span>
          </div>
        </div>

        <!-- correo electrónico -->
        <div class="campo">
          <label for="correo">Correo electrónico</label>
          <input id="correo" name="correo" type="email" autocomplete="email"
                 placeholder="nombre@empresa.com" required>
          <span class="error-campo">Ingrese un correo válido.</span>
        </div>

        <!-- contraseña -->
        <div class="campo">
          <label for="clave">Contraseña</label>
          <div class="entrada">
            <input id="clave" name="clave" type="password" autocomplete="new-password"
                   placeholder="••••••••" required>
            <button type="button" class="ver" data-objetivo="clave" aria-label="Mostrar contraseña">Mostrar</button>
          </div>
          <p class="ayuda">Mínimo 8 caracteres, con letras y números.</p>
        </div>

        <!-- botón crear cuenta (el rol se asigna en RegistroServlet) -->
        <button class="principal" type="submit">Crear cuenta</button>
        <p class="pie">¿Ya tiene cuenta? <a href="${pageContext.request.contextPath}/index.jsp">Ingrese aquí</a></p>
      </form>
    </main>
  </div>
<script src="${pageContext.request.contextPath}/Public/js/registro.js"></script>
</body>

</html>
