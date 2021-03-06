package controlador;

import accesoDatos.LugarDAO;
import java.io.IOException;
import java.io.PrintWriter;
import model.Lugar;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//import javax.servlet.annotation.WebServlet;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Dell i5
 */
@WebServlet(
    name = "LugarSrv", 
    urlPatterns = {"/LugarSrv"}
)
public class LugarSrv extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LugarSrv</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LugarSrv at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LugarDAO lugarDao = new LugarDAO();
        response.setContentType("text/json;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";

            retorno += "\"codigo\":200,\n";
            retorno += lugarDao.getVW2JSON();
            retorno += "\n}";
            out.write(retorno);

        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        response.setContentType("text/json;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion.equals("1")) {
            String IdCiudad = request.getParameter("IdCiudad");
            String Lugar = request.getParameter("Lugar");
            String Descripcion = request.getParameter("Descripcion");
            String CoordenadaX = request.getParameter("CoordenadaX");
            String CoordenadaY = request.getParameter("CoordenadaY");
            String etiquetas = request.getParameter("Etiquete");
            String Estado = request.getParameter("Estado");
            Lugar lugar = new Lugar();
            lugar.setIdCiudad(Integer.parseInt(IdCiudad));
            lugar.setLugar(Lugar);
            lugar.setDescripcion(Descripcion);
            lugar.setCoordenadaX(Double.parseDouble(CoordenadaX));
            lugar.setCoordenadaY(Double.parseDouble(CoordenadaY));
            lugar.setEtiqueta(etiquetas);
            LugarDAO lugarDao = new LugarDAO(lugar);
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (lugarDao.insert()) {
                    retorno += "\"codigo\":200\n";
                    retorno += lugarDao.getLugarJSON();
                    response.setStatus(response.SC_OK);
                    //response.sendRedirect("index.jsp");
                } else {
                    retorno += "\"codigo\":400,\n";
                    retorno += "\"mensaje\": \"" + lugarDao.getMessage() + "\"\n";
                    response.setStatus(response.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        } else if (accion.equals("2")) {
            String IdLugar = request.getParameter("idlugar");
            Lugar lugar = new Lugar();
            lugar.setIdLugar(Integer.parseInt(IdLugar));
            LugarDAO lugarD = new LugarDAO(lugar);
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                if (lugarD.delete()) {
                    retorno += "\"codigo\":200,\n";
                    retorno += "\"mensaje\": \"" + lugarD.getMessage() + "\"\n";
                    response.setStatus(response.SC_OK);
                } else {
                    retorno += "\"codigo\":400,\n";
                    retorno += "\"mensaje\": \"" + lugarD.getMessage() + "\"\n";
                    response.setStatus(response.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        } else if (accion.equals("3")) {
            String IdUbicacion =request.getParameter("idUbicacion");
            String IdCiudad = request.getParameter("IdCiudad");
            String Nonmbrelugar = request.getParameter("Lugar");
            String Descripcion = request.getParameter("Descripcion");
            String CoordenadaX = request.getParameter("CoordenadaX");
            String CoordenadaY = request.getParameter("CoordenadaY");
            String etiquetas = request.getParameter("Etiquete");
            String Estado = request.getParameter("Estado");
            Lugar lugar = new Lugar();
            lugar.setIdLugar(Integer.parseInt(IdUbicacion));
            lugar.setIdCiudad(Integer.parseInt(IdCiudad));
            lugar.setLugar(Nonmbrelugar);
            lugar.setDescripcion(Descripcion);
            lugar.setCoordenadaX(Double.parseDouble(CoordenadaX));
            lugar.setCoordenadaY(Double.parseDouble(CoordenadaY));
            lugar.setEtiqueta(etiquetas);
            LugarDAO lugarDao = new LugarDAO(lugar);
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                if (lugarDao.update()) {
                    retorno += "\"codigo\":200\n";
                } else {
                    retorno += "\"codigo\":400,\n";
                    retorno += "\"mensaje\": \"" + lugarDao.getMessage() + "\"\n";
                    response.setStatus(response.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}