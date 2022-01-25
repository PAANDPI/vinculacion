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
         <link rel="icon" href="recursos/iconos/Logo_colorido.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="recursos/javaScript/JS-AJAX/buscador.js" type="text/javascript"></script>

        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">        
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Archivo+Black&family=Bebas+Neue&family=Pacifico&display=swap" rel="stylesheet">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
        .sombra
        {

            -webkit-box-shadow: 0px 0px 23px 0px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 0px 23px 0px rgba(0,0,0,0.75);
            box-shadow: 0px 0px 23px 0px rgba(0,0,0,0.75);
        }
    </style>
    <body>      
        <%@include file="plantillas/menu.jsp" %>    
        <%@include file="plantillas/buscador/buscador.jsp" %>  
                <div id="informacionBusqueda" class="pt-5 ">
        <%@include file="plantillas/buscador/informacion.jsp" %>  
        </div>
        <div id="resultadosBusqueda" class="mt-3">
            <div class="container"> <label class="font-weight-bold">Total de resultados: <span id="numeroResultado"></span></label></div>
            <div id="accordionResultante" class="container">
                    
            </div>
        </div>

        <%@include  file="plantillas/footer.jsp" %>   
        <%@include  file="plantillas/menu_accesibilidad.jsp" %>  
    </body>    
</html>
