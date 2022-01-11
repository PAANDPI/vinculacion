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
public class CategoriaDiscapacidad {

    private int idCategoriaDiscapacidad;
    private String categoriaDiscapacidad;

    public CategoriaDiscapacidad() {
    }

    public CategoriaDiscapacidad(int idCategoriaDiscapacidad, String categoriaDiscapacidad) {
        this.idCategoriaDiscapacidad = idCategoriaDiscapacidad;
        this.categoriaDiscapacidad = categoriaDiscapacidad;
    }

    public int getIdCategoriaDiscapacidad() {
        return idCategoriaDiscapacidad;
    }

    public void setIdCategoriaDiscapacidad(int idCategoriaDiscapacidad) {
        this.idCategoriaDiscapacidad = idCategoriaDiscapacidad;
    }

    public String getCategoriaDiscapacidad() {
        return categoriaDiscapacidad;
    }

    public void setCategoriaDiscapacidad(String categoriaDiscapacidad) {
        this.categoriaDiscapacidad = categoriaDiscapacidad;
    }
}
