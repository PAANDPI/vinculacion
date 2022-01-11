package accesoDatos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Concepto;

/**
 *
 * @author Arialdo
 */
public class ConceptoDAO {

    private Concepto concepto;
    private List<Concepto> conceptoList;

    private Conexion conex;

    public ConceptoDAO() {
        conex = new Conexion();
        concepto = new Concepto();
    }

    public ConceptoDAO(Concepto concepto) {
        conex = new Conexion();
        this.concepto = concepto;
    }

    public int insert() {
        String sql = String.format("SELECT insertarConcepto(%d, '%s', '%s');",
                concepto.getIdDiscapacidad(), concepto.getDescripcion(), 
                concepto.getEtiquetas());
        System.out.println(sql);
        if (conex.isState()) {
            return conex.execute(sql);
        }
        return -1;
    }

    public int update() {
        String sql = String.format("SELECT editarConcepto(%d, %d, '%s', '%s');", 
                concepto.getIdConcepto(), concepto.getIdDiscapacidad(),
                concepto.getDescripcion(), concepto.getEtiquetas());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public int habilitarDeshabilitar() {
        String sql = String.format("SELECT habilitarDeshabilitarConcepto(%d);", 
                concepto.getIdConcepto());
        if (conex.isState()) {
            System.out.println(sql);
            return conex.execute(sql);
        }
        return -1;
    }

    public int delete() {
        String sql = String.format("SELECT eliminarConcepto(%d);", 
                concepto.getIdConcepto());
        if (conex.isState()) {
            return conex.update(sql);
        }
        return -1;
    }

    public List<Concepto> selectAll() {
        conceptoList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwConcepto;");
                while (result.next()) {
                    conceptoList.add(new Concepto(result.getInt(1), result.getInt(2), result.getString(3), result.getString(4)));
                }
                result.close();
                conex.closeConnection();
                return conceptoList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public List<Concepto> selectAll(int idPatient) {
        conceptoList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM vwConcepto;");
                while (result.next()) {
                    conceptoList.add(new Concepto(result.getInt(1), result.getInt(2), result.getString(3), result.getString(4)));
                }
                result.close();
                conex.closeConnection();
                return conceptoList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public List<Concepto> selectAllByTutor(int idTutor) {
        conceptoList = new ArrayList<>();

        if (conex.isState()) {
            try {
                ResultSet result = conex.returnQuery("SELECT * FROM public.table;");
                while (result.next()) {
                    conceptoList.add(new Concepto(result.getInt(1), result.getInt(2), result.getString(3), result.getString(4)));
                }
                result.close();
                conex.closeConnection();
                return conceptoList;
            } catch (SQLException ex) {
                conex.setMessage(ex.getMessage());
            }
        }
        return null;
    }

    public String getMessage() {
        return conex.getMessage();
    }

    public Concepto getConcepto() {
        return concepto;
    }

    public void setConcepto(Concepto concepto) {
        this.concepto = concepto;
    }

}
