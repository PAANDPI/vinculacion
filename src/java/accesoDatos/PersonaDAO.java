package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Persona;
import org.apache.commons.codec.digest.DigestUtils;

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
        String sql = String.format("SELECT insertarpersona(%d, '%s', '%s', '%s', '%s', '%s', "
                + "'%s');", persona.getIdCiudad(), persona.getNombre(), persona.getApellido(),
                persona.getGenero(), persona.getUsuario(), persona.getCorreo(),
                persona.getClave(), persona.isAdministrador(), persona.isEstado());
        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int update() {
        String sql = String.format("SELECT insertarpersona(%d, '%s', '%s', '%s', '%s', '%s', "
                + "'%s');", persona.getIdCiudad(), persona.getNombre(), persona.getApellido(),
                persona.getGenero(), persona.getUsuario(), persona.getCorreo(),
                persona.getClave(), persona.isAdministrador(), persona.isEstado());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public int enableANDdisable() {
        String sql = String.format("SELECT habilitardeshabilitarpersona(%d);",
                persona.getIdPersona());
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return -1;
    }

    public int delete() {
        String sql = String.format("SELECT insertarpersona(%d, '%s', '%s', '%s', '%s', '%s', "
                + "'%s');", persona.getIdCiudad(), persona.getNombre(), persona.getApellido(),
                persona.getGenero(), persona.getUsuario(), persona.getCorreo(),
                persona.getClave(), persona.isAdministrador(), persona.isEstado());
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
                            result.getString(8),
                            result.getBoolean(9), result.getBoolean(10)));
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

    public boolean login() {
        try {
            if (conex.inyeccionSQL(persona.getUsuario(), persona.getClave())) {
                conex.setMessage("NO");
                return false;
            } else {
                String sql = "SELECT * \n"
                        + "FROM Persona\n"
                        + "WHERE (Username = '" + persona.getUsuario() + "' or mail = '" + persona.getUsuario() + "') and Estado";

                ResultSet result = conex.returnQuery(sql);
                if (result != null && result.next()) {

                    Persona personaBD = new Persona(result.getInt(1),
                            result.getInt(2), result.getString(3),
                            result.getString(4), result.getString(5),
                            result.getString(6), result.getString(7),
                            result.getString(8),
                            result.getBoolean(9), result.getBoolean(10));
                    if (persona.getUsuario().equalsIgnoreCase(personaBD.getCorreo()) || persona.getUsuario().equalsIgnoreCase(personaBD.getUsuario())) {
                        String pass = DigestUtils.sha1Hex(persona.getClave());
                        if (personaBD.getClave().equals(pass)) {
                            this.persona = personaBD;
                            return true;
                        } else {
                            conex.setMessage("Constraseña incorrecta");
                        }
                    } else {
                        conex.setMessage("Usuario incorrecto");
                    }
                    result.close();
                    result = null;
                } else {
                    conex.setMessage("No existe usuario");
                }
                conex.closeConnection();
            }
        } catch (SQLException ex) {
            conex.setMessage(ex.getMessage());
        }
        return false;
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
