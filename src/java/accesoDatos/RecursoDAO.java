package accesoDatos;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.DatatypeConverter;
import model.Recurso;

/**
 *
 * @author Arialdo
 */
public class RecursoDAO {

    private Recurso recurso;
    private List<Recurso> recursoList;

    private Conexion conex;
    private String json, relativePath, host;

    public RecursoDAO() {
        conex = new Conexion();
        recurso = new Recurso();
    }

    public RecursoDAO(Recurso recurso) {
        conex = new Conexion();
        this.recurso = recurso;
    }

    public boolean guardarArchivo() {
        try {
            //relativePath;
            String tipoArchivo, base64, dato = recurso.getRuta();

            int indx1 = dato.indexOf("/") + 1;
            int indx2 = dato.indexOf(";");

            tipoArchivo = "." + dato.substring(indx1, indx2);

            indx1 = dato.indexOf(",") + 1;
            base64 = dato.substring(indx1);
            indx1 = relativePath.indexOf("yuyapuy");
            relativePath = relativePath.substring(0, indx1);
            relativePath += "files\\yuyapuy\\";
            String nombreArchivo = "recursosDiscapacidades/" + recurso.getRecurso() + tipoArchivo;
            File directorio = new File(relativePath + "/recursosDiscapacidades/");
            if (!directorio.exists()) {
                if (directorio.mkdirs()) {
                    System.out.println("Directorio creado");
                } else {
                    System.out.println("Error al crear directorio");
                }
            }
            String pathArchivo = relativePath + nombreArchivo;
            System.out.println("Ruta: " + pathArchivo);
            byte[] dataBytes = DatatypeConverter.parseBase64Binary(base64);
            FileOutputStream out = new FileOutputStream(pathArchivo);
            out.write(dataBytes);
            out.close();
            String rutaBD = host + "/files/yuyapuy/" + nombreArchivo;
            recurso.setRuta(rutaBD);
            return true;
        } catch (IOException e) {
            conex.setMessage(e.getMessage());
        }
        return false;
    }

    public boolean insert() {
        if (guardarArchivo()) {
            //tutor.setIdTutor(Integer.parseInt(conex.getValue("SELECT COALESCE((MAX(idTutor)+1),1) FROM Tutor", 1)));
            String sql = String.format("SELECT insertarrecurso(%d, %d, '%s','%s','%s','%s','%b');",
                    recurso.getIdCategoriaRecurso(), recurso.getIdDiscapacidad(),
                    recurso.getRecurso(), recurso.getDescripcion(), recurso.getEtiquetas(), recurso.getRuta(), Boolean.TRUE);
            System.out.println("archivo" + sql);
            if (conex.isState()) {
                return conex.execute(sql);
            }
        }
        return false;
    }

    public boolean insertEnlace() {

        //tutor.setIdTutor(Integer.parseInt(conex.getValue("SELECT COALESCE((MAX(idTutor)+1),1) FROM Tutor", 1)));
        String sql = String.format("SELECT insertarrecurso(%d, %d, '%s','%s','%s','%s','%s');",
                recurso.getIdCategoriaRecurso(), recurso.getIdDiscapacidad(),
                recurso.getRecurso(), recurso.getDescripcion(), recurso.getEtiquetas(), recurso.getRuta(), Boolean.FALSE);
        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }

