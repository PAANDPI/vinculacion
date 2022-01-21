<%-- 
    Document   : recursos
    Created on : 30-nov-2021, 19:55:31
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Recursos</title>
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">        
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Archivo+Black&family=Bebas+Neue&family=Pacifico&display=swap" rel="stylesheet">
    </head>
    <body >

        <%@include file="plantillas/menu.jsp" %>  
        <%@include  file="plantillas/menu_accesibilidad.jsp" %>  
        <div class="container mt-5">
            <h1 class="text-center">BUSCADOR DE RECURSOS</h1>
          
            <div class="text-center" style="color: gray;">En esta sección se comparte recursos digitales agrupados por cada tipo de discapacidad</div>
            <hr style="background: gainsboro">
<!--            <label class="font-weight-bold">Selecciones la categoría:</label>-->
            <%@include  file="plantillas/recursos/card_recursos.jsp" %>  
            <%@include  file="plantillas/recursos/buscador_recuros.jsp" %>
           
           <hr style="background: gainsboro">
            <label class="font-weight-bold">Contenido resultante:</label>
        </div>
        <div class="row  pr-lg-5 pr-md-5 pr-xl-3 pl-lg-5 pl-md-2 pl-xl-1" style="z-index: 1" >
            <div class="col-lg-12 col-md-12">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Special title treatment</h5>
                                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Special title treatment</h5>
                                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                         <div class="col-sm-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Special title treatment</h5>
                                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                         <div class="col-sm-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Special title treatment</h5>
                                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>     

    </body>
</html>
