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

    </head>

    <style>
        body
        {
            overflow-x: hidden;
        }
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
        .degradado
        {
            width: 100%;
            height: auto;
            background: rgb(11,48,73);
            background: linear-gradient(180deg, rgba(11,48,73,1) 0%, rgba(66,125,164,1) 68%, rgba(65,122,159,1) 100%);
        }
    </style>

    <body>

        <%@include  file="plantillas/menu.jsp" %>     

        <div class="degradado mb-3">
            <div class="container blanco">
                <div class="row flex-column-reverse flex-lg-row justify-content-center">
                    <div class="col-lg-6 col-sm-12 col-xm-12 p-5 centrar_objeto ">                        
                        <label class="" style="font-size: 20px">Conocimiento y buen vivir</label>
                        <label class="font-weight-bold" style="font-size: 45px" >¿Tiene curiosidad sobre las discapacidades?</label>
                        <p class="pt-2" style="font-size: 25px">Puede acceder a recursos y conceptos que le pueden ayudar a entender sobre las discapacidades.</p>           
                    </div>
                    <div class="col-lg-6 col-sm-12 col-xm-12 p-5 ">
                        <div class="row  flex-column"> 
                            <img class="m-auto" style="width: 40vh; height: 40vh" src="recursos/imagenes/Logo_colorido.png" alt=""/>                                                                                                                                 
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <div class="container mb-5">
            <div class="row container" >
                <div class="col-lg-12 ">
                    <label style="font-size: 45px" class="font-weight-bold ">Principales funciones de YUYAPUY </label> 
                    <p>YUYAPUY cuenta con tres funciones principales en las que destacan un buscador para conocer sobre 
                        las discapacidades, una sección de recursos para obtener materiales que podrian ser utiles para las discapacidades y
                        un mapa para buscar lugares que podrian ayudar a las personas con discapacidad.</p>
                </div>
            </div>
        </div>
        <%@include file="plantillas/principal/servicios.jsp" %> 

        <div class="mt-5 degradado " >  
            <div class="container p-4">
                <div class="row">              
                    <div class="col-sm-12 col-md-6 blanco">
                        <h5 class="font-weight-bold">Colaboradores</h5>
                        <img style="width: 200px; height: 220px" src="recursos/iconos/i_2019.png" alt=""/>
                        <img src="recursos/iconos/descarga.png" alt=""/>
                    </div>
                    <div class="col-xs-6 col-md-3 blanco">
                        <h5>Servicios</h5>
                        <ul style="list-style:none;" class="footer-links     ">
                            <li><a class="btn p-0 m-0 blanco " href="#">Inicio</a></li>
                            <li><a class="btn p-0 m-0 blanco"  href="#">Buscador</a></li>
                            <li><a class="btn p-0 m-0 blanco" href="#">Mapa</a></li>
                            <li><a class="btn p-0 m-0 blanco" href="#">Buscador</a></li>
                            <li><a class="btn p-0 m-0 blanco" href="#">Eventos</a></li>
                            <li><a class="btn p-0 m-0 blanco" href="#">Noticias</a></li>
                            <li><a class="btn p-0 m-0 blanco" href="#">Conócenos</a></li>
                            <li><a class="btn p-0 m-0 blanco" href="#">Identificate</a></li>
                        </ul>
                    </div>

                    <div class="col-xs-6 col-md-3 blanco">
                        <h5>Enlaces de interés</h5>
                        <ul style="list-style:none;" class="footer-links">
                            <li><a  class="btn p-0 m-0 blanco" href="#">Ces</a></li>
                            <li><a  class="btn p-0 m-0 blanco" href="#">SENESCYT</a></li>
                            <li><a  class="btn p-0 m-0 blanco" href="#">IECE</a></li>
                            <li><a  class="btn p-0 m-0 blanco" href="#">SNI</a></li>
                            <li><a  class="btn p-0 m-0 blanco" href="#">SERCOP</a></li>
                            <li><a  class="btn p-0 m-0 blanco" href="#">CEDIA</a></li>
                            <li><a  class="btn p-0 m-0 blanco" href="#">SRI</a></li>
                        </ul>
                    </div>
                </div>
              
            </div>
            <div class="container" >
                <div class="row" style="border-top: 5px solid white">
                    <div class="col-md-8 col-sm-6 col-xs-12 blanco">
                        <p class="copyright-text">Copyright &copy; 2021 derecho reservados a UTEQ</p>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">

                    </div>
                </div>
            </div>                
        </div> 
    </body>
</html>
