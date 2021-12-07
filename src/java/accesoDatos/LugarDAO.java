package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Lugar;

/**
 *
 * @author Arialdo
 */
public class LugarDAO {

    private Lugar lugar;
    private List<Lugar> lugarList;

    private Conexion conex;

    public LugarDAO() {
        conex = new Conexion();
        lugar = new Lugar();
    }

    public LugarDAO(Lugar lugar) {
        conex = new Conexion();
        this.lugar = lugar;
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

    public List<Lugar> selectAll() {
        lugarList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM public.table;");
                while (result.next()) {
                    lugarList.add(new Lugar(result.getInt(1), result.getInt(2),
                            result.getString(3), result.getString(4),
                            result.getString(5), result.getDouble(6), result.getDouble(7)));
                }
                result.close();
                conex.closeConnection();
                return lugarList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public List<Lugar> selectAll(int idCiudad) {
        lugarList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM public.table;");
                while (result.next()) {
                    lugarList.add(new Lugar(result.getInt(1), result.getInt(2),
                            result.getString(3), result.getString(4),
                            result.getString(5), result.getDouble(6), result.getDouble(7)));
                }
                result.close();
                conex.closeConnection();
                return lugarList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public String getMessage() {
        return conex.getMessage();
    }

    public Lugar getLugar() {
        return lugar;
    }

    public void setLugar(Lugar lugar) {
        this.lugar = lugar;
    }

}
