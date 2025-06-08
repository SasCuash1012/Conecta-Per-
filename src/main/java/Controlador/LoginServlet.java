package Controlador;

import Modelo.modeloUsuario;
import Modelo.usuarioDAO;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        usuarioDAO dao = new usuarioDAO();
        modeloUsuario usuario = dao.validarLogin(correo, contrasena);

        if (usuario != null) {
            // Guardar en sesión
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            response.sendRedirect("inicio.jsp");
        } else {
            request.setAttribute("error", "Correo o contraseña incorrectos");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}
