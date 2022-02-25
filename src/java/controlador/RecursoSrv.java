/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.RecursoDAO;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
        } else if (accion == 3) {
            RecursoDAO recursoDAO = new RecursoDAO();
            recursoDAO.setRelativePath(getServletContext().getRealPath(""));
            System.out.println("Ruta: " + recursoDAO.getRelativePath());
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                retorno += "\"codigo\":200,\n";
                retorno += "\"ruta\":\"" + recursoDAO.getRelativePath().replace("\\", "/") + "\",\n";
                retorno += recursoDAO.getVW2JSONENLACES();
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

        /*try (PrintWriter out = response.getWriter()) {
            RecursoDAO recursoDAO = new RecursoDAO();

            String relativePath = getServletContext().getRealPath("").replace("\\", "/");
            String context = (getServletContext().getContextPath());
            int indx1 = relativePath.indexOf(context);
            relativePath = relativePath.substring(0, indx1);
            relativePath += "/files" + context + "/";
            recursoDAO.setRelativePath(relativePath);
            System.out.println("Ruta: " + recursoDAO.getRelativePath());
            recursoDAO.setConext(context);

            

            String retorno = "{\n\t";
            if (recursoDAO.guardarArchivo()) {
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }

            retorno += "}";
            out.write(retorno);
        }*/
        MultipartParser multipartParser = new MultipartParser(request, (1024 * 1024 * 20));
        multipartParser.setEncoding("UTF-8");

        HttpServletRequest request2 = request;
        int accion = Integer.parseInt(getParam(request2, "accion"));
        switch (accion) {
            case 1: {
                Recurso recurso = new Recurso();
                Part part;
                ParamPart paramPart;
                part = multipartParser.readNextPart();
                paramPart = (ParamPart) part;
                //recurso.setIdCategoriaRecurso(Integer.parseInt(paramPart.getStringValue()));

                part = multipartParser.readNextPart();
                paramPart = (ParamPart) part;
                //recurso.setIdDiscapacidad(Integer.parseInt(paramPart.getStringValue()));

                part = multipartParser.readNextPart();
                paramPart = (ParamPart) part;
                //recurso.setRecurso(paramPart.getStringValue()));

                part = multipartParser.readNextPart();
                paramPart = (ParamPart) part;
                recurso.setDescripcion(paramPart.getStringValue());

                part = multipartParser.readNextPart();
                paramPart = (ParamPart) part;
                recurso.setEtiquetas(paramPart.getStringValue());

                part = multipartParser.readNextPart();
                paramPart = (ParamPart) part;
                recurso.setRuta(paramPart.getStringValue());

                RecursoDAO recursoDAO = new RecursoDAO(recurso);
                part = multipartParser.readNextPart();
                FilePart filePart = (FilePart) part;
                recursoDAO.setFilePart(filePart);

                recursoDAO.setRelativePath(getServletContext().getRealPath(""));
                System.out.println("Ruta: " + recursoDAO.getRelativePath());

                part = multipartParser.readNextPart();
                paramPart = (ParamPart) part;
                recursoDAO.setHost(paramPart.getStringValue());
                response.setContentType("text/json;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    String retorno = "{\n\t";
                    if (recursoDAO.insert()) {
                        response.setStatus(HttpServletResponse.SC_OK);
                    } else {
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    }
                    retorno += "}";
                    out.write(retorno);
                }
                break;
            }

            case 2: {
                Recurso recurso = new Recurso();
                recurso.setIdCategoriaRecurso(Integer.parseInt(getParam(request, "idcategoriarecurso")));
                recurso.setIdDiscapacidad(Integer.parseInt(getParam(request, "iddiscapacidad")));
                recurso.setRecurso(getParam(request, "recurso"));
                recurso.setDescripcion(getParam(request, "descripcion"));
                recurso.setEtiquetas(getParam(request, "etiquetas"));
                recurso.setRuta(getParam(request, "ruta"));
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
                break;
            }
            case 3: {
                Recurso recurso = new Recurso();
                recurso.setIdRecurso(Integer.parseInt(getParam(request, "idrecurso")));
                RecursoDAO recursoDAO = new RecursoDAO(recurso);
                response.setContentType("text/json;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    String retorno = "{\n\t";
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
                break;
            }
            case 4: {
                Recurso recurso = new Recurso();
                recurso.setRecurso(getParam(request, "recurso"));
                recurso.setDescripcion(getParam(request, "descripcion"));
                recurso.setEtiquetas(getParam(request, "etiquetas"));
                recurso.setEstado(true);
                recurso.setRuta(getParam(request, "ruta"));
                recurso.setIdCategoriaRecurso(Integer.parseInt(getParam(request, "idcategoriarecurso")));
                recurso.setIdDiscapacidad(Integer.parseInt(getParam(request, "iddiscapacidad")));
                recurso.setIdRecurso(Integer.parseInt(getParam(request, "idrecurso")));
                RecursoDAO recursoDAO = new RecursoDAO(recurso);
                recursoDAO.setFilePart(getFilePart(request));
                recursoDAO.setRelativePath(getServletContext().getRealPath(""));
                recursoDAO.setHost(getParam(request, "host"));
                response.setContentType("text/json;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    String retorno = "{\n\t";
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
                break;
            }
            case 5: {
                Recurso recurso = new Recurso();
                recurso.setRecurso(getParam(request, "recurso"));
                recurso.setDescripcion(getParam(request, "descripcion"));
                recurso.setEtiquetas(getParam(request, "etiquetas"));
                recurso.setEstado(true);
                recurso.setRuta(getParam(request, "ruta"));
                recurso.setIdCategoriaRecurso(Integer.parseInt(getParam(request, "idcategoriarecurso")));
                recurso.setIdDiscapacidad(Integer.parseInt(getParam(request, "iddiscapacidad")));
                recurso.setIdRecurso(Integer.parseInt(getParam(request, "idrecurso")));
                RecursoDAO recursoDAO = new RecursoDAO(recurso);
                recursoDAO.setRelativePath(getServletContext().getRealPath(""));
                response.setContentType("text/json;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    String retorno = "{\n\t";
                    if (recursoDAO.updateEnlace()) {
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
                break;
            }
            default:
                break;
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
        /*recurso.setIdCategoriaRecurso(Integer.parseInt(getParam(request, "idcategoriarecurso")));
        recurso.setIdDiscapacidad(Integer.parseInt(getParam(request, "iddiscapacidad")));
        recurso.setRecurso(getParam(request, "recurso"));
        recurso.setDescripcion(getParam(request, "descripcion"));
        recurso.setEtiquetas(getParam(request, "etiquetas"));*/
        getServletContext().getInitParameter("");
        RecursoDAO recursoDAO = new RecursoDAO(recurso);
        String ruta = (getServletContext().getRealPath(""));
        System.out.println("Ruta: " + recursoDAO.getRelativePath());
        response.setContentType("text/json;charset=UTF-8");
        RequestDispatcher dispatcher;
        try (PrintWriter out = response.getWriter()) {
            File directorio = new File(ruta);
            MultipartParser multipartParser = new MultipartParser(request, (1024 * 1024 * 10));
            Part part;

            while ((part = multipartParser.readNextPart()) != null) {
                System.out.println(part.getName());
                if (part.isParam()) {
                    ParamPart paramPart = (ParamPart) part;
                    System.out.println(paramPart.getStringValue());
                } else if (part.isFile()) {
                    FilePart filePart = (FilePart) part;
                    filePart.writeTo(directorio);
                }
                /* String retorno = "{\n\t";
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
            out.write(retorno);*/
            }
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

    private String getParam(HttpServletRequest request, String name) {
        try {
            MultipartParser multipartParser = new MultipartParser(request, (1024 * 1024 * 10));
            multipartParser.setEncoding("UTF-8");
            Part part;

            while ((part = multipartParser.readNextPart()) != null) {
                if (part.isParam()) {
                    if (part.getName().equals(name)) {
                        ParamPart paramPart = (ParamPart) part;
                        multipartParser = null;
                        return paramPart.getStringValue();
                    }
                }
            }
            multipartParser = null;
        } catch (IOException ex) {
            Logger.getLogger(RecursoSrv.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

    private FilePart getFilePart(HttpServletRequest request) {
        try {
            MultipartParser multipartParser = new MultipartParser(request, (1024 * 1024 * 10));
            Part part;

            while ((part = multipartParser.readNextPart()) != null) {
                if (part.isFile()) {
                    FilePart filePart = (FilePart) part;
                    multipartParser = null;
                    return filePart;
                }
            }
            multipartParser = null;
        } catch (IOException ex) {
            Logger.getLogger(RecursoSrv.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
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
