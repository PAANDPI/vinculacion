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
    private String json, relativePath;

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
            relativePath = relativePath.replace("yuyapuy\\", "files/yuyapuy/");
            //data:image/png;base64,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
            String nombreArchivo = "recursosDiscapacidades/" + recurso.getRecurso() + tipoArchivo;
            File directorio = new File(relativePath+"/recursosDiscapacidades/");
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
            String rutaBD = "http://fyc.uteq.edu.ec:8080/files/yuyapuy/" + nombreArchivo;
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
}
