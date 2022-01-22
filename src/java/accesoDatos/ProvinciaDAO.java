package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Provincia;

/**
 *
 * @author Arialdo
 */
public class ProvinciaDAO {

    private Provincia provincia;
    private List<Provincia> provinciaList;

    private Conexion conex;
    private String json;

    public ProvinciaDAO() {
        conex = new Conexion();
        provincia = new Provincia();
    }

    public ProvinciaDAO(Provincia provincia) {
        conex = new Conexion();
        this.provincia = provincia;
    }

    public boolean insert() {
        String sql = String.format("SELECT insertarprovincia(%d,'%s');",
                provincia.getIdPais(), provincia.getProvincia());
        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public boolean update() {
        String sql = String.format("SELECT insertarprovincia(%d, %d,'%s');",
                provincia.getIdProvincia(), provincia.getIdPais(), provincia.getProvincia());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public boolean delete() {
        String sql = String.format("SELECT eliminarprovincia(%d);",
                provincia.getIdProvincia());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public List<Provincia> selectAll() {
        provinciaList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwProvincia;");
                while (result.next()) {
                    provinciaList.add(new Provincia(result.getInt(1), result.getInt(2),
                            result.getString(3), result.getBoolean(4)));
                }
                lista2JSON();
                result.close();
                conex.closeConnection();
                return provinciaList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public String getVW2JSON() {
        String json = "\"Lugar\" : [";

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwProvincia;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idprovincia\" : \"" + result.getInt("idprovincia") + "\",\n";
                    json += "\t\t\t\"pais\" : \"" + result.getString("pais") + "\",\n";
                    json += "\t\t\t\"provincia\" : \"" + result.getString("provincia") + "\",\n";
                    json += "\t\t\t\"estado\" : \"" + result.getBoolean("estado") + "\"\n\t\t},";
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
        json = "\"Provincia\" : [";

        for (int i = 0; i < provinciaList.size(); i++) {
            Provincia aux = provinciaList.get(i);
            json += "\n\t\t{\n\t\t\"idprovincia\" : \"" + aux.getIdProvincia() + "\",\n";
            json += "\t\t\t\"idpais\" : \"" + aux.getIdPais() + "\",\n";
            json += "\t\t\t\"provincia\" : \"" + aux.getProvincia() + "\"\n\t\t},";
        }
        json = json.substring(0, (json.length() - 1));
        json += "]";
    }

    public String getProvinciaJSON() {
        String json = "\"Provincia\" : [";

        json += "\n\t\t{\n\t\t\"idprovincia\" : \"" + provincia.getIdProvincia() + "\",\n";
        json += "\t\t\t\"idpais\" : \"" + provincia.getIdPais() + "\",\n";
        json += "\t\t\t\"provincia\" : \"" + provincia.getProvincia() + "\"\n\t\t}\n";
        json += "]";
        return json;
    }

    public String getMessage() {
        return conex.getMessage();
    }

    public Provincia getProvincia() {
        return provincia;
    }

    public void setProvincia(Provincia provincia) {
        this.provincia = provincia;
    }

    public List<Provincia> getProvinciaList() {
        return provinciaList;
    }

    public void setProvinciaList(List<Provincia> provinciaList) {
        this.provinciaList = provinciaList;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }
}
