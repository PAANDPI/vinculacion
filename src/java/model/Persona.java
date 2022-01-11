package model;
/**
 *
 * @author Arialdo
 */
public class Persona {

    private int idPersona, idCiudad;
    private String nombre, apellido, genero, usuario, correo, clave;
    private boolean administrador, estado;

    public Persona() {
    }

    public Persona(int idPersona, int idCiudad, String nombre, String apellido, String genero, String usuario, String correo, String clave, boolean administrador, boolean estado) {
        this.idPersona = idPersona;
        this.idCiudad = idCiudad;
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.usuario = usuario;
        this.correo = correo;
        this.clave = clave;
        this.administrador = administrador;
        this.estado = estado;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public boolean isAdministrador() {
        return administrador;
    }

    public void setAdministrador(boolean administrador) {
        this.administrador = administrador;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

}
