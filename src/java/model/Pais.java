package model;
/**
 *
 * @author Arialdo
 */
public class Pais {
 
    private int idPais;
    private String pais, codigo;
    private boolean estado;

    public Pais() {
    }

    public Pais(int idPais, String pais, String codigo, boolean estado) {
        this.idPais = idPais;
        this.pais = pais;
        this.codigo = codigo;
        this.estado = estado;
    }

    public int getIdPais() {
        return idPais;
    }

    public void setIdPais(int idPais) {
        this.idPais = idPais;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }


    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    
}
