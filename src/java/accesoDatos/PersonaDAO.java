package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Persona;

/**
 *
 * @author Arialdo
 */
public class PersonaDAO {

    private Persona persona;
    private List<Persona> personaList;

    private Conexion conex;

    public PersonaDAO() {
        conex = new Conexion();
        persona = new Persona();
    }

    public PersonaDAO(Persona persona) {
        conex = new Conexion();
        this.persona = persona;
    }

    public int insert() {
        //tutor.setIdTutor(Integer.parseInt(conex.getValue("SELECT COALESCE((MAX(idTutor)+1),1) FROM Tutor", 1)));
        String sql = "SELECT insertarpersona(%d, '%s', '%s', '%s', '%s', '%s', "
                + "'%s');";

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

    public List<Persona> selectAll() {
        personaList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM public.table;");
                while (result.next()) {
                    personaList.add(new Persona(result.getInt(1),
                            result.getInt(2), result.getString(3),
                            result.getString(4), result.getString(5),
                            result.getString(6), result.getString(7),
                            result.getString(8), result.getString(9),
                            result.getString(10), result.getBoolean(12)));
                }
                result.close();
                conex.closeConnection();
                return personaList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public String getMessage() {
        return conex.getMessage();
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

}
