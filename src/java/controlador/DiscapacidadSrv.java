/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.DiscapacidadDAO;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Discapacidad;

/**
 *
 * @author User
 */
@WebServlet(
    name = "ConceptoSrv", 
    urlPatterns = {"/ConceptoSrv"}
)
public class DiscapacidadSrv extends HttpServlet {

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
            out.println("<title>Servlet DiscapacidadSrv</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DiscapacidadSrv at " + request.getContextPath() + "</h1>");
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
        
        response.setContentType("text/html;charset=UTF-8");
        Discapacidad discapacidad = new Discapacidad();
        DiscapacidadDAO discapacidadDAO = new DiscapacidadDAO(discapacidad);
        try (PrintWriter out = response.getWriter())
            {
                String retorno = "{\n\t";                
                retorno += "\"codigo\":200,\n";
                retorno += discapacidadDAO.getVW2JSON();
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
        int accion = Integer.parseInt(request.getParameter("accion"));
        if (accion == 1) {
            response.setContentType("text/json;charset=UTF-8");
            Discapacidad discapacidad = new Discapacidad();
            discapacidad.setIdCategoriaDiscapacidad(Integer.parseInt(request.getParameter("idCategoriaDiscapacidad")));
            discapacidad.setDiscapacidad(request.getParameter("discapacidad"));
            DiscapacidadDAO discapacodadDAO = new DiscapacidadDAO(discapacidad);
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                if (discapacodadDAO.insert()) {
                    retorno += "\"codigo\":200,\n";
                    retorno += discapacodadDAO.getDiscapacidadJSON();
                    response.setStatus(response.SC_OK);
                } else {
                    retorno += "\"codigo\":400,\n";
                    retorno += "\"mensaje\": \"" + discapacodadDAO.getMessage() + "\"\n";
                    response.setStatus(response.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        } else if (accion == 2) {

            Discapacidad discapacidad = new Discapacidad();
            discapacidad.setIdDiscapacidad(Integer.parseInt(request.getParameter("idDiscapacidad")));
            DiscapacidadDAO discapacodadDAO = new DiscapacidadDAO(discapacidad);

            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                if (discapacodadDAO.delete()) {

                    retorno += "\"codigo\":200\n";
                    response.setStatus(response.SC_OK);

                } else {

                    retorno += "\"codigo\":400,\n";
                    retorno += "\"mensaje\": \"" + discapacodadDAO.getMessage() + "\"\n";
                    response.setStatus(response.SC_BAD_REQUEST);

                }
                retorno += "}";
                out.write(retorno);
            }
        }
        if (accion == 3) {
            response.setContentType("text/json;charset=UTF-8");
            Discapacidad discapacidad = new Discapacidad();
            discapacidad.setIdDiscapacidad(Integer.parseInt(request.getParameter("idDiscapacidad")));
            discapacidad.setIdCategoriaDiscapacidad(Integer.parseInt(request.getParameter("idCategoriaDiscapacidad")));
            discapacidad.setDiscapacidad(request.getParameter("discapacidad"));
            DiscapacidadDAO discapacodadDAO = new DiscapacidadDAO(discapacidad);
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                if (discapacodadDAO.update()) {
                    retorno += "\"codigo\":200,\n";
                    retorno += discapacodadDAO.getDiscapacidadJSON();
                    response.setStatus(response.SC_OK);
                } else {
                    retorno += "\"codigo\":400,\n";
                    retorno += "\"mensaje\": \"" + discapacodadDAO.getMessage() + "\"\n";
                    response.setStatus(response.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
