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
public class CategoriaRecurso {

    private int idCategoriaRecurso;
    private String categoriaRecurso;

    public CategoriaRecurso() {
    }

    public CategoriaRecurso(int idCategoriaRecurso, String categoriaRecurso) {
        this.idCategoriaRecurso = idCategoriaRecurso;
        this.categoriaRecurso = categoriaRecurso;
    }

    public int getIdCategoriaRecurso() {
        return idCategoriaRecurso;
    }

    public void setIdCategoriaRecurso(int idCategoriaRecurso) {
        this.idCategoriaRecurso = idCategoriaRecurso;
    }

    public String getCategoriaRecurso() {
        return categoriaRecurso;
    }

    public void setCategoriaRecurso(String categoriaRecurso) {
        this.categoriaRecurso = categoriaRecurso;
    }
}
