package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Recurso;

/**
 *
 * @author Arialdo
 */
public class RecursoDAO {

    private Recurso recurso;
    private List<Recurso> recursoList;

    private Conexion conex;
    private String json; 
    public RecursoDAO() {
        conex = new Conexion();
        recurso = new Recurso();
    }

    public RecursoDAO(Recurso recurso) {
        conex = new Conexion();
        this.recurso = recurso;
    }

    public int insert() {
        //tutor.setIdTutor(Integer.parseInt(conex.getValue("SELECT COALESCE((MAX(idTutor)+1),1) FROM Tutor", 1)));
        String sql = String.format("SELECT insertarrecurso(%d, %d, '%s','%s','%s');",
                recurso.getIdCategoriaRecurso(),recurso.getIdDiscapacidad(),
                recurso.getRecurso(),recurso.getDescripcion(),recurso.getEtiquetas());

        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int update() {
         String sql = String.format("SELECT editarrecurso(%d,%d, %d, '%s','%s','%s');",
                recurso.getIdRecurso(),recurso.getIdCategoriaRecurso(),recurso.getIdDiscapacidad(),
                recurso.getRecurso(),recurso.getDescripcion(),recurso.getEtiquetas());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

     public int habilitarDeshabilitar() {
        String sql = String.format("SELECT habilitardeshabilitarrecurso(%d);", 
                recurso.getIdRecurso());
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return -1;
    }
     
    public int delete() {
        String sql = String.format("SELECT eliminarrecurso(%d);", 
                 recurso.getIdRecurso());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public List<Recurso> selectAll() {
        recursoList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM public.table;");
                while (result.next()) {
                    recursoList.add(new Recurso(result.getInt(1), result.getInt(2), result.getInt(3),
                            result.getString(4),result.getString(5),result.getString(6), result.getBoolean(7)));
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
    
    public String getVW2JSON() {
        String json = "\"Recurso\" : [";

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwLugar;");
                while (result.next()) {
                    json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + result.getInt("idrecurso") + "\",\n";
                    json += "\t\t\t\"idcategoriarecurso\" : \"" + result.getString("idcategoriarecurso") + "\",\n";
                    json += "\t\t\t\"categoriarecurso\" : \"" + result.getString("categoriarecurso") + "\",\n";
                    json += "\t\t\t\"iddiscapacidad\" : \"" + result.getString("iddiscapacidad") + "\",\n";
                    json += "\t\t\t\"discapacidad\" : \"" + result.getString("discapacidad") + "\",\n";
                    json += "\t\t\t\"recurso\" : \"" + result.getString("recurso") + "\",\n";
                    json += "\t\t\t\"descripcion\" : \"" + result.getString("descripcion") + "\",\n";
                    json += "\t\t\t\"etiquetas\" : \"" + result.getString("etiquetas") + "\",\n";
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
        json = "\"Recurso\" : [";

        for (int i = 0; i < recursoList.size(); i++) {
            Recurso aux = recursoList.get(i);
            json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + aux.getIdRecurso() + "\",\n";
            json += "\t\t\t\"idcategoriarecurso\" : \"" + aux.getIdCategoriaRecurso() + "\",\n";
            json += "\t\t\t\"iddiscapacidad\" : \"" + aux.getIdDiscapacidad() + "\",\n";
            json += "\t\t\t\"recurso\" : \"" + aux.getRecurso() + "\",\n";
            json += "\t\t\t\"descripcion\" : \"" + aux.getDescripcion() + "\",\n";
            json += "\t\t\t\"etiquetas\" : \"" + aux.getEtiquetas() + "\"\n\t\t},";
        }
        json = json.substring(0, (json.length() - 1));
        json += "]";
    }
     
    public String getRecursoJSON() {
        String json = "\"Recurso\" : [";

        json += "\n\t\t{\n\t\t\"idrecurso\" : \"" + recurso.getIdRecurso()+ "\",\n";
        json += "\t\t\t\"idcategoriarecurso\" : \"" +recurso.getIdCategoriaRecurso() + "\",\n";
        json += "\t\t\t\"iddiscapacidad\" : \"" + recurso.getIdDiscapacidad() + "\",\n";
        json += "\t\t\t\"recurso\" : \"" + recurso.getRecurso() + "\",\n";
        json += "\t\t\t\"descripcion\" : \"" + recurso.getDescripcion() + "\",\n";
        json += "\t\t\t\"etiquetas\" : \"" + recurso.getEtiquetas()+ "\"\n\t\t}\n";
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



}
