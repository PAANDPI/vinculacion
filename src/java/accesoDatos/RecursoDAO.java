package accesoDatos;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Recurso;
import jakarta.servlet.http.Part;

/**
 *
 * @author Arialdo
 */
public class RecursoDAO {

    private Recurso recurso;
    private List<Recurso> recursoList;

    private Conexion conex;
    private String json, relativePath, host, context;

    Part filePart;
    InputStream inputStream;
    File file;

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
            String carpeta = "recursosDiscapacidades/";
            relativePath += carpeta;
            File directorio = new File(relativePath);
            if (!directorio.exists()) {
                if (directorio.mkdirs()) {
                    System.out.println("Directorio creado");
                } else {
                    System.out.println("Error al crear directorio");
                }
            }
            String nombreArchivo = recurso.getRecurso() + System.currentTimeMillis();
            String tipoArchivo;
            int indx = filePart.getSubmittedFileName().lastIndexOf(".");
            System.out.println(filePart.getContentType());
            System.out.println(filePart.getSubmittedFileName());
            tipoArchivo = filePart.getSubmittedFileName().substring(indx);

            nombreArchivo += tipoArchivo;
            //directorio = new File(relativePath + filePart.getName());
            String pathArchivo = relativePath + nombreArchivo;
            //directorio = new File(pathArchivo);
            filePart.write(pathArchivo);
            /*File newFile = new File(pathArchivo);

            directorio.renameTo(newFile);

            /*try {
                FileOutputStream fileOutputStream = new FileOutputStream(pathArchivo);
                byte[] buffer = new byte[6124];
                int bulk;
                while (true) {
                    bulk = inputStream.read(buffer);
                    if (bulk < 0) {
                        break;
                    }
                    fileOutputStream.write(buffer, 0, bulk);
                    fileOutputStream.flush();
                }

            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

            /*System.out.println("Ruta: " + pathArchivo);
            FileOutputStream out = new FileOutputStream(pathArchivo);
            out.write(data);
            out.close();*/
            String rutaBD = host + "/files" + context + "/" + carpeta + nombreArchivo;
            recurso.setRuta(rutaBD);
            return true;
        } catch (IOException e) {
            conex.setMessage(e.getMessage());
        }

        return false;
    }

    public boolean renombrarArchivo() {
        try {
            String carpeta = "recursosDiscapacidades/";
            relativePath += carpeta;
            String nombreArchivo = recurso.getRecurso() + System.currentTimeMillis();
            String tipoArchivo;
            int indx = file.getName().lastIndexOf(".");
            tipoArchivo = file.getName().substring(indx);
            nombreArchivo += tipoArchivo;
            String pathArchivo = relativePath + nombreArchivo;
            File newFile = new File(pathArchivo);
            file.renameTo(newFile);
            String rutaBD = host + "/files" + context + "/" + carpeta + nombreArchivo;
            recurso.setRuta(rutaBD);
            return true;
        } catch (Exception e) {
            conex.setMessage(e.getMessage());
        }

        return false;
    }

    public boolean insert() {
        if (guardarArchivo()) {
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
        if (renombrarArchivo()) {
            String sql = String.format("SELECT editarrecurso(%d,%d, %d, '%s','%s','%s','%s','%b');",
                    recurso.getIdRecurso(), recurso.getIdCategoriaRecurso(), recurso.getIdDiscapacidad(),
                    recurso.getRecurso(), recurso.getDescripcion(), recurso.getEtiquetas(), recurso.getRuta(), recurso.isEstado());

            if (conex.isState()) {
                return conex.execute(sql);
            }
        }
        return false;
    }

    public boolean updateEnlace() {
        String sql = String.format("SELECT editarrecurso(%d,%d, %d, '%s','%s','%s','%s','%b');",
                recurso.getIdRecurso(), recurso.getIdCategoriaRecurso(), recurso.getIdDiscapacidad(),
                recurso.getRecurso(), recurso.getDescripcion(), recurso.getEtiquetas(),recurso.getRuta(), recurso.isEstado());
        System.out.print(sql);
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
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion").replaceAll("\n", "") + "\",\n";
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

    public String getVW2JSONFiltro(String recurso, int idCategoriaRecurso) {
        String json = "\"Recurso\" : [";
        String a = "\\";
        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwRecurso WHERE idcategoriarecurso=" + idCategoriaRecurso + " and recurso ILIKE '" + recurso + "%' ORDER by idrecurso desc;;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + result.getInt("idrecurso") + "\",\n";
                    json += "\t\t\t\"idcategoriarecurso\" : \"" + result.getInt("idcategoriarecurso") + "\",\n";
                    json += "\t\t\t\"categoriarecurso\" : \"" + result.getString("categoriarecurso") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"recurso\" : \"" + result.getString("recurso") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion").replaceAll("\n", "") + "\",\n";
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

    public String getVW2JSONNombre(String discapacidad) {
        String json = "\"Recurso\" : [";
        String a = "\\";
        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwRecurso WHERE unaccent(UPPER(discapacidad)) LIKE unaccent(UPPER('" + discapacidad + "%')) ORDER by idrecurso desc;;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + result.getInt("idrecurso") + "\",\n";
                    json += "\t\t\t\"idcategoriarecurso\" : \"" + result.getInt("idcategoriarecurso") + "\",\n";
                    json += "\t\t\t\"categoriarecurso\" : \"" + result.getString("categoriarecurso") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"recurso\" : \"" + result.getString("recurso") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion").replaceAll("\n", "") + "\",\n";
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

    public String getVW2JSORecurso(String recurso) {
        String json = "\"Recurso\" : [";
        String a = "\\";
        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwRecurso WHERE unaccent(UPPER(recurso)) LIKE unaccent(UPPER('" + recurso + "%')) ORDER by idrecurso desc;;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + result.getInt("idrecurso") + "\",\n";
                    json += "\t\t\t\"idcategoriarecurso\" : \"" + result.getInt("idcategoriarecurso") + "\",\n";
                    json += "\t\t\t\"categoriarecurso\" : \"" + result.getString("categoriarecurso") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"recurso\" : \"" + result.getString("recurso") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion").replaceAll("\n", "") + "\",\n";
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

    public String getVW2JSOCategoria(int idCategoria) {
        String json = "\"Recurso\" : [";
        String a = "\\";
        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery(" SELECT r.idrecurso, r.idcategoriarecurso, cr.categoriarecurso, r.iddiscapacidad, d.discapacidad, \n"
                        + " 	d.idcategoriadiscapacidad,\n"
                        + "    r.recurso, r.descripcion, r.etiquetas, r.estado, r.ruta\n"
                        + "   FROM recurso r\n"
                        + "     JOIN categoriarecurso cr ON r.idcategoriarecurso = cr.idcategoriarecurso\n"
                        + "     JOIN discapacidad d ON r.iddiscapacidad = d.iddiscapacidad WHERE d.idcategoriadiscapacidad='"+idCategoria+"';");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + result.getInt("idrecurso") + "\",\n";
                    json += "\t\t\t\"idcategoriarecurso\" : \"" + result.getInt("idcategoriarecurso") + "\",\n";
                    json += "\t\t\t\"categoriarecurso\" : \"" + result.getString("categoriarecurso") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                      json += "\t\t\t\"discapacidad\" : \"" + result.getString("idcategoriadiscapacidad") + "\",\n";
                    json += "\t\t\t\"recurso\" : \"" + result.getString("recurso") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion").replaceAll("\n", "") + "\",\n";
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
                ResultSet result = conex.returnQuery("SELECT * FROM vwRecurso ORDER by idrecurso desc;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + result.getInt("idrecurso") + "\",\n";
                    json += "\t\t\t\"idcategoriarecurso\" : \"" + result.getInt("idcategoriarecurso") + "\",\n";
                    json += "\t\t\t\"categoriarecurso\" : \"" + result.getString("categoriarecurso") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getInt("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"recurso\" : \"" + result.getString("recurso") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion").replaceAll("\n", "") + "\",\n";
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
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion").replaceAll("\n", "") + "\",\n";
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

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Part getFilePart() {
        return filePart;
    }

    public void setFilePart(Part filePart) {
        this.filePart = filePart;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

}
