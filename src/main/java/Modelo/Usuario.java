/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author atues
 */


public class Usuario {
    // declaracion de variables
    private int id;
    private String nombre;
    private String usuario;
    private String correo;
    private String clave;
    private int rol;

    // CREAMOS DOS CONSTRUCTORES: UNO VACIO Y UNO NORMAL
    public Usuario() {
    }

    public Usuario(int id, String nombre, String usuario, String correo, String clave, int rol) {
        this.id = id;
        this.nombre = nombre;
        this.usuario = usuario;
        this.correo = correo;
        this.clave = clave;
        this.rol = rol;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getUsuario() { return usuario; }
    public void setUsuario(String usuario) { this.usuario = usuario; }

    public String getCorreo() { return correo; }
    public void setCorreo(String correo) { this.correo = correo; }

    public String getClave() { return clave; }
    public void setClave(String clave) { this.clave = clave; }

    public int getRol() { return rol; }
    public void setRol(int rol) { this.rol = rol; }
}