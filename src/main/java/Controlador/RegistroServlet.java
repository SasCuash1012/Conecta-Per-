package Controlador;

import Modelo.modeloUsuario;
import Modelo.usuarioDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletException;

@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dniStr = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        // Validar campos vacíos
        if (dniStr == null || dniStr.trim().isEmpty() ||
            nombre == null || nombre.trim().isEmpty() ||
            apellido == null || apellido.trim().isEmpty() ||
            correo == null || correo.trim().isEmpty() ||
            contrasena == null || contrasena.trim().isEmpty()) {

            request.setAttribute("error", "Todos los campos son obligatorios.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        int dni;
        try {
            dni = Integer.parseInt(dniStr.trim());
        } catch (NumberFormatException e) {
            request.setAttribute("error", "El DNI debe ser un número válido.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        modeloUsuario usuario = new modeloUsuario();
        usuario.setDni(dni);
        usuario.setNombre(nombre.trim());
        usuario.setApellido(apellido.trim());
        usuario.setCorreo(correo.trim());
        usuario.setContrasena(contrasena);

        usuarioDAO dao = new usuarioDAO();
        String resultado = dao.registrarUsuario(usuario);

        if (resultado.equals("OK")) {
            request.setAttribute("mensaje", "Registro exitoso.");
        } else if (resultado.equals("DUPLICADO")) {
            request.setAttribute("error", "DNI o correo ya están registrados.");
        } else {
            request.setAttribute("error", "Error al registrar.");
        }

        request.getRequestDispatcher("Register.jsp").forward(request, response);
    }
}
