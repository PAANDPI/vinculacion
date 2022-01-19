package model;
/**
 *
 * @author Arialdo
 */
public class Ciudad {
    private int idCiudad, idProvincia;
    private String Ciudad;
    private boolean estado;
    

    public Ciudad() {
    }

    public Ciudad(int idCiudad, int idProvincia, String Ciudad) {
        this.idCiudad = idCiudad;
        this.idProvincia = idProvincia;
        this.Ciudad = Ciudad;
     
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

    public int getIdProvincia() {
        return idProvincia;
    }

    public void setIdProvincia(int idProvincia) {
        this.idProvincia = idProvincia;
    }

    public String getCiudad() {
        return Ciudad;
    }

    public void setCiudad(String Ciudad) {
        this.Ciudad = Ciudad;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    

}
