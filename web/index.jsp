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
    <body class=>
        <%@include  file="plantillas/menu.jsp" %>               
        <%--<%@include file="plantillas/principal/servicios.jsp" %>--%> 
        <!--Recursos-->
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
                
        <div class="container p-5">
            <div class="row">
                <div class="col-lg-12 " >
                    <h3 style="position: absolute; left:30px; top: 80px; " class="blanco" >Recursos para personas <br>con discapacidad</h3>                   
                    <p  class="blanco" style="position: absolute; left:30px; top: 200px; " >
                        Encuentra recursos que pueden ayudar su seres queirdos a tener <br>
                        una mejor calidad de vida. Se encuentran disponibles <br>
                        videos, audios, conferencias,grupos, <br>
                        imagenes y juegos educativos.
                    </p>
                    <img class="sombra" style="  width: 100%; height:500px; " src="recursos/imagenes/FOTO_1.png" alt=""/>       
                    <div><a href="buscador.jsp" style="position: absolute; bottom: 10px;  " class="btn blanco efec " >  Ir al buscador <span class="bi bi-arrow-right"></span></a></div>
                </div>                
            </div> 
            
            <div class="row mt-5">
                <div class="col-lg-12 " >
                    <h3 style="position: absolute; right: 30px; top: 80px; " class="blanco text-right" >Recursos para personas <br>con discapacidad</h3>                   
                    <p  class="blanco text-right" style="position: absolute; right: 30px; top: 200px; " >
                        Encuentra recursos que pueden ayudar su seres queirdos a tener <br>
                        una mejor calidad de vida. Se encuentran disponibles <br>
                        videos, audios, conferencias,grupos, <br>
                        imagenes y juegos educativos.
                    </p>
                    
                    <img class="sombra" style="  width: 100%; height:500px; " src="recursos/imagenes/FOTO_2.jpg" alt=""/>       
                    <div><a href="buscador.jsp" style="position: absolute; bottom: 10px; right: 10px " class="btn blanco efec " ><span class="bi bi-arrow-right"></span>  Ir al buscador </a></div>
                </div>                
            </div> 
           
            <div class="row mt-5">
                <div class="col-lg-12 " >
                    <h3 style="position: absolute; left:30px; top: 80px; " class="blanco" >Recursos para personas <br>con discapacidad</h3>                   
                    <p  class="blanco" style="position: absolute; left:30px; top: 200px; " >
                        Encuentra recursos que pueden ayudar su seres queirdos a tener <br>
                        una mejor calidad de vida. Se encuentran disponibles <br>
                        videos, audios, conferencias,grupos, <br>
                        imagenes y juegos educativos.
                    </p>
                    <img class="sombra" style="  width: 100%; height:500px; " src="recursos/imagenes/FOTO_3.jpg" alt=""/>       
                    <div><a href="buscador.jsp" style="position: absolute; bottom: 10px;  " class="btn blanco efec " >  Ir al buscador <span class="bi bi-arrow-right"></span></a></div>
                </div>                
            </div> 
        </div>
        
        
        
    </body>
</html>
