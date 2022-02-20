/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.RecursoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Recurso;

/**
 *
 * @author Arialdo
 */
public class RecursoSrv extends HttpServlet {

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
            out.println("<title>Servlet RecursoSrv</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RecursoSrv at " + request.getContextPath() + "</h1>");
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
        int accion = Integer.parseInt(request.getParameter("accion"));
        if (accion == 1) {
            RecursoDAO recursoDAO = new RecursoDAO();
            recursoDAO.setRelativePath(getServletContext().getRealPath(""));
            System.out.println("Ruta: " + recursoDAO.getRelativePath());

            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                retorno += "\"codigo\":200,\n";
                retorno += "\"ruta\":\"" + recursoDAO.getRelativePath().replace("\\", "/") + "\",\n";
                retorno += recursoDAO.getVW2JSON();
                retorno += "\n}";
                out.write(retorno);
            }
        } else if (accion == 2) {
            int idCategoria = Integer.parseInt(request.getParameter("cmbCategoria"));
            String discapacidad = request.getParameter("txtDiscapacidad");
            RecursoDAO recursoDAO = new RecursoDAO();
            recursoDAO.setRelativePath(getServletContext().getRealPath(""));
            System.out.println("Ruta: " + recursoDAO.getRelativePath());
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                retorno += "\"codigo\":200,\n";
                retorno += "\"ruta\":\"" + recursoDAO.getRelativePath().replace("\\", "/") + "\",\n";
                retorno += recursoDAO.getVW2JSON(idCategoria, discapacidad);
                retorno += "\n}";
                out.write(retorno);
            }
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
            Recurso recurso = new Recurso();
            recurso.setIdCategoriaRecurso(Integer.parseInt(request.getParameter("idcategoriarecurso")));
            recurso.setIdDiscapacidad(Integer.parseInt(request.getParameter("iddiscapacidad")));
            recurso.setRecurso(request.getParameter("recurso"));
            recurso.setDescripcion(request.getParameter("descripcion"));
            recurso.setEtiquetas(request.getParameter("etiquetas"));
            recurso.setRuta(request.getParameter("ruta"));
            RecursoDAO recursoDAO = new RecursoDAO(recurso);
            recursoDAO.setRelativePath(getServletContext().getRealPath(""));
            System.out.println("Ruta: " + recursoDAO.getRelativePath());
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (recursoDAO.insert()) {
                    response.setStatus(HttpServletResponse.SC_OK);

                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        } else if (accion == 2) {
            Recurso recurso = new Recurso();
            recurso.setIdCategoriaRecurso(Integer.parseInt(request.getParameter("idcategoriarecurso")));
            recurso.setIdDiscapacidad(Integer.parseInt(request.getParameter("iddiscapacidad")));
            recurso.setRecurso(request.getParameter("recurso"));
            recurso.setDescripcion(request.getParameter("descripcion"));
            recurso.setEtiquetas(request.getParameter("etiquetas"));
            recurso.setRuta(request.getParameter("ruta"));
            RecursoDAO recursoDAO = new RecursoDAO(recurso);
            recursoDAO.setRelativePath(getServletContext().getRealPath(""));
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";

                if (recursoDAO.insertEnlace()) {
                    response.setStatus(HttpServletResponse.SC_OK);

                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        }
        if (accion == 3) {
            Recurso recurso = new Recurso();
            recurso.setIdRecurso(Integer.parseInt(request.getParameter("idrecurso")));
            RecursoDAO recursoDAO = new RecursoDAO(recurso);
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (recursoDAO.delete()) {
                    retorno += "\"codigo\":200\n";
                    response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    retorno += "\"codigo\":400,\n";
                    retorno += "\"mensaje\": \"" + recursoDAO.getMessage() + "\"\n";
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        }
        if (accion == 4) {
            Recurso recurso = new Recurso();
            recurso.setRecurso(request.getParameter("recurso"));
            recurso.setDescripcion(request.getParameter("descripcion"));
            recurso.setEtiquetas(request.getParameter("etiquetas"));
            recurso.setEstado(true);
            recurso.setRuta(request.getParameter("ruta"));

            recurso.setIdCategoriaRecurso(Integer.parseInt(request.getParameter("idcategoriarecurso")));
            recurso.setIdDiscapacidad(Integer.parseInt(request.getParameter("iddiscapacidad")));
            recurso.setIdRecurso(Integer.parseInt(request.getParameter("idrecurso")));

            RecursoDAO recursoDAO = new RecursoDAO(recurso);
            recursoDAO.setRelativePath(getServletContext().getRealPath(""));
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (recursoDAO.update()) {
                    retorno += "\"codigo\":200,\n";
                    retorno += recursoDAO.getRecursoJSON();
                    response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    retorno += "\"codigo\":400,\n";
                    retorno += "\"mensaje\": \"" + recursoDAO.getMessage() + "\"\n";
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
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
        Recurso recurso = new Recurso();
        recurso.setIdCategoriaRecurso(Integer.parseInt(request.getParameter("idcategoriarecurso")));
        recurso.setIdDiscapacidad(Integer.parseInt(request.getParameter("iddiscapacidad")));
        recurso.setRecurso(request.getParameter("recurso"));
        recurso.setDescripcion(request.getParameter("descripcion"));
        recurso.setEtiquetas(request.getParameter("etiquetas"));
        recurso.setRuta(request.getParameter("ruta"));
        RecursoDAO recursoDAO = new RecursoDAO(recurso);
        recursoDAO.setRelativePath(getServletContext().getRealPath("/"));
        System.out.println("Ruta: " + recursoDAO.getRelativePath());
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (recursoDAO.insert()) {
                retorno += "\"codigo\":200,\n";
                retorno += recursoDAO.getRecursoJSON();
                response.setStatus(HttpServletResponse.SC_OK);
                //response.sendRedirect("index.jsp");
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + recursoDAO.getMessage() + "\"\n";
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
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
        Recurso recurso = new Recurso();
        recurso.setIdRecurso(Integer.parseInt(request.getParameter("idrecurso")));

        RecursoDAO recursoDAO = new RecursoDAO(recurso);
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (recursoDAO.habilitarDeshabilitar()) {
                retorno += "\"codigo\":200\n";
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + recursoDAO.getMessage() + "\"\n";
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
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
