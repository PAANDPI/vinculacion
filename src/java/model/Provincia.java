package model;
/**
 *
 * @author Arialdo
 */
public class Provincia {
 
    private int idProvincia, idPais;
    private String Provincia;

    public Provincia() {
    }

    public Provincia(int idProvincia, int idPais, String Provincia) {
        this.idProvincia = idProvincia;
        this.idPais = idPais;
        this.Provincia = Provincia;
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
        return Provincia;
    }

    public void setProvincia(String Provincia) {
        this.Provincia = Provincia;
    }

}
