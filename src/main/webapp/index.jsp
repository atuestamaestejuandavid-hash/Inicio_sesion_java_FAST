<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ingresar — FAST Gestión de Calidad</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Public/css/styles_inicio_secion.css">

</head>
<body>
  <div class="pagina">
    <aside class="panel-marca">
      <div class="marca-contenido">
        <div class="logo-caja">
          <img src="${pageContext.request.contextPath}/Public/Image/logo.png" alt="FAST Gestión de Calidad">
        </div>
        <h2>Gestión de calidad</h2>
        <p class="lead">Registre inspecciones, controle no conformidades y genere reportes sin salir de la obra.</p>
        <ul class="caracteristicas">
          <li>Checklists de verificación según ISO 9001</li>
          <li>Registro fotográfico de inspecciones en campo</li>
          <li>Reportes listos para auditoría en minutos</li>
        </ul>
      </div>
    </aside>

    <main class="panel-form">
      <!-- formulario de inicio de sesión: envía por POST a LoginServlet -->
      <form class="formulario" id="formLogin"
            action="${pageContext.request.contextPath}/LoginServlet" method="post" novalidate>
        <h1>Ingresar</h1>
        <p class="sub">Ingrese sus credenciales para continuar</p>

        <p class="aviso" id="aviso" role="alert"></p>

        <div class="campo">
          <label for="usuario">Usuario</label>
          <input id="usuario" name="usuario" type="text" autocomplete="username"
                 placeholder="usuario" required>
        </div>

        <div class="campo">
          <label for="clave">Contraseña</label>
          <div class="entrada">
            <input id="clave" name="clave" type="password" autocomplete="current-password"
                   placeholder="••••••••" required>
            <button type="button" class="ver" id="verClave" aria-label="Mostrar contraseña">Mostrar</button>
          </div>
        </div>

        <button class="principal" type="submit">Ingresar</button>
        <!-- vinculación con la página de registro -->
        <a class="secundario" href="${pageContext.request.contextPath}/Vista/Acounts/registro.jsp">¿No tienes cuenta? Regístrate</a>
      </form>
    </main>
  </div>

<script>
document.addEventListener('DOMContentLoaded', function () {
  var form = document.getElementById('formLogin');
  var aviso = document.getElementById('aviso');
  var usuario = document.getElementById('usuario');
  var clave = document.getElementById('clave');
  var btnVer = document.getElementById('verClave');

  aviso.style.display = 'none';

  function mostrarAviso(texto, exito) {
    aviso.textContent = texto;
    aviso.style.display = 'block';
    aviso.style.background = exito ? '#e7f6ec' : '#fdecea';
    aviso.style.color = exito ? '#1e6b3a' : '#b42318';
    aviso.style.borderLeft = '4px solid ' + (exito ? '#2e9e5b' : '#b42318');
  }

  // Mostrar / ocultar contraseña
  btnVer.addEventListener('click', function () {
    var oculto = clave.type === 'password';
    clave.type = oculto ? 'text' : 'password';
    btnVer.textContent = oculto ? 'Ocultar' : 'Mostrar';
    btnVer.setAttribute('aria-label', oculto ? 'Ocultar contraseña' : 'Mostrar contraseña');
  });

  // Mensajes que llegan desde los servlets
  var params = new URLSearchParams(window.location.search);
  if (params.get('error') === '1') mostrarAviso('Usuario o contraseña incorrectos.', false);
  else if (params.get('error') === 'acceso') mostrarAviso('Debe iniciar sesión para entrar a esa página.', false);
  else if (params.get('error') === 'rol') mostrarAviso('Su cuenta no tiene un rol válido.', false);
  else if (params.get('estado') === 'cerrado') mostrarAviso('Sesión cerrada correctamente.', true);
  else if (params.get('registro') === 'ok') mostrarAviso('Cuenta creada. Ya puede ingresar.', true);

  // Solo se bloquea el envío si faltan datos; si están completos, viaja al servlet
  form.addEventListener('submit', function (e) {
    if (usuario.value.trim() === '' || clave.value === '') {
      e.preventDefault();
      mostrarAviso('Ingrese su usuario y su contraseña.', false);
    }
  });
});
</script>
</body>
</html>
