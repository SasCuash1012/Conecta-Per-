package Modelo;

import Conexion.Conexion;
import java.sql.*;

public class usuarioDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();

    // Método para registrar un nuevo usuario
    public String registrarUsuario(modeloUsuario u) {
        String sql = "INSERT INTO usuario (dni, nombre, apellido, correo, contrasena) VALUES (?, ?, ?, ?, ?)";
        try {
            con = cn.Conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, u.getDni());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getApellido());
            ps.setString(4, u.getCorreo());
            ps.setString(5, u.getContrasena());
            ps.executeUpdate();
            return "OK";
        } catch (SQLException e) {
            if (e.getMessage().contains("Duplicate entry")) {
                return "DUPLICADO";
            } else {
                System.out.println("Error general: " + e.getMessage());
                return "ERROR";
            }
        }
    }
    
    public modeloUsuario validarLogin(String correo, String contrasena) {
    modeloUsuario usuario = null;
    String sql = "SELECT * FROM usuario WHERE correo=? AND contrasena=?";
    try {
        con = cn.Conectar();
        ps = con.prepareStatement(sql);
        ps.setString(1, correo);
        ps.setString(2, contrasena);
        rs = ps.executeQuery();
        if (rs.next()) {
            usuario = new modeloUsuario();
            usuario.setIdUsuario(rs.getInt("idUsuario"));
            usuario.setDni(rs.getInt("dni"));
            usuario.setNombre(rs.getString("nombre"));
            usuario.setApellido(rs.getString("apellido"));
            usuario.setCorreo(rs.getString("correo"));
            usuario.setContrasena(rs.getString("contasena"));
        }
    } catch (Exception e) {
        System.out.println("Error al validar login: " + e.getMessage());
    }
    return usuario;
}

}
