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
    private String json;

    public LugarDAO() {
        conex = new Conexion();
        lugar = new Lugar();
    }

    public LugarDAO(Lugar lugar) {
        conex = new Conexion();
        this.lugar = lugar;
    }

    public boolean insert() {
        //tutor.setIdTutor(Integer.parseInt(conex.getValue("SELECT COALESCE((MAX(idTutor)+1),1) FROM Tutor", 1)));
        String coordenadasX=lugar.getCoordenadaX()+"";
        String coordenadasY=lugar.getCoordenadaY()+"";
        String sql = String.format("SELECT insertarlugar (%d, '%s', '%s', %s, %s, '%s');",
                lugar.getIdCiudad(), lugar.getLugar(), lugar.getDescripcion(),coordenadasX.replace(",",".") ,
                coordenadasY.replace(",","."), lugar.getEtiqueta());

        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public boolean habilitarDeshabilitar() {
        String sql = String.format("SELECT habilitardeshabilitarlugares(%d);",
                lugar.getIdLugar());
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return false;
    }

    public boolean update() {
        String sql = String.format("SELECT editarDiscapacidad(%d, %d, '%s', '%s', %5.2f, %5.2f, '%s');",
                lugar.getIdLugar(), lugar.getIdCiudad(), lugar.getLugar(), lugar.getDescripcion(),
                lugar.getCoordenadaX(), lugar.getCoordenadaY(), lugar.getEtiqueta());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public boolean delete() {
        String sql = String.format("SELECT eliminarlugares(%d);",
                lugar.getIdLugar());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public List<Lugar> selectAll() {
        lugarList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwLugar;");
                //         public Lugar(int idLugar, int idCiudad, String lugar, String descripcion, String etiqueta, double coordenadaX, double coordenadaY, boolean estado) {

                while (result.next()) {
                    lugarList.add(new Lugar(result.getInt(1), result.getInt(2),
                            result.getString(3), result.getString(4),
                            result.getString(5), result.getDouble(6),
                            result.getDouble(7), result.getBoolean(8)));
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
                ResultSet result = conex.returnQuery("SELECT * FROM vwLugar;");
                while (result.next()) {
                    lugarList.add(new Lugar(result.getInt(1), result.getInt(2),
                            result.getString(3), result.getString(4),
                            result.getString(5), result.getDouble(6),
                            result.getDouble(7), result.getBoolean(8)));
                }
                lista2JSON();
                result.close();
                conex.closeConnection();
                return lugarList;
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
                ResultSet result = conex.returnQuery("SELECT * FROM vwLugar;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idlugar\" : \"" + result.getInt("idlugar") + "\",\n";
                    json += "\t\t\t\"ciudad\" : \"" + result.getString("ciudad") + "\",\n";
                    json += "\t\t\t\"provincia\" : \"" + result.getString("provincia") + "\",\n";
                    json += "\t\t\t\"pais\" : \"" + result.getString("pais") + "\",\n";
                    json += "\t\t\t\"lugar\" : \"" + result.getString("lugar") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion") + "\",\n";
                    json += "\t\t\t\"coordendax\" : \"" + result.getString("coordendax") + "\",\n";
                    json += "\t\t\t\"coordenday\" : \"" + result.getString("coordenday") + "\",\n";
                    json += "\t\t\t\"etiqueta\" : \"" + result.getString("etiqueta") + "\",\n";
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

    public void lista2JSON() {
        json = "\"Lugar\" : [";

        for (int i = 0; i < lugarList.size(); i++) {
            Lugar aux = lugarList.get(i);
            json += "\n\t\t{\n\t\t\"idlugar\" : \"" + aux.getIdLugar() + "\",\n";
            json += "\t\t\t\"idciudad\" : \"" + aux.getIdCiudad() + "\",\n";
            json += "\t\t\t\"lugar\" : \"" + aux.getLugar() + "\",\n";
            json += "\t\t\t\"descripcion\" : \"" + aux.getDescripcion() + "\",\n";
            json += "\t\t\t\"coordendax\" : \"" + aux.getCoordenadaX() + "\",\n";
            json += "\t\t\t\"coordenday\" : \"" + aux.getCoordenadaY() + "\",\n";
            json += "\t\t\t\"etiqueta\" : \"" + aux.getEtiqueta() + "\"\n\t\t},";
        }
        json = json.substring(0, (json.length() - 1));
        json += "]";
    }

    public String getLugarJSON() {
        String json = "\"Lugar\" : [";

        json += "\n\t\t{\n\t\t\"idlugar\" : \"" + lugar.getIdLugar() + "\",\n";
        json += "\t\t\t\"idciudad\" : \"" + lugar.getIdCiudad() + "\",\n";
        json += "\t\t\t\"lugar\" : \"" + lugar.getLugar() + "\",\n";
        json += "\t\t\t\"descripcion\" : \"" + lugar.getDescripcion() + "\",\n";
        json += "\t\t\t\"coordendax\" : \"" + lugar.getCoordenadaX() + "\",\n";
        json += "\t\t\t\"coordenday\" : \"" + lugar.getCoordenadaY() + "\",\n";
        json += "\t\t\t\"etiqueta\" : \"" + lugar.getEtiqueta() + "\"\n\t\t}\n";
        json += "]";
        return json;
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

    public List<Lugar> getLugarList() {
        return lugarList;
    }

    public void setLugarList(List<Lugar> lugarList) {
        this.lugarList = lugarList;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

}
