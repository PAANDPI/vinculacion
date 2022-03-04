<%-- 
    Document   : conocenos
    Created on : 10-feb-2022, 5:35:17
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="recursos/iconos/Logo_colorido.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>

        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
      <title>F&C - Conócenos</title>
            <style>
                    .bn{
                        -webkit-filter: grayscale(100%);
                        filter: grayscale(100%);
                        border-radius: 200px;
                    }
                  
                </style>
    </head>
    <body >
        <div class="mb-5" style="width: 100%; height: 100vh; background: #fff url(recursos/imagenes/Sintítulo-1.png) center center/cover no-repeat; ">

            <%@include  file="plantillas/menu_conocenos.jsp"%>

            <div  style="width: 100%; position: absolute; bottom: 10px;">
                <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                    <h1 class="text-center"  style="font-size: 70px;font-weight: bold;"><b>F&C</b></h1>
                    <h2 class="text-center" style="color: #2F2F2F; font-size: 17px">
                        Tecnologías de la Información y Comunicación enfocadas a la  discapacidad en la zona de influencia de la UTEQ.</h2>
                    <div class="container">
                        <p class="text-center pr-5 pl-5" style="font-size: 16px;color: gray">                        
                            Es un proyecto de vinculación con la comunidad de la carrera de Ingeniería en Sistemas/Software de la Facultad de Ciencias
                            de la Ingeniería de la Universidad Técnica Estatal de Quevedo (UTEQ). Inició su ejecución en mayo de 2021,
                            bajo la dirección de Orlando Erazo y con la colaboración de Mercedes Moreira.                    
                        </p>
                    </div>

                </div>

            </div>

        </div> 
        <div  style="background: white;">
            <div class="container">
                <div class="row " >
                    <div class="col-lg-6 pl-2 pr-5">
                        <img style="width: 100%; height: 90%" src="recursos/imagenes/Herramientas.png" alt=""/>
                    </div>
                    <div class="col-lg-6 ">
                        <h3 class="text-center" style="color: #2F2F2F; font-size: 17px">Objetivo General</h3> 
                        <p class="text-justify" style="font-size: 16px;color: gray">Ofrecer herramientas de tecnologías de la información y comunicación a la comunidad de personas con discapacidad de la zona de influencia de la Universidad Técnica Estatal de Quevedo que les permitan acercarse más a su uso en su vida cotidiana.</p>
                        <h3 class="text-center" style="color: #2F2F2F; font-size: 17px" >Objetivos Específicos</h3> 
                        <ul>
                            <li><p class="text-justify" style="font-size: 16px;color: gray">Implementar un sitio web que contenga información y acceso a recursos sobre distintos tipos de discapacidad aplicando recomendaciones de accesibilidad web, de manera que puedan ser usados por personas con discapacidad, personas cercanas o relacionadas a ellos, u otras personas interesadas de acuerdo a las condiciones del caso.</p></li>
                            <li><p class="text-justify" style="font-size: 16px;color: gray" >Construir aplicaciones de TIC que puedan ser usadas por personas con discapacidad aplicando los criterios de accesibilidad que correspondan.</p></li>
                            <li><p class="text-justify" style="font-size: 16px;color: gray" >Capacitar a distintos tipos de involucrados de acuerdo a los productos compilados, productos desarrollados o prácticas adquiridas con fines de aprendizaje y/o difusión.</p></li>
                        </ul>
                    </div>
                </div>
            
            </div>
               
        </div>         
        <%@include  file="plantillas/footer_conocenos.jsp"%>
</body>
</html>
