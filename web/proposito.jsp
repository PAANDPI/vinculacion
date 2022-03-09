<%-- 
    Document   : proposito
    Created on : 03-mar-2022, 16:20:48
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="recursos/iconos/Logo_colorido.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>

        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">  
        <title>Yuyapuy - Yuyapuy</title>
    </head>
    <body>


        <%@include  file="plantillas/menu.jsp" %> 

        <div class="container">
            <div class="row  " >
                <div class="col-lg-12 d-flex justify-content-center ">
                    <img style="width: 35%;" src="recursos/imagenes/Logo_colorido.png" alt=""/>
                </div>
                <div class="col-lg-12 ">
                    <h5 class="text-center"  style="font-size: 35px;font-weight: bold;">
                        <b>¿QUÉ ES YUYAPUY?</b>
                    </h5>                   
                    <p class="text-center pt-3 pl-5 pr-5" style="font-size: 16px;">
                        YUYAPUY es un proyecto social desarrollado con el objetivo de proporcionar
                        información sobre discapacidad. Tiene tres secciones principales: buscador
                        de discapacidades, recursos didácticos y mapa informativo. Acceda a las 
                        siguientes opciones para conocer toda la información disponible.</p>
                </div>
            </div>

            <h5 class="text-center mb-5 mt-5 pt-2 "  style="font-size: 25px;font-weight: bold;">
               
            </h5>
            <div class="row justify-content-center">   
                <div class="col-lg-4">
                    <div class="card infoCar" >
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold text-center">BUSCADOR YUYAPUY</h5>
                            <p class="card-text text-center">Permite a las personas acceder a información sobre las discapacidades</p>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card infoCar" >
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold text-center">RECURSOS YUYAPUY</h5>
                            <p class="card-text text-center">Compartir recurso y contenido informatico y educativo sobre discapacidades</p>
                        
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card infoCar" >
                        <div class="card-body">
                            <h5 class="card-title font-weight-bold text-center">MAPA YUYAPUY</h5>
                            <p class="card-text text-center">Publicar ubicaciones y lugares para personas con discapacidades</p>
                          
                        </div>
                    </div>
                </div>
            </div>
            <h5 class="text-center mb-5 mt-5 pt-5 "  style="font-size: 25px;font-weight: bold;">
                <b>DESARROLLADORES</b>
            </h5>

        </div>
        <div class="row d-flex justify-content-center">               
            <div class=" d-flex flex-column  mt-5  col-lg-2 col-sm-12">

                <img class="rounded-circle bn m-auto" src="recursos/conocenos/colaboradores/espin.png" style="width: 150px; height: 150px;  box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%);">
                <label class=" text-center font-weight-bold">Luis Miguel Espin Carrascos</label>

            </div> 
            <div class=" d-flex flex-column  mt-5  col-lg-2 col-sm-12 ">                       
                <img class="rounded-circle bn m-auto" src="recursos/conocenos/colaboradores/ariel.png" style="width: 150px; height: 150px;  box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%); ">
                <label class="text-center font-weight-bold">Ariel Owaldo Fernández Loor</label>              
            </div>
            <div class="d-flex flex-column  mt-5  col-lg-2 col-sm-12 "> 
                <img class="rounded-circle bn m-auto" src="recursos/conocenos/colaboradores/Francisco.jpg" style="width: 150px; height: 150px;  box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%);"><br>
                <label class="text-center font-weight-bold">Francisco Simón Moreira García</label>
            </div>
            <div class="d-flex flex-column  mt-5  col-lg-2 col-sm-12 ">

                <img class="rounded-circle bn m-auto" src="recursos/conocenos/colaboradores/Michelle.jpeg" style="width: 150px; height: 150px;  box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%); "><br>
                <label class="text-center font-weight-bold">Doris Michelle Solano Chico</label>

            </div>
            <div class="d-flex flex-column  mt-5  col-lg-2 col-sm-12 "> 
                <img class="rounded-circle bn m-auto" src="recursos/conocenos/colaboradores/Dayana.jpeg" style="width: 150px; height: 150px;  box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%);"><br>
                <label class="text-center font-weight-bold">Dayana Lizzet Velez Araujo </label>             
            </div>
        </div>
    </div>
    <%@include  file="plantillas/footer.jsp" %>   
    <%@include  file="plantillas/menu_accesibilidad.jsp" %>  
</body>
</html>
