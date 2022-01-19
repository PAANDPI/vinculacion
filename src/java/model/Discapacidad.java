package model;

/**
 *
 * @author Arialdo
 */
public class Discapacidad {
    private int idDiscapacidad;
    private int idcategoriaDiscapacidad;
    private String discapacidad;

    public Discapacidad() {
    }

    public Discapacidad(int idDiscapacidad,int idcategoriaDiscapacidad, String discapacidad) {
        this.idDiscapacidad = idDiscapacidad;
        this.idcategoriaDiscapacidad=idcategoriaDiscapacidad;
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

    public int getIdcategoriaDiscapacidad() {
        return idcategoriaDiscapacidad;
    }

    public void setIdcategoriaDiscapacidad(int idcategoriaDiscapacidad) {
        this.idcategoriaDiscapacidad = idcategoriaDiscapacidad;
    }

}
