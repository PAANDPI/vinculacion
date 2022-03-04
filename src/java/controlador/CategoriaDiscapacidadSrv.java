/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.CategoriaDiscapacidadDAO;

import java.io.IOException;
import java.io.PrintWriter;
import model.CategoriaDiscapacidad;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 *
 * @author Arialdo
 */
@WebServlet(
    name = "CategoriaDiscapacidadSrv", 
    urlPatterns = {"/CategoriaDiscapacidadSrv"}
)
public class CategoriaDiscapacidadSrv extends HttpServlet {

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
            out.println("<title>Servlet CategoriaDiscapacidadSrv</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoriaDiscapacidadSrv at " + request.getContextPath() + "</h1>");
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
        
        CategoriaDiscapacidadDAO categoriaDiscapacidadDAO = new CategoriaDiscapacidadDAO();
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            retorno += "\"codigo\":200,\n";
            retorno += categoriaDiscapacidadDAO.getVW2JSON();
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
        CategoriaDiscapacidad categoriaDiscapacidad = new CategoriaDiscapacidad();
        categoriaDiscapacidad.setIdCategoriaDiscapacidad(Integer.parseInt(request.getParameter("idcategoriadiscapacidad")));
        categoriaDiscapacidad.setCategoriaDiscapacidad(request.getParameter("categoriadiscapacidad"));

        CategoriaDiscapacidadDAO categoriaDiscapacidadDAO = new CategoriaDiscapacidadDAO(categoriaDiscapacidad);
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (categoriaDiscapacidadDAO.update()) {
                retorno += "\"codigo\":200,\n";
                retorno += categoriaDiscapacidadDAO.getCategoriaDiscapacidadJSON();
                response.setStatus(response.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + categoriaDiscapacidadDAO.getMessage() + "\"\n";
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
        CategoriaDiscapacidad categoriaDiscapacidad = new CategoriaDiscapacidad();
        categoriaDiscapacidad.setCategoriaDiscapacidad(request.getParameter("categoriadiscapacidad"));

        CategoriaDiscapacidadDAO categoriaDiscapacidadDAO = new CategoriaDiscapacidadDAO(categoriaDiscapacidad);
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (categoriaDiscapacidadDAO.insert()) {
                retorno += "\"codigo\":200,\n";
                retorno += categoriaDiscapacidadDAO.getCategoriaDiscapacidadJSON();
                response.setStatus(response.SC_OK);
                //response.sendRedirect("index.jsp");
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + categoriaDiscapacidadDAO.getMessage() + "\"\n";
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
        CategoriaDiscapacidad categoriaDiscapacidad = new CategoriaDiscapacidad();
        categoriaDiscapacidad.setIdCategoriaDiscapacidad(Integer.parseInt(request.getParameter("idcategoriadiscapacidad")));

        CategoriaDiscapacidadDAO categoriaDiscapacidadDAO = new CategoriaDiscapacidadDAO(categoriaDiscapacidad);
         response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (categoriaDiscapacidadDAO.delete()) {
                retorno += "\"codigo\":200\n";
                response.setStatus(response.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + categoriaDiscapacidadDAO.getMessage() + "\"\n";
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
