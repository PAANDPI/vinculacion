package model;
/**
 *
 * @author Arialdo
 */
public class Provincia {
 
    private int idProvincia, idPais;
    private String provincia;
    private boolean estado;

    public Provincia() {
    }

    public Provincia(int idProvincia, int idPais, String provincia, boolean estado) {
        this.idProvincia = idProvincia;
        this.idPais = idPais;
        this.provincia = provincia;
    }

    public int getIdProvincia() {
        return idProvincia;
    }

    public void setIdProvincia(int idProvincia) {
        this.idProvincia = idProvincia;
    }

    public int getIdPais() {
        return idPais;
    }

    public void setIdPais(int idPais) {
        this.idPais = idPais;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

}
