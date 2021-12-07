package model;

/**
 *
 * @author Arialdo
 */
public class Concepto {
    private int idConcepto, idDiscapacidad;
    private String descripcion, etiquetas;

    public Concepto() {
    }

    public Concepto(int idConcepto, int idDiscapacidad, String descripcion, 
            String etiquetas) {
        this.idConcepto = idConcepto;
        this.idDiscapacidad = idDiscapacidad;
        this.descripcion = descripcion;
        this.etiquetas = etiquetas;
    }

    public int getIdConcepto() {
        return idConcepto;
    }

    public void setIdConcepto(int idConcepto) {
        this.idConcepto = idConcepto;
    }

    public int getIdDiscapacidad() {
        return idDiscapacidad;
    }

    public void setIdDiscapacidad(int idDiscapacidad) {
        this.idDiscapacidad = idDiscapacidad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEtiquetas() {
        return etiquetas;
    }

    public void setEtiquetas(String etiquetas) {
        this.etiquetas = etiquetas;
    }
}
