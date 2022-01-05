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
            <%@include  file="plantillas/recursos/card_recursos.jsp" %>
            <%@include  file="plantillas/recursos/buscador_recuros.jsp" %>
        </div>
        <div class="row  pr-5" style="padding-left:100px">
            <div class="col-lg-2">
                <div class="card p-0 m-0 infoCar">
                    <div class="card-header p-1 m-1">
                        <h5><span class="bi bi-info-square-fill"></span> Filtros </h5>
                    </div>
                    <div class="card-body p-0 m-0">
                        <%@include  file="plantillas/recursos/filtros.jsp" %>
                    </div>                   
                    <div class="card-footer">
                        <input class="btn btn-sm btn-block login_color infoCar " value="Aplicar filtro" type="button" >  
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="card-group ">
                    <div class="card infoCar">                        
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                    <div class="card infoCar">                        
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                    <div class="card infoCar">                       
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                 <div class="card-group">
                    <div class="card infoCar">                        
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                    <div class="card infoCar">                        
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                    <div class="card infoCar">                       
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
       
            </div>
        </div>     

    </body>
</html>
