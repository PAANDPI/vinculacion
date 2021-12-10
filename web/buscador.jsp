<%-- 
    Document   : buscador
    Created on : 23-nov-2021, 19:44:10
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Principal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">        
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Archivo+Black&family=Bebas+Neue&family=Pacifico&display=swap" rel="stylesheet">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
       #fondo_defuminado
        {
            width: 100%;
            height: auto;    
            background-image: url("recursos/fondo_difuminado.png");           
            background-size:auto ;            
            z-index: 6;
        }
    </style>
    <body> 
       
        
        <%@include file="plantillas/menu.jsp" %> 
        <%--<%@include file="plantillas/fondo_decoracion_buscador.jsp" %>--%>     
        <%@include file="plantillas/buscador/buscador.jsp" %>       
     
        <%@include file="plantillas/buscador/informacion.jsp" %>  
       
        <div class="row " style="background: #0B3049; height: 200px">
        </div>
    </body>    
</html>
