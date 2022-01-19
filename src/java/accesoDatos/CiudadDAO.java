package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Ciudad;

/**
 *
 * @author Arialdo
 */
public class CiudadDAO {

    private Ciudad ciudad;
    private List<Ciudad> ciudadList;

    private Conexion conex;
    private String json;

    public CiudadDAO() {
        conex = new Conexion();
        ciudad = new Ciudad();
    }

    public CiudadDAO(Ciudad ciudad) {
        conex = new Conexion();
        this.ciudad = ciudad;
    }

    public int insert() {
        //tutor.setIdTutor(Integer.parseInt(conex.getValue("SELECT COALESCE((MAX(idTutor)+1),1) FROM Tutor", 1)));
        String sql = String.format("SELECT insertarCiudad(%d, %d, '%s');",
                ciudad.getIdCiudad(), ciudad.getIdProvincia(), ciudad.getCiudad());
        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int update() {
        String sql = String.format("SELECT editarCiudad(%d, %d, '%s');",
                ciudad.getIdCiudad(), ciudad.getIdProvincia(), ciudad.getCiudad());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public int habilitarDeshabilitar() {
        String sql = String.format("SELECT habilitarDeshabilitarCiudad(%d);",
                ciudad.getIdCiudad());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int delete() {
        String sql = String.format("SELECT eliminarCiudad(%d);",
                ciudad.getIdCiudad());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public List<Ciudad> selectAll() {
        ciudadList = new ArrayList<>();
        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwCiudad;");
                while (result.next()) {
                    ciudadList.add(new Ciudad(result.getInt(1), result.getInt(2),
                            result.getString(3)));
                }
                lista2JSON();
                result.close();
                conex.closeConnection();
                return ciudadList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public List<Ciudad> selectAll(int idProvincia) {
        ciudadList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM public.table;");
                while (result.next()) {
                    ciudadList.add(new Ciudad(result.getInt(1), result.getInt(2),
                            result.getString(3)));
                }
                result.close();
                conex.closeConnection();
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public String getVW2JSON() {
        String json = "\"Ciudad\" : [";

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwCiudad;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idciudad\" : \"" + result.getInt("idciudad") + "\",\n";
                    json += "\t\t\t\"idprovincia\" : \"" + result.getInt("idprovincia") + "\",\n";
                    json += "\t\t\t\"ciudad\" : \"" + result.getInt("ciudad") + "\",\n";
                    json += "\t\t\t\"estado\" : \"" + result.getInt("estado") + "\",\n";
                    json += "\t\t\t\"provincia\" : \"" + result.getInt("provincia") + "\"\n\t\t},";
                }
                json = json.substring(0, (json.length() - 1));//eliminamos la ultima coma
                result.close();
                conex.closeConnection();
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        json += "]";
        return json;
    }

    public void lista2JSON() {
        json = "\"Ciudad\" : [";

        for (int i = 0; i < ciudadList.size(); i++) {
            Ciudad aux = ciudadList.get(i);
            json += "\n\t\t{\n\t\t\"idciudad\" : \"" + aux.getIdCiudad() + "\",\n";
            json += "\t\t\t\"idprovincia\" : \"" + aux.getIdProvincia() + "\",\n";
            json += "\t\t\t\"ciudad\" : \"" + aux.getCiudad() + "\"\n\t\t},";
        }
        json = json.substring(0, (json.length() - 1));
        json += "]";
    }

    public String getCiudadJSON() {
        String json = "\"Ciudad\" : [";

        json += "\n\t\t{\n\t\t\"idciudad\" : \"" + ciudad.getIdCiudad() + "\",\n";
        json += "\t\t\t\"idprovincia\" : \"" + ciudad.getIdProvincia() + "\",\n";
        json += "\t\t\t\"ciudad\" : \"" + ciudad.getCiudad() + "\"\n\t\t}\n";
        json += "]";
        return json;
    }

    public String getMessage() {
        return conex.getMessage();
    }

    public Ciudad getCiudad() {
        return ciudad;
    }

    public void setCiudad(Ciudad ciudad) {
        this.ciudad = ciudad;
    }

    public List<Ciudad> getCiudadList() {
        return ciudadList;
    }

    public void setCiudadList(List<Ciudad> ciudadList) {
        this.ciudadList = ciudadList;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

}
