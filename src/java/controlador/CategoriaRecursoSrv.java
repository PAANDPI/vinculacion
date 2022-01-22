/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.CategoriaRecursoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoriaRecurso;

/**
 *
 * @author USUARIO
 */
public class CategoriaRecursoSrv extends HttpServlet {

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
            out.println("<title>Servlet CategoriaRecursoSrv</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoriaRecursoSrv at " + request.getContextPath() + "</h1>");
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
        CategoriaRecursoDAO categoriaRecursoDAO=new CategoriaRecursoDAO();
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            retorno += "\"codigo\":200,\n";
            retorno += categoriaRecursoDAO.getVW2JSON();
            retorno += "\n}";
            out.write(retorno);
            // processRequest(request, response);
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
        CategoriaRecurso categoriaRecurso=new CategoriaRecurso();
       // categoriaRecurso.setIdCategoriaRecurso(Integer.parseInt(request.getParameter("idcategoriarecurso")));
        categoriaRecurso.setCategoriaRecurso(request.getParameter("categoriarecurso"));
        
        CategoriaRecursoDAO categoriaRecursoDAO=new CategoriaRecursoDAO(categoriaRecurso);
         response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (categoriaRecursoDAO.update()) {
                retorno += "\"codigo\":200,\n";
                retorno += categoriaRecursoDAO.getCategoriaRecursoJSON();
                response.setStatus(response.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + categoriaRecursoDAO.getMessage() + "\"\n";
                response.setStatus(response.SC_BAD_REQUEST);

            }
            retorno += "}";
            out.write(retorno);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        CategoriaRecurso categoriaRecurso=new CategoriaRecurso();
        categoriaRecurso.setCategoriaRecurso(req.getParameter("categoriarecurso"));
        
        CategoriaRecursoDAO categoriaRecursoDAO=new CategoriaRecursoDAO(categoriaRecurso);
        resp.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (categoriaRecursoDAO.insert()) {
                retorno += "\"codigo\":200,\n";
                retorno += categoriaRecursoDAO.getCategoriaRecursoJSON();
                resp.setStatus(resp.SC_OK);
                //response.sendRedirect("index.jsp");
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + categoriaRecursoDAO.getMessage() + "\"\n";
                resp.setStatus(resp.SC_BAD_REQUEST);
            }
            retorno += "}";
            out.write(retorno);
        }
       
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        CategoriaRecurso categoriaRecurso=new CategoriaRecurso();
        categoriaRecurso.setIdCategoriaRecurso(Integer.parseInt(req.getParameter("idcategoriarecurso")));
        
        CategoriaRecursoDAO categoriaRecursoDAO=new CategoriaRecursoDAO(categoriaRecurso);
        resp.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (categoriaRecursoDAO.habilitarDeshabilitar()) {
                retorno += "\"codigo\":200\n";
                resp.setStatus(resp.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + categoriaRecursoDAO.getMessage() + "\"\n";
                resp.setStatus(resp.SC_BAD_REQUEST);
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
