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

    public DiscapacidadDAO() {
        conex = new Conexion();
        discapacidad = new Discapacidad();
    }

    public DiscapacidadDAO(Discapacidad discapacidad) {
        conex = new Conexion();
        this.discapacidad = discapacidad;
    }

    public int insert() {
        //tutor.setIdTutor(Integer.parseInt(conex.getValue("SELECT COALESCE((MAX(idTutor)+1),1) FROM Tutor", 1)));
        String sql = "SELECT ();";

        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int update() {
        String sql = "SELECT ();";
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public int disableDevice() {
        String sql = "SELECT ();";
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int enableANDdisableDevice() {
        String sql = "SELECT ();";
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return -1;
    }

    public int delete() {
        String sql = "SELECT ();";
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public List<Discapacidad> selectAll() {
        discapacidadList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM public.table;");
                while (result.next()) {
                    discapacidadList.add(new Discapacidad(result.getInt(1),
                            result.getString(2)));
                }
                result.close();
                conex.closeConnection();
                return discapacidadList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
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

}
