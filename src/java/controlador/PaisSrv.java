/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import accesoDatos.PaisDAO;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Pais;

/**
 *
 * @author dayanna
 */
@WebServlet(
    name = "PaisSrv", 
    urlPatterns = {"/PaisSrv"}
)
public class PaisSrv extends HttpServlet {

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
            out.println("<title>Servlet PaisSrv</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaisSrv at " + request.getContextPath() + "</h1>");
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

        PaisDAO paisDAO = new PaisDAO();
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            retorno += "\"codigo\":200,\n";
            retorno += paisDAO.getVW2JSON();
            retorno += "\n}";
            out.write(retorno);
            //processRequest(request, response);
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
        Pais pais = new Pais();
        pais.setIdPais(Integer.parseInt(request.getParameter("idpais")));
        pais.setPais(request.getParameter("pais"));
        pais.setCodigo(request.getParameter("codigo"));
        pais.setEstado(Boolean.parseBoolean(request.getParameter("estado")));

        PaisDAO paisDAO = new PaisDAO(pais);
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (paisDAO.update()) {
                retorno += "\"codigo\":200,\n";
                retorno += paisDAO.getPaisJSON();
                response.setStatus(response.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + paisDAO.getMessage() + "\"\n";
                response.setStatus(response.SC_BAD_REQUEST);

            }
            retorno += "}";
            out.write(retorno);

            //processRequest(request, response);
        }
    }

    /**
     * Handles the HTTP <code>PUT</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pais pais = new Pais();
        pais.setPais(request.getParameter("pais"));
        pais.setCodigo(request.getParameter("codigo"));

        PaisDAO paisDAO = new PaisDAO(pais);
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (paisDAO.insert()) {
                retorno += "\"codigo\":200,\n";
                retorno += paisDAO.getPaisJSON();
                response.setStatus(response.SC_OK);
                //response.sendRedirect("index.jsp");
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + paisDAO.getMessage() + "\"\n";
                response.setStatus(response.SC_BAD_REQUEST);
            }
            retorno += "}";
            out.write(retorno);
        }
    }

    /**
     * Handles the HTTP <code>DELETE</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pais pais = new Pais();
        pais.setIdPais(Integer.parseInt(request.getParameter("idpais")));

        PaisDAO paisDAO = new PaisDAO(pais);
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (paisDAO.habilitarDeshabilitar()) {
                retorno += "\"codigo\":200\n";
                response.setStatus(response.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + paisDAO.getMessage() + "\"\n";
                response.setStatus(response.SC_BAD_REQUEST);
            }
            retorno += "}";
            out.write(retorno);
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
