<%-- 
    Document   : administrador
    Created on : 01-dic-2021, 21:28:16
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">  
   
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="recursos/javaScript/administrador.js" type="text/javascript"></script>
        <script src="recursos/javaScript/JS-AJAX/discapacidadJS.js" type="text/javascript"></script>
        <script src="recursos/javaScript/JS-AJAX/personaJS.js" type="text/javascript"></script>
        <script src="recursos/javaScript/JS-AJAX/pais.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/estilos/administrador.css" rel="stylesheet" type="text/css"/>
        
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">               
        <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@500&display=swap" rel="stylesheet">
 <link rel="icon" href="recursos/iconos/Logo_colorido.ico" type="image/x-icon">
      
        <title>Administrador</title>
    </head>
    <body class="" style="background:#E2E2E5 ">        
        <%--<%@include file="plantillas/fondo_decoracion_1.jsp" %>--%>        
            <%@include  file="plantillas/administracion/menu_administracion.jsp" %>
        <div class="row" >         
            <%@include  file="plantillas/administracion/formularios/inicio.jsp" %>
            <%@include  file="plantillas/administracion/formularios/conceptos.jsp" %>
            <%@include  file="plantillas/administracion/formularios/ubicaciones.jsp"%>
            <%@include  file="plantillas/administracion/formularios/persona.jsp" %>
            <%@include  file="plantillas/administracion/formularios/sugerencia.jsp"%>
            <%@include  file="plantillas/administracion/formularios/recursos.jsp"%>
        </div>       
        <%@include file="plantillas/administracion/formularios/discapacidades.jsp" %>
    </body>
     
</html>
