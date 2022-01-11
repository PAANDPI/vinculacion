package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CategoriaRecurso;

/**
 *
 * @author Arialdo
 */
public class CategoriaRecursoDAO {

    private CategoriaRecurso categoriaRecurso;
    private List<CategoriaRecurso> categoriaRecursoList;

    private Conexion conex;

    public CategoriaRecursoDAO() {
        conex = new Conexion();
        categoriaRecurso = new CategoriaRecurso();
    }

    public CategoriaRecursoDAO(CategoriaRecurso categoriaRecurso) {
        conex = new Conexion();
        this.categoriaRecurso = categoriaRecurso;
    }

    public int insert() {
        String sql = String.format("SELECT insertarCategoriaRecurso('%s');",
                categoriaRecurso.getIdCategoriaRecurso());
        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int update() {
        String sql = String.format("SELECT editarCategoriaRecurso(%d, '%s');",
                categoriaRecurso.getIdCategoriaRecurso(), categoriaRecurso.getIdCategoriaRecurso());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public int habilitarDeshabilitar() {
        String sql = String.format("SELECT habilitarDeshabilitarCategoriaRecurso(%d);",
                categoriaRecurso.getIdCategoriaRecurso());
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return -1;
    }

    public int delete() {
        String sql = String.format("SELECT eliminarCategoriaRecurso(%d);",
                categoriaRecurso.getIdCategoriaRecurso());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public List<CategoriaRecurso> selectAll() {
        categoriaRecursoList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwCategoriaRecurso;");
                while (result.next()) {
                    categoriaRecursoList.add(new CategoriaRecurso(
                            result.getInt(1), result.getString(2)));
                }
                result.close();
                conex.closeConnection();
                return categoriaRecursoList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public String getMessage() {
        return conex.getMessage();
    }

    public CategoriaRecurso getCategoriaRecurso() {
        return categoriaRecurso;
    }

    public void setCategoriaRecurso(CategoriaRecurso categoriaRecurso) {
        this.categoriaRecurso = categoriaRecurso;
    }

}
