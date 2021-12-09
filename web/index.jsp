<%-- 
    Document   : index
    Created on : 22-nov-2021, 17:32:52
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
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>

        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">        
        <link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@500&display=swap" rel="stylesheet">
    </head>
     
    <style>
        .sombra
        {
            
            -webkit-box-shadow: 0px 0px 23px 0px rgba(0,0,0,0.75);
            -moz-box-shadow: 0px 0px 23px 0px rgba(0,0,0,0.75);
            box-shadow: 0px 0px 23px 0px rgba(0,0,0,0.75);
        }
        .efec
        {
            background: rgba(255,255,255,0.1); 
        }
    </style>
    
    <body class=>
      
        <%@include  file="plantillas/menu.jsp" %>     
        <img src="recursos/portada.png" alt=""/>
<!--        <div class="color_base" style="background: ">
            
        </div>-->
<!--          <img   src="recursos/imagenes/inicio.jpg" alt=""/>-->
        <%@include file="plantillas/principal/servicios.jsp" %> 
<!--        <img src="recursos/imagenes/FOTO_2.jpg" alt=""/>
        <img src="recursos/imagenes/FOTO_1.png" alt=""/>
        <img src="recursos/imagenes/FOTO_3.jpg" alt=""/>-->
        <div class="color_base p-5 " style="height: 300px">
          
            <h2 class="blanco text-center">Colaboradores</h2>
            <div class="flex-column">
                <img style="width: 120px; height: 150px" src="recursos/iconos/i_2019.png" alt=""/>
                <img class="ml-2" style="width: 180px; height: 150px" src="recursos/iconos/descarga.png" alt=""/>
            </div>
        </div> 
    </body>
   

</html>
