/**
 *
 * @author Arialdo
 */
public class Persona {

    private int idPersona, idCiudad;
    private String nombre, apellido, fechaNacimiento, telefono, genero, usuario;
    private String correo, clave;
    private boolean administradorY;

    public Persona() {
    }

    public Persona(int idPersona, int idCiudad, String nombre, String apellido, String fechaNacimiento, String telefono, String genero, String usuario, String correo, String clave, boolean administradorY) {
        this.idPersona = idPersona;
        this.idCiudad = idCiudad;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.telefono = telefono;
        this.genero = genero;
        this.usuario = usuario;
        this.correo = correo;
        this.clave = clave;
        this.administradorY = administradorY;
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

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
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

    public boolean isAdministradorY() {
        return administradorY;
    }

    public void setAdministradorY(boolean administradorY) {
        this.administradorY = administradorY;
    }
}
