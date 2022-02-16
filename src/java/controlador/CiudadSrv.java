/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import accesoDatos.CiudadDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Ciudad;

/**
 *
 * @author dayanna
 */
public class CiudadSrv extends HttpServlet {

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
            out.println("<title>Servlet CiudadSrv</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CiudadSrv at " + request.getContextPath() + "</h1>");
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
        CiudadDAO ciudadDAO = new CiudadDAO();
        String opcion= request.getParameter("opcion");
        
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {   
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            retorno += "\"codigo\":200,\n";
            if (opcion.equals("1")) {
                retorno += ciudadDAO.getVW2JSON();
            }else if (opcion.equals("2")) {
                String idProvincia= request.getParameter("idProvincia");
                retorno += ciudadDAO.selectAll(idProvincia);
            }
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
        Ciudad ciudad = new Ciudad();
        ciudad.setIdCiudad(Integer.parseInt(request.getParameter("idciudad")));
        ciudad.setIdProvincia(Integer.parseInt(request.getParameter("idprovincia")));
        ciudad.setCiudad(request.getParameter("ciudad"));
        ciudad.setEstado(Boolean.parseBoolean(request.getParameter("estado")));
        
        CiudadDAO ciudadDAO = new CiudadDAO(ciudad);
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (ciudadDAO.update()) {
                retorno += "\"codigo\":200,\n";
                retorno += ciudadDAO.getCiudadJSON();
                response.setStatus(response.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + ciudadDAO.getMessage() + "\"\n";
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
        Ciudad ciudad = new Ciudad();
        ciudad.setIdProvincia(Integer.parseInt(request.getParameter("idprovincia")));
        ciudad.setCiudad(request.getParameter("ciudad"));
        
        CiudadDAO ciudadDAO = new CiudadDAO(ciudad);
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (ciudadDAO.insert()) {
                retorno += "\"codigo\":200,\n";
                retorno += ciudadDAO.getCiudadJSON();
                response.setStatus(response.SC_OK);
                //response.sendRedirect("index.jsp");
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + ciudadDAO.getMessage() + "\"\n";
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
        Ciudad ciudad = new Ciudad();
        ciudad.setIdCiudad(Integer.parseInt(request.getParameter("idciudad")));
        
        CiudadDAO ciudadDAO = new CiudadDAO(ciudad);
         response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (ciudadDAO.habilitarDeshabilitar()) {
                retorno += "\"codigo\":200\n";
                response.setStatus(response.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + ciudadDAO.getMessage() + "\"\n";
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
