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

    public ProvinciaDAO() {
        conex = new Conexion();
        provincia = new Provincia();
    }

    public ProvinciaDAO(Provincia provincia) {
        conex = new Conexion();
        this.provincia = provincia;
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

    public int enableANDdisable() {
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

    public List<Provincia> selectAll() {
        provinciaList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM public.table;");
                while (result.next()) {
                    provinciaList.add(new Provincia(result.getInt(1), result.getInt(2), result.getString(3)));
                }
                result.close();
                conex.closeConnection();
                return provinciaList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
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

}
