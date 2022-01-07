package model;
/**
 *
 * @author Arialdo
 */
public class Pais {
 
    private int idPais;
    private String Provincia, codigo;
    private boolean estado;

    public Pais() {
    }

    public Pais(int idPais, String Provincia, String codigo, boolean estado) {
        this.idPais = idPais;
        this.Provincia = Provincia;
        this.codigo = codigo;
        this.estado = estado;
    }

    public int getIdPais() {
        return idPais;
    }

    public void setIdPais(int idPais) {
        this.idPais = idPais;
    }

    public String getProvincia() {
        return Provincia;
    }

    public void setProvincia(String Provincia) {
        this.Provincia = Provincia;
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
