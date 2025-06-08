
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.modeloUsuario"%>
<%@page session="true"%>
<%
    modeloUsuario usuario = (modeloUsuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>
<link rel="stylesheet" href="css/styleMenu.css"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel de Usuario</title>
</head>
<body>
    <div class="sidebar">
        <div class="user-info">
            <h3>Bienvenido</h3>
            <p><%= usuario.getApellido() %>, <%= usuario.getNombre() %></p>
        </div>

        <div class="menu">

            <div class="menu-section">
                <input type="checkbox" id="encuestasToggle">
                <label for="encuestasToggle">📋 Encuestas</label>
                <div class="submenu">
                    <li><a href="index.jsp" target="contenidoFrame">Crear encuesta</a></li>
                    <a href="verEncuestas.jsp">Ver encuestas</a>
                </div>
            </div>

            <div class="menu-section">
                <input type="checkbox" id="resultadosToggle">
                <label for="resultadosToggle">📊 Resultados</label>
                <div class="submenu">
                    <a href="resumenResultados.jsp">Resumen</a>
                    <a href="detalleResultados.jsp">Detalle</a>
                </div>
            </div>

            <div class="menu-section logout">
                <a href="CerrarSesionServlet">🔒 Cerrar sesión</a>
            </div>
        </div>
    </div>

  <div class="main-content">
  <iframe name="contenidoFrame" id="contenidoFrame" src="about.html" frameborder="0" style="width: 100%; height: 100vh;"></iframe>
</div>
</body>
</html>
