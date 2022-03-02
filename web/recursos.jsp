<%-- 
    Document   : recursos
    Created on : 30-nov-2021, 19:55:31
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link rel="icon" href="recursos/iconos/Logo_colorido.ico" type="image/x-icon">
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
         <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <title>Recursos</title>
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">        
        <link href="https://fonts.googleapis.com/css2?family=Anton&family=Archivo+Black&family=Bebas+Neue&family=Pacifico&display=swap" rel="stylesheet">
    </head>
    <body >

        <%@include file="plantillas/menu.jsp" %>  
        
  
        <div class="container  mt-5">
            <div class="row flex-row justify-content-center align-content-center">
                  <img width="240" height="210"  src="recursos/imagenes/Logo_colorido.png" alt=""/>
            </div>          
            <h1 class="text-center">BUSCADOR DE RECURSOS</h1>         
            <div class="text-center" style="color: gray;">En esta sección se comparte recursos digitales agrupados por cada tipo de discapacidad</div>
            <hr style="background: gainsboro">
            <%@include  file="plantillas/recursos/buscador_recuros.jsp" %>
           
           <hr style="background: gainsboro">
            <label class="font-weight-bold">Contenido resultante:</label>
        </div>
  
            
        <div class="row  pr-lg-5 pr-md-5 pr-xl-3 pl-lg-5 pl-md-2 pl-xl-1" style="z-index: 1" >
            <div class="col-lg-12 col-md-12 ">
                <div class="container">
                   
                        <div class="card-columns pt-5 pb-5" id="tbl_recursos">
                            
                        </div>
                 
                </div>
            </div>
        </div>  
            <%@include  file="plantillas/footer.jsp" %>  
            <%@include  file="plantillas/menu_accesibilidad.jsp" %>  
    </body>
      
   
    <script src="recursos/javaScript/JS-AJAX/buscadorRecursos.js" type="text/javascript"></script>
</html>
