package model;

/**
 *
 * @author Arialdo
 */
public class Discapacidad {
    private int idDiscapacidad;
    private String discapacidad;

    public Discapacidad() {
    }

    public Discapacidad(int idDiscapacidad, String discapacidad) {
        this.idDiscapacidad = idDiscapacidad;
        this.discapacidad = discapacidad;
    }

    public int getIdDiscapacidad() {
        return idDiscapacidad;
    }

    public void setIdDiscapacidad(int idDiscapacidad) {
        this.idDiscapacidad = idDiscapacidad;
    }

    public String getDiscapacidad() {
        return discapacidad;
    }

    public void setDiscapacidad(String discapacidad) {
        this.discapacidad = discapacidad;
    }

}