package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Discapacidad;

/**
 *
 * @author Arialdo
 */
public class DiscapacidadDAO {

    private Discapacidad discapacidad;
    private List<Discapacidad> discapacidadList;

    private Conexion conex;
    private String json;
    public DiscapacidadDAO() {
        conex = new Conexion();
        discapacidad = new Discapacidad();
    }

    public DiscapacidadDAO(Discapacidad discapacidad) {
        conex = new Conexion();
        this.discapacidad = discapacidad;
    }

    public int insert() {
        String sql = String.format("SELECT insertarDiscapacidad('%s');",
                discapacidad.getDiscapacidad());
        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int update() {
        String sql = String.format("SELECT editarDiscapacidad(%d, %d, '%s');",
                discapacidad.getIdDiscapacidad(),discapacidad.getIdcategoriaDiscapacidad(), discapacidad.getDiscapacidad());
        
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public int habilitarDeshabilitar() {
        String sql = String.format("SELECT habilitarDeshabilitarDiscapacidad(%d);", 
                discapacidad.getIdDiscapacidad());
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return -1;
    }

    public int delete() {
        String sql = String.format("SELECT eliminarDiscapacidad(%d);", 
                discapacidad.getIdDiscapacidad());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public List<Discapacidad> selectAll() {
        discapacidadList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwDiscapacidad;");
                while (result.next()) {
                    discapacidadList.add(new Discapacidad(result.getInt(1),
                            result.getInt(1),result.getString(2)));
                }
                lista2JSON();
                result.close();
                conex.closeConnection();
                return discapacidadList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public void lista2JSON() {
        json = "\"Discapacidad\" : [";

        for (int i = 0; i < discapacidadList.size(); i++) {
            Discapacidad aux = discapacidadList.get(i);
            json += "\n\t\t{\n\t\t\"iddiscapacidad\" : \"" + aux.getIdDiscapacidad() + "\",\n";
            json += "\t\t\t\"idcategoriadiscapacidad\" : \"" + aux.getIdcategoriaDiscapacidad() + "\",\n";
            json += "\t\t\t\"discapacidad\" : \"" + aux.getDiscapacidad() + "\"\n\t\t},";
        }
        json = json.substring(0, (json.length() - 1));
        json += "]";
    }
     
    public String getDiscapacidadJSON() {
        String json = "\"Discapacidad\" : [";

        json += "\n\t\t{\n\t\t\"iddiscapacidad\" : \"" + discapacidad.getIdDiscapacidad()+ "\",\n";
        json += "\t\t\t\"idcategoriadiscapacidad\" : \"" + discapacidad.getIdcategoriaDiscapacidad() + "\",\n";
        json += "\t\t\t\"discapacidad\" : \"" + discapacidad.getDiscapacidad()+ "\"\n\t\t}\n";
        json += "]";
        return json;
    }
    
    public String getMessage() {
        return conex.getMessage();
    }

    public Discapacidad getDiscapacidad() {
        return discapacidad;
    }

    public void setDiscapacidad(Discapacidad discapacidad) {
        this.discapacidad = discapacidad;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

    public List<Discapacidad> getDiscapacidadList() {
        return discapacidadList;
    }

    public void setDiscapacidadList(List<Discapacidad> discapacidadList) {
        this.discapacidadList = discapacidadList;
    }

}
