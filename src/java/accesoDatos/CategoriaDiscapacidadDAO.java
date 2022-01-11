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

    public int enableDisable() {
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
                result.close();
                conex.closeConnection();
                return categoriaDiscapacidadList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public List<CategoriaDiscapacidad> selectAll(int idProvincia) {
        categoriaDiscapacidadList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwCategoriaDiscapacidad;");
                while (result.next()) {
                    categoriaDiscapacidadList.add(new CategoriaDiscapacidad(
                            result.getInt(1), result.getString(2)));
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

    public CategoriaDiscapacidad getCategoriaDiscapacidad() {
        return categoriaDiscapacidad;
    }

    public void setCategoriaDiscapacidad(CategoriaDiscapacidad categoriaDiscapacidad) {
        this.categoriaDiscapacidad = categoriaDiscapacidad;
    }

}
