/**
 *
 * @author Arialdo
 */
public class Ciudad {
    private int idCiudad, idProvincia;
    private String Ciudad;

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

}
