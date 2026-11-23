/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', function () {
  const form = document.getElementById('formRegistro');
  const aviso = document.getElementById('aviso');

  // Ocultar todos los mensajes al cargar la página
  document.querySelectorAll('.error-campo').forEach(function (e) { e.style.display = 'none'; });
  aviso.style.display = 'none';

  // Si el servlet devolvió un error, mostrarlo
  if (new URLSearchParams(window.location.search).get('error') === '1') {
    mostrarAviso('No se pudo crear la cuenta. El usuario o el correo ya existen.', false);
  }

  // Mostrar / ocultar contraseña
  document.querySelectorAll('.ver').forEach(function (btn) {
    btn.addEventListener('click', function () {
      const input = document.getElementById(btn.dataset.objetivo);
      const oculto = input.type === 'password';
      input.type = oculto ? 'text' : 'password';
      btn.textContent = oculto ? 'Ocultar' : 'Mostrar';
      btn.setAttribute('aria-label', oculto ? 'Ocultar contraseña' : 'Mostrar contraseña');
    });
  });

  // Muestra el error solo si el campo es inválido
  function marcar(input, valido, mensaje) {
    const campo = input.closest('.campo');
    let error = campo.querySelector('.error-campo');
    if (!error) {
      error = document.createElement('span');
      error.className = 'error-campo';
      campo.appendChild(error);
    }
    if (mensaje) error.textContent = mensaje;
    error.style.color = '#b42318';
    error.style.fontSize = '0.85rem';
    error.style.display = valido ? 'none' : 'block';
    return valido;
  }

  function mostrarAviso(texto, exito) {
    aviso.textContent = texto;
    aviso.style.display = 'block';
    aviso.style.background = exito ? '#e7f6ec' : '#fdecea';
    aviso.style.color = exito ? '#1e6b3a' : '#b42318';
    aviso.style.borderLeft = '4px solid ' + (exito ? '#2e9e5b' : '#b42318');
  }

  // Valida solo los campos que existen en el formulario
  function validar() {
    const f = form;
    const r = [
      marcar(f.nombres, f.nombres.value.trim() !== ''),
      marcar(f.usuario, f.usuario.value.trim() !== ''),
      marcar(f.correo, /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(f.correo.value.trim()),
        'Ingrese un correo válido.'),
      marcar(f.clave,
        f.clave.value.length >= 8 && /[A-Za-z]/.test(f.clave.value) && /\d/.test(f.clave.value),
        'La contraseña debe tener mínimo 8 caracteres, con letras y números.')
    ];
    return r.every(Boolean);
  }

  form.addEventListener('submit', function (e) {
    // Solo se bloquea el envío si hay errores; si todo está bien, viaja al servlet
    if (!validar()) {
      e.preventDefault();
      mostrarAviso('Revise los campos marcados.', false);
    }
  });
});