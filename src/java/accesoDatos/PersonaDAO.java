package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import model.Persona;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author Arialdo
 */
public class PersonaDAO {

    private Persona persona;
    private List<Persona> personaList;

    private String json;
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

        persona.setClave(DigestUtils.sha1Hex(persona.getClave()));

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
        String sql = String.format("SELECT editarpersona(%d, '%s', '%s', '%s', '%s', '%s', "
                + "'%s');", persona.getIdCiudad(), persona.getNombre(), persona.getApellido(),
                persona.getGenero(), persona.getUsuario(), persona.getCorreo(),
                persona.getClave(), persona.isAdministrador(), persona.isEstado());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public int habilitarDeshabilitar() {
        String sql = String.format("SELECT habilitardeshabilitarpersona(%d);",
                persona.getIdPersona());
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return -1;
    }

    public int delete() {
        String sql = String.format("SELECT eliminarpersona(%d, '%s', '%s', '%s', '%s', '%s', "
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
                ResultSet result = conex.returnQuery("SELECT * FROM vwPersona;");
                while (result.next()) {
                    personaList.add(new Persona(result.getInt(1),
                            result.getInt(2), result.getString(3),
                            result.getString(4), result.getString(5),
                            result.getString(6), result.getString(7),
                            result.getString(8),
                            result.getBoolean(9), result.getBoolean(10)));
                }
                lista2JSON();
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
                String sql = String.format("SELECT * \n"
                        + "FROM vwPersona\n"
                        + "WHERE (Usuario ILIKE '%s' or Correo ILIKE '%s') "
                        + "AND Estado", persona.getUsuario(), persona.getUsuario());

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

    /**
     * Crea y retorna una cadena en forma de una estructura JSON
     *
     */
    public void lista2JSON() {
        json = "\"Persona\" : [";

        for (int i = 0; i < personaList.size(); i++) {
            Persona aux = personaList.get(i);
            json += "\n\t\t{\n\t\t\"idpersona\" : \"" + aux.getIdPersona() + "\",\n";
            json += "\t\t\t\"idciudad\" : \"" + aux.getIdCiudad() + "\",\n";
            json += "\t\t\t\"nombre\" : \"" + aux.getNombre() + "\",\n";
            json += "\t\t\t\"apellido\" : \"" + aux.getApellido() + "\",\n";
            json += "\t\t\t\"genero\" : \"" + aux.getGenero() + "\",\n";
            json += "\t\t\t\"usuario\" : \"" + aux.getUsuario() + "\",\n";
            json += "\t\t\t\"correo\" : \"" + aux.getCorreo() + "\",\n";
            json += "\t\t\t\"clave\" : \"" + aux.getClave() + "\",\n";
            json += "\t\t\t\"administrador\" : \"" + aux.isAdministrador() + "\",\n";
            json += "\t\t\t\"estado\" : \"" + aux.isEstado() + "\"\n\t\t},";
        }
        json = json.substring(0, (json.length() - 1));//eliminamos la ultima coma
        json += "]";
    }

    /**
     * Crea y retorna una cadena en forma de una estructura JSON
     *
     * @return Devuelve un String de una estructura JSON
     */
    public String getPersonaJSON() {
        String json = "\"Persona\" : [";

        json += "\n\t\t{\n\t\t\"idpersona\" : \"" + persona.getIdPersona() + "\",\n";
        json += "\t\t\t\"idciudad\" : \"" + persona.getIdCiudad() + "\",\n";
        json += "\t\t\t\"nombre\" : \"" + persona.getNombre() + "\",\n";
        json += "\t\t\t\"apellido\" : \"" + persona.getApellido() + "\",\n";
        json += "\t\t\t\"genero\" : \"" + persona.getGenero() + "\",\n";
        json += "\t\t\t\"usuario\" : \"" + persona.getUsuario() + "\",\n";
        json += "\t\t\t\"correo\" : \"" + persona.getCorreo() + "\",\n";
        json += "\t\t\t\"clave\" : \"" + persona.getClave() + "\",\n";
        json += "\t\t\t\"administrador\" : \"" + persona.isAdministrador() + "\",\n";
        json += "\t\t\t\"estado\" : \"" + persona.isEstado() + "\"\n\t\t}\n";
        json += "]";
        return json;
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

    public List<Persona> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<Persona> personaList) {
        this.personaList = personaList;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

}
