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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        switch (accion) {
            case 1: {
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
                break;
            }
            case 2: {
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
                break;
            }
            case 3: {
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
                break;
            }
            default:
                break;
        }
    }

    FilePart filePart;

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
        HashMap map = multiPart2HashMap(multipartParser);
        int accion = Integer.parseInt(map.get("accion").toString());
        switch (accion) {
            case 1: {
                Recurso recurso = new Recurso();
                recurso.setIdCategoriaRecurso(Integer.parseInt(map.get("idcategoriarecurso").toString()));

                recurso.setIdDiscapacidad(Integer.parseInt(map.get("iddiscapacidad").toString()));
                recurso.setDescripcion(map.get("descripcion").toString());

                recurso.setEtiquetas(map.get("etiquetas").toString());

                recurso.setRecurso(map.get("recurso").toString());
                recurso.setEstado(true);
                RecursoDAO recursoDAO = new RecursoDAO(recurso);

                String relativePath = getServletContext().getRealPath("").replace("\\", "/");
                String context = (getServletContext().getContextPath());
                int indx1 = relativePath.indexOf(context);
                relativePath = relativePath.substring(0, indx1);
                relativePath += "/files" + context + "/";
                recursoDAO.setRelativePath(relativePath);
                System.out.println("Ruta: " + recursoDAO.getRelativePath());
                recursoDAO.setConext(context);

                recursoDAO.setFilePart(getFilePart());

                recursoDAO.setHost(map.get("host").toString());
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

                recurso.setIdCategoriaRecurso(Integer.parseInt(map.get("idcategoriarecurso").toString()));
                recurso.setIdDiscapacidad(Integer.parseInt(map.get("iddiscapacidad").toString()));
                recurso.setDescripcion(map.get("descripcion").toString());

                recurso.setEtiquetas(map.get("etiquetas").toString());

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
                recurso.setIdRecurso(Integer.parseInt(map.get("idrecurso").toString()));
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
                recurso.setRecurso(map.get("recurso").toString());
                recurso.setDescripcion(map.get("descripcion").toString());
                recurso.setEtiquetas(map.get("etiquetas").toString());
                recurso.setEstado(true);
                recurso.setRuta(map.get("ruta").toString());
                recurso.setIdCategoriaRecurso(Integer.parseInt(map.get("idcategoriarecurso").toString()));
                recurso.setIdDiscapacidad(Integer.parseInt(map.get("iddiscapacidad").toString()));
                recurso.setIdRecurso(Integer.parseInt(map.get("idrecurso").toString()));
                RecursoDAO recursoDAO = new RecursoDAO(recurso);
                
                String relativePath = getServletContext().getRealPath("").replace("\\", "/");
                String context = (getServletContext().getContextPath());
                int indx1 = relativePath.indexOf(context);
                relativePath = relativePath.substring(0, indx1);
                relativePath += "/files" + context + "/";
                recursoDAO.setRelativePath(relativePath);
                System.out.println("Ruta: " + recursoDAO.getRelativePath());
                recursoDAO.setConext(context);

                recursoDAO.setHost(map.get("host").toString());
                recursoDAO.setFilePart(getFilePart());
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
                recurso.setRecurso(map.get("recurso").toString());
                recurso.setDescripcion(map.get("descripcion").toString());
                recurso.setEtiquetas(map.get("etiquetas").toString());
                recurso.setEstado(true);
                recurso.setRuta(map.get("ruta").toString());
                recurso.setIdCategoriaRecurso(Integer.parseInt(map.get("idcategoriarecurso").toString()));
                recurso.setIdDiscapacidad(Integer.parseInt(map.get("iddiscapacidad").toString()));
                recurso.setIdRecurso(Integer.parseInt(map.get("idrecurso").toString()));
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
        recurso.setIdCategoriaRecurso(Integer.parseInt(request.getParameter("idcategoriarecurso")));
        recurso.setIdDiscapacidad(Integer.parseInt(request.getParameter("iddiscapacidad")));
        recurso.setRecurso(request.getParameter("recurso"));
        recurso.setDescripcion(request.getParameter("descripcion"));
        recurso.setEtiquetas(request.getParameter("etiquetas"));

        RecursoDAO recursoDAO = new RecursoDAO(recurso);
        try (PrintWriter out = response.getWriter()) {

            String retorno = "{\n\t";
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

    private HashMap<String, String> multiPart2HashMap(MultipartParser multipartParser) {
        HashMap<String, String> map = new HashMap<>();
        try {
            map = new HashMap<>();
            Part part;

            while ((part = multipartParser.readNextPart()) != null) {
                if (part.isParam()) {
                    ParamPart paramPart = (ParamPart) part;
                    map.put(part.getName(), paramPart.getStringValue());
                } else if (part.isFile()) {
                    setFilePart((FilePart) part);
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(RecursoSrv.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return map;
    }

    private void setFilePart(FilePart filePart) {
        this.filePart = filePart;
    }

    private FilePart getFilePart() {
        return filePart;
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
