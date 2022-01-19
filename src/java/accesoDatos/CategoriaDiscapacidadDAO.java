package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CategoriaDiscapacidad;

/**
 *
 * @author Arialdo
 */
public class CategoriaDiscapacidadDAO {

    private CategoriaDiscapacidad categoriaDiscapacidad;
    private List<CategoriaDiscapacidad> categoriaDiscapacidadList;

    private Conexion conex;

    private String json;

    public CategoriaDiscapacidadDAO() {
        conex = new Conexion();
        categoriaDiscapacidad = new CategoriaDiscapacidad();
    }

    public CategoriaDiscapacidadDAO(CategoriaDiscapacidad categoriaDiscapacidad) {
        conex = new Conexion();
        this.categoriaDiscapacidad = categoriaDiscapacidad;
    }

    public int insert() {
        //tutor.setIdTutor(Integer.parseInt(conex.getValue("SELECT COALESCE((MAX(idTutor)+1),1) FROM Tutor", 1)));
        String sql = "SELECT editarcategoriadiscapacidad();";

        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int update() {
        String sql = String.format("SELECT insertarCategoriaDiscapacidad('%s');",
                categoriaDiscapacidad.getCategoriaDiscapacidad());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public int habilitarDeshabilitar() {
        String sql = String.format("SELECT editarcategoriadiscapacidad(%d);",
                categoriaDiscapacidad.getIdCategoriaDiscapacidad());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int delete() {
        String sql = String.format("SELECT eliminarCategoriaDiscapacidad(%d);",
                categoriaDiscapacidad.getIdCategoriaDiscapacidad());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public List<CategoriaDiscapacidad> selectAll() {
        categoriaDiscapacidadList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwCategoriaDiscapacidad;");
                while (result.next()) {
                    categoriaDiscapacidadList.add(new CategoriaDiscapacidad(
                            result.getInt(1), result.getString(2)));
                }
                lista2JSON();
                result.close();
                conex.closeConnection();
                return categoriaDiscapacidadList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public String getVW2JSON() {
        String json = "\"CategoriaDiscapacidad\" : [";

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwCategoriaDiscapacidad;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idcategoriadiscapacidad\" : \"" + result.getInt("idcategoriadiscapacidad") + "\",\n";
                    json += "\t\t\t\"categoriadiscapacidad\" : \"" + result.getInt("categoriadiscapacidad") + "\"\n\t\t},";
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

    /**
     * Crea y retorna una cadena en forma de una estructura JSON
     *
     */
    public void lista2JSON() {
        json = "\"CategoriaDiscapacidad\" : [";

        for (int i = 0; i < categoriaDiscapacidadList.size(); i++) {
            CategoriaDiscapacidad aux = categoriaDiscapacidadList.get(i);
            json += "\n\t\t{\n\t\t\"idcategoriadiscapacidad\" : \"" + aux.getIdCategoriaDiscapacidad() + "\",\n";
            json += "\t\t\t\"categoriadiscapacidad\" : \"" + aux.getCategoriaDiscapacidad() + "\"\n\t\t},";
        }
        json = json.substring(0, (json.length() - 1));//eliminamos la ultima coma
        json += "]";
    }

    /**
     * Crea y retorna una cadena en forma de una estructura JSON
     *
     * @return Devuelve un String de una estructura JSON
     */
    public String getCategoriaDiscapacidadJSON() {
        String json = "\"CategoriaDiscapacidad\" : [";

        json += "\n\t\t{\n\t\t\"idcategoriadiscapacidad\" : \"" + categoriaDiscapacidad.getIdCategoriaDiscapacidad() + "\",\n";
        json += "\t\t\t\"categoriadiscapacidad\" : \"" + categoriaDiscapacidad.getCategoriaDiscapacidad() + "\"\n\t\t}\n";
        json += "]";
        return json;
    }

    public String getMessage() {
        return conex.getMessage();
    }

    public CategoriaDiscapacidad getCategoriaDiscapacidad() {
        return categoriaDiscapacidad;
    }

    public void setCategoriaDiscapacidad(CategoriaDiscapacidad categoriaDiscapacidad) {
        this.categoriaDiscapacidad = categoriaDiscapacidad;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

}
