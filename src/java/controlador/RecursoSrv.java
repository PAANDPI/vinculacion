/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.RecursoDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Recurso;

/**
 *
 * @author Arialdo
 */
@WebServlet(
        name = "RecursoSrv",
        urlPatterns = {"/ProvinciaSvr"}
)
@MultipartConfig
public class RecursoSrv extends HttpServlet {

    File file;

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
            case 4: {
                String discapacidad = request.getParameter("txtDiscapacidad");
                RecursoDAO recursoDAO = new RecursoDAO();
                recursoDAO.setRelativePath(getServletContext().getRealPath(""));
                System.out.println("Ruta: " + recursoDAO.getRelativePath());
                response.setContentType("text/json;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    String retorno = "{\n\t";
                    retorno += "\"codigo\":200,\n";
                    retorno += "\"ruta\":\"" + recursoDAO.getRelativePath().replace("\\", "/") + "\",\n";
                    retorno += recursoDAO.getVW2JSONNombre(discapacidad);
                    retorno += "\n}";
                    out.write(retorno);
                }
                break;
            }
            case 5: {
                String recurso = request.getParameter("txtDiscapacidad");
                RecursoDAO recursoDAO = new RecursoDAO();
                recursoDAO.setRelativePath(getServletContext().getRealPath(""));
                System.out.println("Ruta: " + recursoDAO.getRelativePath());
                response.setContentType("text/json;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    String retorno = "{\n\t";
                    retorno += "\"codigo\":200,\n";
                    retorno += "\"ruta\":\"" + recursoDAO.getRelativePath().replace("\\", "/") + "\",\n";
                    retorno += recursoDAO.getVW2JSORecurso(recurso);
                    retorno += "\n}";
                    out.write(retorno);
                }
                break;
            }
            case 6: {
                int idCategoria = Integer.parseInt(request.getParameter("cmbCategoria"));
                String recurso = request.getParameter("txtDiscapacidad");
                RecursoDAO recursoDAO = new RecursoDAO();
                recursoDAO.setRelativePath(getServletContext().getRealPath(""));
                System.out.println("Ruta: " + recursoDAO.getRelativePath());
                response.setContentType("text/json;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    String retorno = "{\n\t";
                    retorno += "\"codigo\":200,\n";
                    retorno += "\"ruta\":\"" + recursoDAO.getRelativePath().replace("\\", "/") + "\",\n";
                    retorno += recursoDAO.getVW2JSONFiltro(recurso, idCategoria);
                    retorno += "\n}";
                    out.write(retorno);
                }
                break;
            }
             case 7: {
                int idCategoriaDiscapacidad = Integer.parseInt(request.getParameter("cmbCategoriaDiscapacidad"));
                RecursoDAO recursoDAO = new RecursoDAO();
                recursoDAO.setRelativePath(getServletContext().getRealPath(""));
                System.out.println("Ruta: " + recursoDAO.getRelativePath());
                response.setContentType("text/json;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    String retorno = "{\n\t";
                    retorno += "\"codigo\":200,\n";
                    retorno += "\"ruta\":\"" + recursoDAO.getRelativePath().replace("\\", "/") + "\",\n";
                    retorno += recursoDAO.getVW2JSOCategoria(idCategoriaDiscapacidad);
                    retorno += "\n}";
                    out.write(retorno);
                }
                break;
            }
            default:
                break;
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

        switch (accion) {
            case 1: {
                Recurso recurso = new Recurso();
                recurso.setIdCategoriaRecurso(Integer.parseInt(request.getParameter("idcategoriarecurso")));
                recurso.setIdDiscapacidad(Integer.parseInt(request.getParameter("iddiscapacidad")));
                recurso.setDescripcion(request.getParameter("descripcion"));
                recurso.setEtiquetas(request.getParameter("etiquetas"));
                recurso.setRecurso(request.getParameter("recurso"));
                recurso.setEstado(true);
                RecursoDAO recursoDAO = new RecursoDAO(recurso);
                String relativePath = getServletContext().getRealPath("").replace("\\", "/");
                String context = (getServletContext().getContextPath());
                int indx1 = relativePath.indexOf(context);
                relativePath = relativePath.substring(0, indx1);
                relativePath += "/files" + context + "/";
                recursoDAO.setRelativePath(relativePath);
                System.out.println("Ruta: " + recursoDAO.getRelativePath());
                recursoDAO.setContext(context);
                ///recursoDAO.setFile(file);
                Part filePart = request.getPart("ruta");
                System.out.println(filePart.getName());

                recursoDAO.setFilePart(filePart);
                recursoDAO.setHost(request.getParameter("host"));
                response.setContentType("text/json;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    String retorno = "{\n\t";
                    if (recursoDAO.insert()) {
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

            case 2: {
                Recurso recurso = new Recurso();

                recurso.setIdCategoriaRecurso(Integer.parseInt(request.getParameter("idcategoriarecurso")));
                recurso.setIdDiscapacidad(Integer.parseInt(request.getParameter("iddiscapacidad")));
                recurso.setDescripcion(request.getParameter("descripcion"));
                recurso.setRecurso(request.getParameter("recurso"));
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
                break;
            }
            case 3: {
                Recurso recurso = new Recurso();
                recurso.setIdRecurso(Integer.parseInt(request.getParameter("idrecurso")));
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
                recurso.setRecurso(request.getParameter("recurso"));
                recurso.setDescripcion(request.getParameter("descripcion"));
                recurso.setEtiquetas(request.getParameter("etiquetas"));
                recurso.setEstado(true);
                recurso.setIdCategoriaRecurso(Integer.parseInt(request.getParameter("idcategoriarecurso")));
                recurso.setIdDiscapacidad(Integer.parseInt(request.getParameter("iddiscapacidad")));
                recurso.setIdRecurso(Integer.parseInt(request.getParameter("idrecurso")));
                RecursoDAO recursoDAO = new RecursoDAO(recurso);

                String relativePath = getServletContext().getRealPath("").replace("\\", "/");
                String context = (getServletContext().getContextPath());
                int indx1 = relativePath.indexOf(context);
                relativePath = relativePath.substring(0, indx1);
                relativePath += "/files" + context + "/";
                recursoDAO.setRelativePath(relativePath);
                System.out.println("Ruta: " + recursoDAO.getRelativePath());
                recursoDAO.setContext(context);
                recursoDAO.setFile(file);

                recursoDAO.setHost(request.getParameter("host"));
                Part filePart = request.getPart("ruta");
                System.out.println(filePart.getName());

                recursoDAO.setFilePart(filePart);
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
                recurso.setRecurso(request.getParameter("recurso"));
                recurso.setDescripcion(request.getParameter("descripcion"));
                recurso.setEtiquetas(request.getParameter("etiquetas"));
                recurso.setEstado(false);
                recurso.setRuta(request.getParameter("ruta"));
                recurso.setIdCategoriaRecurso(Integer.parseInt(request.getParameter("idcategoriarecurso")));
                recurso.setIdDiscapacidad(Integer.parseInt(request.getParameter("iddiscapacidad")));
                recurso.setIdRecurso(Integer.parseInt(request.getParameter("idrecurso")));
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

//    private HashMap<String, String> multiPart2HashMap(MultipartParser multipartParser) {
//        HashMap<String, String> map = new HashMap<>();
//        try {
//            map = new HashMap<>();
//            Part part;
//
//            while ((part = multipartParser.readNextPart()) != null) {
//                if (part.isParam()) {
//                    ParamPart paramPart = (ParamPart) part;
//                    map.put(part.getName(), paramPart.getStringValue());
//                } else if (part.isFile()) {
//                    filePart = (FilePart) part;
//                    /*inputStream = filePart.getInputStream();*/
//                    String relativePath = getServletContext().getRealPath("").replace("\\", "/");
//                    String context = (getServletContext().getContextPath());
//                    int indx1 = relativePath.indexOf(context);
//                    relativePath = relativePath.substring(0, indx1);
//                    relativePath += "/files" + context + "/recursosDiscapacidades/";
//                    file = new File(relativePath);
//                    System.out.println(file.getAbsolutePath());
//                    System.out.println(file.getAbsoluteFile());
//                    System.out.println(file.getPath());
//
//                    if (!file.exists()) {
//                        if (file.mkdirs()) {
//                            System.out.println("Directorio creado");
//                        } else {
//                            System.out.println("Error al crear directorio");
//                        }
//                    }
//
//                    filePart.writeTo(file);
//
//                    file = new File(relativePath + filePart.getFileName());
//
//                    //setFilePart((FilePart) part);
//
//                    /*try {
//                        File directorio = new File(relativePath + "recursosDiscapacidades/");
//                        if (!directorio.exists()) {
//                            if (directorio.mkdirs()) {
//                                System.out.println("Directorio creado");
//                            } else {
//                                System.out.println("Error al crear directorio");
//                            }
//                        }
//                        String nombreArchivo = "recursosDiscapacidades/" + recurso.getRecurso() + System.currentTimeMillis();
//                        String tipoArchivo;
//                        int indx = filePart.getFileName().lastIndexOf(".");
//                        tipoArchivo = filePart.getFileName().substring(indx);
//                        nombreArchivo += tipoArchivo;
//                        String pathArchivo = relativePath + nombreArchivo;
//                        directorio = new File(pathArchivo);
//                        filePart.writeTo(directorio);
//
//                        /*String pathArchivo = relativePath + nombreArchivo;
//                    System.out.println("Ruta: " + pathArchivo);
//                    byte[] dataBytes = DatatypeConverter.parseBase64Binary(base64);
//                    FileOutputStream out = new FileOutputStream(pathArchivo);
//                    out.write(dataBytes);
//                    out.close();*//*
//            String rutaBD = host + "/files" + conext + "/" + nombreArchivo;
//            recurso.setRuta(rutaBD);
//                
//                        return true;
//                    } catch (IOException e) {
//                        conex.setMessage(e.getMessage());
//                    }
//                     */
//                }
//            }
//        } catch (IOException ex) {
//            Logger.getLogger(RecursoSrv.class
//                    .getName()).log(Level.SEVERE, null, ex);
//        }
//        return map;
//    }
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
