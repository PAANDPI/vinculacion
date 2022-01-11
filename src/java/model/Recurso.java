/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Arialdo
 */
public class Recurso {

    private int idRecurso, idCategoriaRecurso, idDiscapacidad;
    private String recurso, descripcion, etiquetas;
    private boolean estado;

    public Recurso() {
    }

    public Recurso(int idRecurso, int idCategoriaRecurso, int idDiscapacidad, String recurso, String descripcion, String etiquetas, boolean estado) {
        this.idRecurso = idRecurso;
        this.idCategoriaRecurso = idCategoriaRecurso;
        this.idDiscapacidad = idDiscapacidad;
        this.recurso = recurso;
        this.descripcion = descripcion;
        this.etiquetas = etiquetas;
        this.estado = estado;
    }

    public int getIdRecurso() {
        return idRecurso;
    }

    public void setIdRecurso(int idRecurso) {
        this.idRecurso = idRecurso;
    }

    public int getIdCategoriaRecurso() {
        return idCategoriaRecurso;
    }

    public void setIdCategoriaRecurso(int idCategoriaRecurso) {
        this.idCategoriaRecurso = idCategoriaRecurso;
    }

    public int getIdDiscapacidad() {
        return idDiscapacidad;
    }

    public void setIdDiscapacidad(int idDiscapacidad) {
        this.idDiscapacidad = idDiscapacidad;
    }

    public String getRecurso() {
        return recurso;
    }

    public void setRecurso(String recurso) {
        this.recurso = recurso;
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

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
}