        return false;
    }

    public boolean update() {
        if (guardarArchivo()) {
            String sql = String.format("SELECT editarrecurso(%d,%d, %d, '%s','%s','%s','%s');",
                    recurso.getIdRecurso(), recurso.getIdCategoriaRecurso(), recurso.getIdDiscapacidad(),
                    recurso.getRecurso(), recurso.getDescripcion(), recurso.getEtiquetas(), recurso.isEstado());

            if (conex.isState()) {
                return conex.execute(sql);
            }
        }
        return false;
    }

    public boolean updateEnlace() {
        String sql = String.format("SELECT editarrecurso(%d,%d, %d, '%s','%s','%s','%s');",
                recurso.getIdRecurso(), recurso.getIdCategoriaRecurso(), recurso.getIdDiscapacidad(),
                recurso.getRecurso(), recurso.getDescripcion(), recurso.getEtiquetas(), recurso.isEstado());

        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public boolean habilitarDeshabilitar() {
        String sql = String.format("SELECT habilitardeshabilitarrecurso(%d);",
                recurso.getIdRecurso());
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return false;
    }

    public boolean delete() {
        String sql = String.format("SELECT eliminarrecurso(%d);",
                recurso.getIdRecurso());
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return false;
    }

    public List<Recurso> selectAll() {
        recursoList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwRecurso ");
                while (result.next()) {
                    recursoList.add(new Recurso(result.getInt(1), result.getInt(2),
                            result.getInt(3), result.getString(4), result.getString(5),
                            result.getString(6), result.getBoolean(7), result.getString(8)));
                }
                lista2JSON();
                result.close();
                conex.closeConnection();
                return recursoList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public String getVW2JSON(int idCategoriaRecurso, String discapacidad) {
        String json = "\"Recurso\" : [";
        String a = "\\";
        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwRecurso WHERE idcategoriarecurso=" + idCategoriaRecurso + " and discapacidad ILIKE '" + discapacidad + "%' ORDER by idrecurso desc;;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + result.getInt("idrecurso") + "\",\n";
                    json += "\t\t\t\"idcategoriarecurso\" : \"" + result.getInt("idcategoriarecurso") + "\",\n";
                    json += "\t\t\t\"categoriarecurso\" : \"" + result.getString("categoriarecurso") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"recurso\" : \"" + result.getString("recurso") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion") + "\",\n";
                    json += "\t\t\t\"etiquetas\" : \"" + result.getString("etiquetas") + "\",\n";
                    json += "\t\t\t\"estado\" : \"" + result.getBoolean("estado") + "\",\n";
                    json += "\t\t\t\"ruta\" : \"" + result.getString("ruta").replace(a, "/").replace("//", "/") + "\"\n\t\t},";
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

    public String getVW2JSON() {
        String json = "\"Recurso\" : [";
        String a = "\\";
        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwRecurso ORDER by idrecurso desc;;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + result.getInt("idrecurso") + "\",\n";
                    json += "\t\t\t\"idcategoriarecurso\" : \"" + result.getInt("idcategoriarecurso") + "\",\n";
                    json += "\t\t\t\"categoriarecurso\" : \"" + result.getString("categoriarecurso") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"recurso\" : \"" + result.getString("recurso") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion") + "\",\n";
                    json += "\t\t\t\"etiquetas\" : \"" + result.getString("etiquetas") + "\",\n";
                    json += "\t\t\t\"estado\" : \"" + result.getBoolean("estado") + "\",\n";
                    json += "\t\t\t\"ruta\" : \"" + result.getString("ruta").replace(a, "/").replace("//", "/") + "\"\n\t\t},";
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

    public String getVW2JSONENLACES() {
        String json = "\"Recurso\" : [";
        String a = "\\";
        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwRecurso WHERE estado=false ORDER by idrecurso desc");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + result.getInt("idrecurso") + "\",\n";
                    json += "\t\t\t\"idcategoriarecurso\" : \"" + result.getInt("idcategoriarecurso") + "\",\n";
                    json += "\t\t\t\"categoriarecurso\" : \"" + result.getString("categoriarecurso") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"recurso\" : \"" + result.getString("recurso") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion") + "\",\n";
                    json += "\t\t\t\"etiquetas\" : \"" + result.getString("etiquetas") + "\",\n";
                    json += "\t\t\t\"estado\" : \"" + result.getBoolean("estado") + "\",\n";
                    json += "\t\t\t\"ruta\" : \"" + result.getString("ruta").replace(a, "/").replace("//", "/") + "\"\n\t\t},";
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
        json = "\"Recurso\" : [";

        for (int i = 0; i < recursoList.size(); i++) {
            Recurso aux = recursoList.get(i);
            json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + aux.getIdRecurso() + "\",\n";
            json += "\t\t\t\"idcategoriarecurso\" : \"" + aux.getIdCategoriaRecurso() + "\",\n";
            json += "\t\t\t\"iddiscapacidad\" : \"" + aux.getIdDiscapacidad() + "\",\n";
            json += "\t\t\t\"recurso\" : \"" + aux.getRecurso() + "\",\n";
            json += "\t\t\t\"descripcion\" : \"" + aux.getDescripcion() + "\",\n";
            json += "\t\t\t\"etiquetas\" : \"" + aux.getEtiquetas() + "\",\n";
            json += "\t\t\t\"estado\" : \"" + aux.isEstado() + "\",\n";
            json += "\t\t\t\"ruta\" : \"" + aux.getRuta() + "\"\n\t\t},";
        }
        json = json.substring(0, (json.length() - 1));
        json += "]";
    }

    public String getRecursoJSON() {
        String json = "\"Recurso\" : [";

        json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + recurso.getIdRecurso() + "\",\n";
        json += "\t\t\t\"idcategoriarecurso\" : \"" + recurso.getIdCategoriaRecurso() + "\",\n";
        json += "\t\t\t\"iddiscapacidad\" : \"" + recurso.getIdDiscapacidad() + "\",\n";
        json += "\t\t\t\"recurso\" : \"" + recurso.getRecurso() + "\",\n";
        json += "\t\t\t\"descripcion\" : \"" + recurso.getDescripcion() + "\",\n";
        json += "\t\t\t\"etiquetas\" : \"" + recurso.getEtiquetas() + "\",\n";
        json += "\t\t\t\"estado\" : \"" + recurso.isEstado() + "\",\n";
        json += "\t\t\t\"ruta\" : \"" + recurso.getRuta() + "\"\n\t\t}\n";
        json += "]";
        return json;
    }

    public String getMessage() {
        return conex.getMessage();
    }

    public Recurso getRecurso() {
        return recurso;
    }

    public void setRecurso(Recurso recurso) {
        this.recurso = recurso;
    }

    public List<Recurso> getRecursoList() {
        return recursoList;
    }

    public void setRecursoList(List<Recurso> recursoList) {
        this.recursoList = recursoList;
    }

    public String getJson() {
        return json;
    }

    public void setJson(String json) {
        this.json = json;
    }

    public String getRelativePath() {
        return relativePath;
    }

    public void setRelativePath(String relativePath) {
        this.relativePath = relativePath;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

}
