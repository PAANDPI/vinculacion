package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Pais;

/**
 *
 * @author Arialdo
 */
public class PaisDAO {

    private Pais pais;
    private List<Pais> paisList;

    private Conexion conex;

    public PaisDAO() {
        conex = new Conexion();
        pais = new Pais();
    }

    public PaisDAO(Pais pais) {
        conex = new Conexion();
        this.pais = pais;
    }

    public boolean insert() {
        //tutor.setIdTutor(Integer.parseInt(conex.getValue("SELECT COALESCE((MAX(idTutor)+1),1) FROM Tutor", 1)));
        String sql = String.format("SELECT insertarPais('%s', '%s');", 
                pais.getPais(), pais.getCodigo());

        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public boolean update() {
        String sql = String.format("SELECT editarPais(%d, '%s', '%s', '%b');", 
                pais.getIdPais(), pais.getPais(), pais.getCodigo(), pais.isEstado());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }


    public boolean habilitarDeshabilitar() {
        String sql = String.format("SELECT habilitardeshabilitarpais(%d);", 
                pais.getIdPais());
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return false;
    }

    public boolean delete() {
        String sql = String.format("SELECT eliminarpais(%d);", 
                pais.getIdPais());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public List<Pais> selectAll() {
        paisList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwPais;");
                while (result.next()) {
                    paisList.add(new Pais(result.getInt(1), result.getString(2),
                            result.getString(3), result.getBoolean(4)));
                }
                result.close();
                conex.closeConnection();
                return paisList;
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
                ResultSet result = conex.returnQuery("SELECT * FROM vwPais;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idpais\" : \"" + result.getInt("idpais") + "\",\n";
                    json += "\t\t\t\"pais\" : \"" + result.getString("pais") + "\",\n";
                    json += "\t\t\t\"codigo\" : \"" + result.getString("codigo") + "\",\n";
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
    
    public String getPaisJSON() {
        String json = "\"Pais\" : [";

        json += "\n\t\t{\n\t\t\"idpais\" : \"" + pais.getIdPais() + "\",\n";
        json += "\t\t\t\"pais\" : \"" + pais.getPais() + "\",\n";
        json += "\t\t\t\"codigo\" : \"" + pais.getCodigo() + "\",\n";
        json += "\t\t\t\"estado\" : \"" + pais.isEstado() + "\"\n\t\t}\n";
        json += "]";
        return json;
    }
    
    public String getMessage() {
        return conex.getMessage();
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    

}
