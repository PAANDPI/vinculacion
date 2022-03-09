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
         <link rel="icon" href="recursos/iconos/Logo_colorido.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
            <meta name="keywords" content="uteq, yuyapuy, fic, cuidar, discapacidad, discapacidades"/>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
   
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">        

    </head>

    <style>
        body
        {
            overflow-x: hidden;
        }

    </style>

    <body >

        <%@include  file="plantillas/menu.jsp" %>     

        <div class="degradado mb-3 sombra" >
            <div  class="container blanco encabezado">
                <div class="row flex-column-reverse flex-lg-row justify-content-center">
                    <div class="col-lg-6 col-sm-12 col-xm-12 p-5 centrar_objeto ">                        
                        <label class="" style="font-size: 20px">Conocimiento y buen vivir</label>
                        <label class="font-weight-bold" style="font-size: 45px" >¿Tiene curiosidad sobre las discapacidades?</label>
                        <p class="pt-2" style="font-size: 25px">Puede acceder a recursos y conceptos que le pueden ayudar a entender sobre las discapacidades.</p>           
                    </div>
                    <div class="col-lg-6 col-sm-12 col-xm-12 p-5 ">
                        <div class="row  flex-column"> 
                            <img class="m-auto" style="width: 100%; height: 40%" src="recursos/imagenes/ninios_estudiando.png" alt=""/>                                                                                                                                 
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <div class="container headline mb-5">
<!--            <div class="row container" >
                <div class="col-lg-12 ">
                    <label style="font-size: 45px" class="font-weight-bold ">Funciones de YUYAPUY </label> 
                    <p>YUYAPUY es un proyecto social con el objetivo de mantener informado a grupos de atención 
                        prioritaria, tiene tres secciones principales: buscador de discapacidades, recursos
                        didácticos y mapa informativo, acceda a las siguientes opciones para conocer toda la 
                        información disponible: </p>

                </div>
            </div>-->
        </div>             
        <%@include file="plantillas/principal/servicios.jsp" %> 

        
        
        <%@include  file="plantillas/footer.jsp" %>  

        <%@include  file="plantillas/menu_accesibilidad.jsp" %>  




    </body>
     
      
        
</html>
