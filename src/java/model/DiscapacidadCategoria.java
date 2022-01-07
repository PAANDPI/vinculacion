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
public class DiscapacidadCategoria {
    private int idDiscapacidadCategoria;
    private String categoria, concepto;

    public DiscapacidadCategoria() {
    }

    public DiscapacidadCategoria(int idDiscapacidadCategoria, String categoria, String concepto) {
        this.idDiscapacidadCategoria = idDiscapacidadCategoria;
        this.categoria = categoria;
        this.concepto = concepto;
    }

    public int getIdDiscapacidadCategoria() {
        return idDiscapacidadCategoria;
    }

    public void setIdDiscapacidadCategoria(int idDiscapacidadCategoria) {
        this.idDiscapacidadCategoria = idDiscapacidadCategoria;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getConcepto() {
        return concepto;
    }

    public void setConcepto(String concepto) {
        this.concepto = concepto;
    }
    
}
