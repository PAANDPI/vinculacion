<%-- 
    Document   : administrador
    Created on : 01-dic-2021, 21:28:16
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% HttpSession sesion = request.getSession(true);
    Object username = sesion.getAttribute("username") == null ? null : sesion.getAttribute("username");
%>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">  
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="recursos/javaScript/administrador.js" type="text/javascript"></script>
        <script src="recursos/javaScript/JS-AJAX/discapacidadJS.js" type="text/javascript"></script>
        <script src="recursos/javaScript/JS-AJAX/pais.js" type="text/javascript"></script>       
     
       
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/estilos/administrador.css" rel="stylesheet" type="text/css"/>

        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">               
        <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@500&display=swap" rel="stylesheet">
        <link rel="icon" href="recursos/iconos/Logo_colorido.ico" type="image/x-icon">


        <style>
            body
            { max-width: 100%}
        </style>

        <title>Administrador</title>
    </head>
    <%
        boolean validador = false;
        String tipoUsuario = "";

        if (username != null) {
            tipoUsuario = sesion.getAttribute("username").toString();
            validador = Boolean.parseBoolean(tipoUsuario);
        } else {
            response.sendRedirect("login.jsp");
            }%>  

    <body class="" style="background:#E2E2E5;">        
        <%
            if (validador) { %> <%@include  file="plantillas/administracion/menu_administracion.jsp" %> <% } else {  %> 
        <%@include  file="plantillas/administracion/menu_noAdministrador.jsp"%>
        <%  }
        %>        

        <div class="row" >         
            <%@include  file="plantillas/administracion/formularios/inicio.jsp" %>
            <%@include  file="plantillas/administracion/formularios/conceptos.jsp" %>
            <%@include  file="plantillas/administracion/formularios/ubicaciones.jsp" %>                                 
            <%@include  file="plantillas/administracion/formularios/recursos.jsp"%>   
            <%@include  file="plantillas/administracion/formularios/cuenta.jsp"%> 
            <%
                if (validador) { %>

            <%@include  file="plantillas/administracion/formularios/persona.jsp" %>  
            <% } else {

                }
            %> 

        </div>       
        <%@include file="plantillas/administracion/formularios/discapacidades.jsp" %>

              
    </body>
    <script src="recursos/javaScript/JS-AJAX/recursoJS.js" type="text/javascript"></script>
    <script src="recursos/javaScript/JS-AJAX/miCuenta.js" type="text/javascript"></script>
</html>
