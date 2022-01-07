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
public class Visita {
    
    private int idVisita;
    private String fecha, host;

    public Visita() {
    }

    public Visita(int idVisita, String fecha, String host) {
        this.idVisita = idVisita;
        this.fecha = fecha;
        this.host = host;
    }

    public int getIdVisita() {
        return idVisita;
    }

    public void setIdVisita(int idVisita) {
        this.idVisita = idVisita;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }
}
