package accesoDatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Arialdo
 */
public class Conexion {
    
    String consulta = "nada";
    private Connection conex;
    private java.sql.Statement st;
    private ResultSet result;
    private boolean state;
    private String message;

    private String url = "jdbc:postgresql://190.15.134.7:8080/vinculacion";
     private String usuario = "appdist";
    private String clave = "@Aplicaciones@Distribuidas@2021";
    /*private String usuario = "appdist";
    private String clave = "@Aplicaciones@Distribuidas@2021";*/
    private String classForName = "org.postgresql.Driver";

    public Conexion() {
        state = true;
    }

    public Conexion(String user, String pass, String url) {
        usuario = user;
        clave = pass;
        this.url = url;
        state = true;
    }

    public boolean openConnection() {
        try {
            if (conex == null || !(conex.isClosed())) {
                Class.forName(classForName);
                conex = DriverManager.getConnection(url, usuario, clave);
                st = conex.createStatement();
                state = true;
            }
        } catch (ClassNotFoundException | SQLException exSQL) {
            message = exSQL.getMessage();
            System.out.println(message);
            return false;
        }
        return true;
    }

    public void closeConnection() {
        try {
            if (conex != null && !conex.isClosed()) {
                conex.close();
                conex = null;
            }
            if (st != null && !st.isClosed()) {
                st.close();
                st = null;
            }
            if (result != null && !result.isClosed()) {
                result.close();
                result = null;
            }
        } catch (SQLException e) {
            message = e.getMessage();
            System.out.println("ERROR: " + message);
        }
    }

    public ResultSet returnQuery(String sql) {
        try {
            if (openConnection()) {
                result = st.executeQuery(sql);
            }
        } catch (SQLException exc) {
            System.out.println(sql);
            message = exc.getMessage();
            System.out.println(message);
            closeConnection();
        }
        return result;

    }
    
    public boolean execute(String sql) {
        boolean retorno = false;
        try {
            if (openConnection()) {
                retorno = st.execute(sql);
                message = "Correcto";
            }
        } catch (SQLException exc) {
            System.out.println(sql);
            message = exc.getMessage();
            System.out.println(message);
        } finally {
            closeConnection();
        }
        return retorno;
    }

    public int insert(String sql) {
        int retorno = -1;
        try {
            if (openConnection()) {
                retorno = st.executeUpdate(sql);
                message = "Succesfull";
            }
        } catch (SQLException exc) {
            System.out.println(sql);
            message = exc.getMessage();
            System.out.println(message);
        } finally {
            closeConnection();
        }
        return retorno;
    }

    public int insert(String tabla, String[] campos, String[] valores) {
        String fields = "", values = "";
        int retorno = -1;
        for (int i = 0; i < campos.length; i++) {
            fields += campos[i] + ", ";
            values += "'" + valores[i] + "', ";
        }
        fields = fields.substring(0, fields.length() - 2);
        values = values.substring(0, values.length() - 2);

        String sentencia = "INSERT INTO " + tabla + " (" + fields + ")\n"
                + "VALUES(" + values + ")";
        System.out.println(sentencia);
        try {
            if (openConnection()) {

                retorno = st.executeUpdate(sentencia);
                closeConnection();
                message = "Succesfull";
            }
        } catch (SQLException exc) {
            System.out.println(sentencia);
            message = exc.getMessage();
            System.out.println(message);

        } finally {
            closeConnection();
        }
        return retorno;
    }

    public int update(String tabla, String[] campos, String[] valores, String condicion) {
        String cadena = "";
        int retorno = -1;
        for (int i = 0; i < campos.length; i++) {
            cadena += campos[i] + " = '" + valores[i] + "', ";
        }
        cadena = cadena.substring(0, cadena.length() - 2);

        String sentencia = "UPDATE " + tabla + " \nSET " + cadena + "\nWHERE " + condicion;
        System.out.println(sentencia);
        try {
            if (openConnection()) {

                retorno = st.executeUpdate(sentencia);
                closeConnection();
                message = "Se modificó correctamente: ";
            }
        } catch (SQLException exc) {
            System.out.println(cadena);
            message = exc.getMessage();
            System.out.println(message);

        } finally {
            closeConnection();
        }
        return retorno;
    }

    public int update(String sql) {
        int retorno = -1;
        try {
            if (openConnection()) {
                retorno = st.executeUpdate(sql);
                closeConnection();
                message = "Succesfull";
            }
        } catch (SQLException exc) {
            System.out.println(sql);
            message = exc.getMessage();
            System.out.println(message);
        }
        return retorno;
    }

    public int delete(String sql) {
        int retorno = -1;
        try {
            if (openConnection()) {
                retorno = st.executeUpdate(sql);
                closeConnection();
                message = "Succesfull";
            }
        } catch (SQLException exc) {
            System.out.println(sql);
            message = exc.getMessage();
            System.out.println(message);
        } finally {
            closeConnection();
        }
        return retorno;
    }

    public String obtenerValor(String consulta, int indx) {
        String valor = "";
        try {
            if (openConnection()) {
                st = conex.createStatement();
                result = st.executeQuery(consulta);
                if (result.next()) {
                    valor = result.getString(indx);
                }
                closeConnection();
                message = "Succesfull";
            }
        } catch (SQLException exc) {
            System.out.println(consulta);
            message = exc.getMessage();
            System.out.println(message);

        } finally {
            closeConnection();
        }
        return valor;
    }

    public boolean existeRegistro(String consulta) {
        boolean valor = false;
        try {
            if (openConnection()) {
                st = conex.createStatement();
                result = st.executeQuery(consulta);
                valor = result.next();
            }
        } catch (SQLException exc) {
            System.out.println(consulta);
            message = exc.getMessage();
            System.out.println(message);

        } finally {
            closeConnection();
        }
        return valor;
    }

    public boolean inyeccionSQL(String user, String pass) {
        return user.contains("'") || pass.contains("'") || user.contains(" or ") || pass.contains(" or ") || user.contains(" and ") || pass.contains(" and ");
    }

    public ResultSet getResult() {
        return result;
    }

    public boolean isState() {
        return state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Connection getConexion() {
        return conex;
    }

    public ResultSet getLector() {
        return result;
    }

}
