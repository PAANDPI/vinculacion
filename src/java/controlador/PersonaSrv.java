/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import accesoDatos.PersonaDAO;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Persona;

/**
 *
 * @author Arialdo
 */
@WebServlet(
    name = "PersonaSrv", 
    urlPatterns = {"/PersonaSrv"}
)
public class PersonaSrv extends HttpServlet {

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
            out.println("<title>Servlet PersonaSrv</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PersonaSrv at " + request.getContextPath() + "</h1>");
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
        PersonaDAO personaDAO = new PersonaDAO();
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            retorno += "\"codigo\":200,\n";
            retorno += personaDAO.getVW2JSON();
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
        if (accion == 1) // LOGIN
        {
            Persona persona = new Persona();
            persona.setUsuario(request.getParameter("usuario"));
            persona.setClave(request.getParameter("clave"));

            PersonaDAO personaDAO = new PersonaDAO(persona);
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (personaDAO.login()) {
                    retorno += "\"codigo\":200,\n";
                    retorno += personaDAO.getPersonaJSON2();
                    HttpSession sesion = request.getSession(true);

                    sesion.setAttribute("username", personaDAO.tipoUsuario() + "");
                    response.setStatus(response.SC_OK);
                } else {
                    retorno += "\"codigo\":400,\n";
                    retorno += "\"mensaje\": \"" + personaDAO.getMessage() + "\"\n";
                    response.setStatus(response.SC_BAD_REQUEST);

                }
                retorno += "}";
                out.write(retorno);

                //processRequest(request, response);
            }
        } else if (accion == 2) //ingresar
        {
            Persona persona = new Persona();
            persona.setIdCiudad(Integer.parseInt(request.getParameter("idCiudad")));
            persona.setNombre(request.getParameter("nombre"));
            persona.setApellido(request.getParameter("apellido"));
            persona.setGenero(request.getParameter("genero"));
            persona.setUsuario(request.getParameter("usuario"));
            persona.setCorreo(request.getParameter("correo"));
            persona.setClave(request.getParameter("clave"));

            PersonaDAO personaDAO = new PersonaDAO(persona);
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (personaDAO.insert()) {

                    response.setStatus(response.SC_OK);
                } else {
                    response.setStatus(response.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        } else if (accion == 3)//update
        {
            Persona persona = new Persona();
            persona.setIdPersona(Integer.parseInt(request.getParameter("idpersona")));
            persona.setIdCiudad(Integer.parseInt(request.getParameter("idCiudad")));
            persona.setNombre(request.getParameter("nombre"));
            persona.setApellido(request.getParameter("apellido"));
            persona.setGenero(request.getParameter("genero"));
            persona.setUsuario(request.getParameter("usuario"));
            persona.setCorreo(request.getParameter("correo"));
            persona.setClave(request.getParameter("clave"));
            persona.setAdministrador(Boolean.parseBoolean(request.getParameter("administrador")));

            PersonaDAO personaDAO = new PersonaDAO(persona);
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (personaDAO.update()) {
                    retorno += "\"codigo\":200\n";
//                    retorno += personaDAO.getPersonaJSON();
                    response.setStatus(response.SC_OK);
                    //response.sendRedirect("index.jsp");
                } else {
                    retorno += "\"codigo\":400,\n";
//                    retorno += "\"mensaje\": \"" + personaDAO.getMessage() + "\"\n";
                    response.setStatus(response.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }
        } else if (accion == 4)//delete
        {
            Persona persona = new Persona();
            persona.setIdPersona(Integer.parseInt(request.getParameter("idpersona")));
            PersonaDAO PDao = new PersonaDAO(persona);
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (PDao.delete()) {
//                    retorno += "\"codigo\":200,\n";
//                    retorno += personaDAO.getPersonaJSON();
                    response.setStatus(response.SC_OK);
                    //response.sendRedirect("index.jsp");
                } else {
//                    retorno += "\"codigo\":400,\n";
//                    retorno += "\"mensaje\": \"" + personaDAO.getMessage() + "\"\n";
                    response.setStatus(response.SC_BAD_REQUEST);
                }
                retorno += "}";
                out.write(retorno);
            }

        } else if (accion == 5) {
            HttpSession sesion = request.getSession(true);
            sesion.invalidate();
            response.sendRedirect("index.jsp");
        } else if (accion == 6) {
            Persona persona = new Persona();
            persona.setIdPersona(Integer.parseInt(request.getParameter("idpersona")));
            persona.setClave(request.getParameter("clave"));
            PersonaDAO personaDAO = new PersonaDAO(persona);
            response.setContentType("text/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                String retorno = "{\n\t";
                /* TODO output your page here. You may use following sample code. */
                if (personaDAO.cambiarClave()) {
                    response.setStatus(response.SC_OK);

                } else {
                    response.setStatus(response.SC_BAD_REQUEST);
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
        Persona persona = new Persona();

        persona.setIdPersona(Integer.parseInt(request.getParameter("idCiudad")));

        PersonaDAO personaDAO = new PersonaDAO(persona);
        response.setContentType("text/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String retorno = "{\n\t";
            /* TODO output your page here. You may use following sample code. */
            if (personaDAO.habilitarDeshabilitar()) {
                retorno += "\"codigo\":200\n";
                response.setStatus(response.SC_OK);
            } else {
                retorno += "\"codigo\":400,\n";
                retorno += "\"mensaje\": \"" + personaDAO.getMessage() + "\"\n";
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
