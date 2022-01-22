package model;

/**
 *
 * @author Arialdo
 */
public class Discapacidad {

    private int idDiscapacidad;
    private int idCategoriaDiscapacidad;
    private String discapacidad;

    public Discapacidad() {
    }

    public Discapacidad(int idDiscapacidad, int idCategoriaDiscapacidad, String discapacidad) {
        this.idDiscapacidad = idDiscapacidad;
        this.idCategoriaDiscapacidad = idCategoriaDiscapacidad;
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

    public int getIdCategoriaDiscapacidad() {
        return idCategoriaDiscapacidad;
    }

    public void setIdCategoriaDiscapacidad(int idCategoriaDiscapacidad) {
        this.idCategoriaDiscapacidad = idCategoriaDiscapacidad;
    }

}
