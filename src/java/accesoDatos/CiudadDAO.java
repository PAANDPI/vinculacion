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
                ciudad.getIdProvincia(), ciudad.getCiudad());
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

    public String getMessage() {
        return conex.getMessage();
    }

    public Ciudad getCiudad() {
        return ciudad;
    }

    public void setCiudad(Ciudad ciudad) {
        this.ciudad = ciudad;
    }

}
