/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.ConceptoDAO;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Concepto;

/**
 *
 * @author USUARIO
 */
@WebServlet(
    name = "ConceptoSrv", 
    urlPatterns = {"/ConceptoSrv"}
)
public class ConceptoSrv extends HttpServlet {

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
            out.println("<title>Servlet ConceptoSrv</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConceptoSrv at " + request.getContextPath() + "</h1>");
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
        Concepto concepto = new Concepto();
        ConceptoDAO conceptoDAO = new ConceptoDAO(concepto);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            retorno += "\"codigo\":200,\n";
            String busqueda = (request.getParameter("busqueda"));

            int tipoBusqueda = Integer.parseInt(request.getParameter("tipobusqueda"));
            switch (tipoBusqueda) {
                case 1:
                    retorno += conceptoDAO.getVW2JSON(Integer.parseInt(busqueda));
                    break;
                case 2:
                    retorno += conceptoDAO.getVW2JSON(busqueda);
                    break;
                default:
                    retorno += conceptoDAO.getVW2JSON();
                    break;
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
        int accion = Integer.parseInt(request.getParameter("accion"));
        if (accion == 1) {
            Concepto concepto = new Concepto();
            int id = Integer.parseInt(request.getParameter("idDiscapacidad"));
            concepto.setIdDiscapacidad(id);
            concepto.setDescripcion(request.getParameter("descripcion"));
            concepto.setEtiquetas(request.getParameter("etiquetas"));

            ConceptoDAO conceptoDAO = new ConceptoDAO(concepto);
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (conceptoDAO.insert()) {
                    response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

                }
                retorno += "}";
                out.write(retorno);
            }
        } else if (accion == 2) {
            Concepto concepto = new Concepto();
            concepto.setIdDiscapacidad(Integer.parseInt(request.getParameter("idDiscapacidad")));
            concepto.setIdConcepto(Integer.parseInt(request.getParameter("idConcepto")));
            concepto.setDescripcion(request.getParameter("descripcion"));
            concepto.setEtiquetas(request.getParameter("etiquetas"));
            ConceptoDAO conceptoDAO = new ConceptoDAO(concepto);
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                if (conceptoDAO.update()) {
                    response.setStatus(response.SC_OK);
                } else {
                    response.setStatus(response.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        } else if (accion == 3) {

            Concepto concepto = new Concepto();
            concepto.setIdConcepto(Integer.parseInt(request.getParameter("idconcepto")));
            ConceptoDAO conceptoDAO = new ConceptoDAO(concepto);

            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (conceptoDAO.delete()) {
                    retorno += "\"codigo\":200\n";
                    response.setStatus(response.SC_OK);
                } else {
                    retorno += "\"codigo\":400,\n";
                    retorno += "\"mensaje\": \"" + conceptoDAO.getMessage() + "\"\n";
                    response.setStatus(response.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }

        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        //super.doPut(req, resp); //To change body of generated methods, choose Tools | Templates.
//
//        Concepto concepto = new Concepto();
////        Integer.parseInt(req.getParameter("idDiscapacidad"));
//        int id = Integer.parseInt(req.getParameter("idDiscapacidad"));
//        concepto.setIdDiscapacidad(id);
//        concepto.setDescripcion(req.getParameter("descripcion"));
//        concepto.setEtiquetas(req.getParameter("etiquetas"));
//
//        ConceptoDAO conceptoDAO = new ConceptoDAO(concepto);
//        resp.setContentType("text/json;charset=UTF-8");
//        try (PrintWriter out = resp.getWriter()) {
//            String retorno = "{\n\t";
//            /* TODO output your page here. You may use following sample code. */
//            if (conceptoDAO.insert()) {
//                retorno += "\"codigo\":200,\n";
//                retorno += conceptoDAO.getConceptoJSON();
//                resp.setStatus(resp.SC_OK);
//                //response.sendRedirect("index.jsp");
//            } else {
//                retorno += "\"codigo\":400,\n";
//                retorno += "\"mensaje\": \"" + conceptoDAO.getMessage() + "\"\n";
//                resp.setStatus(resp.SC_BAD_REQUEST);
//            }
//            retorno += "}";
//            out.write(retorno);
//        }

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Concepto concepto = new Concepto();
        concepto.setIdConcepto(Integer.parseInt(req.getParameter("idconcepto")));
        ConceptoDAO conceptoDAO = new ConceptoDAO(concepto);

        resp.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (conceptoDAO.delete()) {
                retorno += "\"codigo\":200\n";
                resp.setStatus(resp.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + conceptoDAO.getMessage() + "\"\n";
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
