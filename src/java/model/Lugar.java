package model;

/**
 *
 * @author Arialdo
 */
public class Lugar {

    private int idLugar, idCiudad;
    private String lugar, descripcion, etiqueta;
    private double coordenadaX, coordenadaY;
    private boolean estado;

    public Lugar() {
    }

    public Lugar(int idLugar, int idCiudad, String lugar, String descripcion, String etiqueta, double coordenadaX, double coordenadaY, boolean estado) {
        this.idLugar = idLugar;
        this.idCiudad = idCiudad;
        this.lugar = lugar;
        this.descripcion = descripcion;
        this.etiqueta = etiqueta;
        this.coordenadaX = coordenadaX;
        this.coordenadaY = coordenadaY;
        this.estado = estado;
    }

    public int getIdLugar() {
        return idLugar;
    }

    public void setIdLugar(int idLugar) {
        this.idLugar = idLugar;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public double getCoordenadaX() {
        return coordenadaX;
    }

    public void setCoordenadaX(double coordenadaX) {
        this.coordenadaX = coordenadaX;
    }

    public double getCoordenadaY() {
        return coordenadaY;
    }

    public void setCoordenadaY(double coordenadaY) {
        this.coordenadaY = coordenadaY;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

}