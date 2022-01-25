package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Concepto;

/**
 *
 * @author Arialdo
 */
public class ConceptoDAO {

    private Concepto concepto;
    private List<Concepto> conceptoList;

    private Conexion conex;
    private String json;

    public ConceptoDAO() {
        conex = new Conexion();
        concepto = new Concepto();
    }

    public ConceptoDAO(Concepto concepto) {
        conex = new Conexion();
        this.concepto = concepto;
    }

    public boolean insert() {
        String sql = String.format("SELECT insertarConcepto(%d, '%s', '%s');",
                concepto.getIdDiscapacidad(), concepto.getDescripcion(),
                concepto.getEtiquetas());
        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);

        }
        return false;
    }

    public boolean update() {
        String sql = String.format("SELECT editarConcepto(%d, %d, '%s', '%s');",
                concepto.getIdConcepto(), concepto.getIdDiscapacidad(),
                concepto.getDescripcion(), concepto.getEtiquetas());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public boolean habilitarDeshabilitar() {
        String sql = String.format("SELECT habilitarDeshabilitarConcepto(%d);",
                concepto.getIdConcepto());
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return false;
    }

    public boolean delete() {
        String sql = String.format("SELECT eliminarConcepto(%d);",
                concepto.getIdConcepto());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public List<Concepto> selectAll() {
        conceptoList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwConcepto;");
                while (result.next()) {
                    conceptoList.add(new Concepto(result.getInt(1), result.getInt(2), result.getString(3), result.getString(4)));
                }
                lista2JSON();
                result.close();
                conex.closeConnection();
                return conceptoList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public String getVW2JSON() {
        String json = "\"Concepto\" : [";

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwConcepto;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idconcepto\" : \"" + result.getInt("idconcepto") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion").replace("\"", "\\\"") + "\",\n";
                    json += "\t\t\t\"etiquetas\" : \"" + result.getString("etiquetas") + "\"\n\t\t},";
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

    public String getVW2JSON(int idDiscapacidad) {
        String json = "\"Concepto\" : [";
        String rem="\\\"";    
        if (conex.isState()) {
            try {
                String sql = String.format("SELECT * FROM vwConcepto\n"
                        + "WHERE idDiscapacidad = %d;",
                        idDiscapacidad);

                ResultSet result = conex.returnQuery(sql);
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idconcepto\" : \"" + result.getInt("idconcepto") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion").replace("\"", "\\\"") + "\",\n";
                    json += "\t\t\t\"etiquetas\" : \"" + result.getString("etiquetas") + "\"\n\t\t},";
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

    public String getVW2JSON(String discapacidad) {
        String json = "\"Concepto\" : [";

        if (conex.isState()) {
            try {
                 String sql = String.format("SELECT * FROM vwConcepto\n"
                        + "WHERE Discapacidad ILIKE '%s%%';",
                        discapacidad);
                ResultSet result = conex.returnQuery(sql);
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idconcepto\" : \"" + result.getInt("idconcepto") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion").replace("\"", "\\\"") + "\",\n";
                    json += "\t\t\t\"etiquetas\" : \"" + result.getString("etiquetas") + "\"\n\t\t},";
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
        json = "\"Concepto\" : [";

        for (int i = 0; i < conceptoList.size(); i++) {
            Concepto aux = conceptoList.get(i);
            json += "\n\t\t{\n\t\t\"idconcepto\" : \"" + aux.getIdConcepto() + "\",\n";
            json += "\t\t\t\"iddiscapacidad\" : \"" + aux.getIdDiscapacidad() + "\",\n";
            json += "\t\t\t\"descripcion\" : \"" + aux.getDescripcion() + "\",\n";
            json += "\t\t\t\"etiquetas\" : \"" + aux.getEtiquetas() + "\"\n\t\t},";
        }
        json = json.substring(0, (json.length() - 1));
        json += "]";
    }

    public String getConceptoJSON() {
        String json = "\"Concepto\" : [";

        json += "\n\t\t{\n\t\t\"idconcepto\" : \"" + concepto.getIdConcepto() + "\",\n";
        json += "\t\t\t\"iddiscapacidad\" : \"" + concepto.getIdDiscapacidad() + "\",\n";
        json += "\t\t\t\"descripcion\" : \"" + concepto.getDescripcion() + "\",\n";
        json += "\t\t\t\"etiquetas\" : \"" + concepto.getEtiquetas() + "\"\n\t\t}\n";
        json += "]";
        return json;
    }

    public String getMessage() {
        return conex.getMessage();
    }

    public Concepto getConcepto() {
        return concepto;
    }

    public void setConcepto(Concepto concepto) {
        this.concepto = concepto;
    }

    public List<Concepto> getConceptoList() {
        return conceptoList;
    }

    public void setConceptoList(List<Concepto> conceptoList) {
        this.conceptoList = conceptoList;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }
}
