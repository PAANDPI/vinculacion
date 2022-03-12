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
       <title>F&C - Capacitaciones</title>
            <style>
            .bn{
                -webkit-filter: grayscale(100%);
                filter: grayscale(100%);
                border-radius: 200px;
            }
            .caja-contenido
            {
                width: 60%; position: absolute; bottom: -76px; 
            }
            .contenidoconocenos
            {
                width: 100%;
                height: 100vh;
                background: #fff url(recursos/imagenes/Sintítulo1.png) center center/cover no-repeat; 
            }
            #menu-conocenos{
                background: #002C48 !important; z-index: 10;
            }
            .efe
            {    
                color: white;
                height: auto;
                border-radius: 10px;
                background: rgba(185,487,458,0.1)!important;    
                backdrop-filter:blur(5px)!important;

            }
            .bote:hover{
                -webkit-animation: 2s bote 1;
            }
            @-webkit-keyframes bote{
                20%, 50%, 80%{
                    -webkit-transform: translateY(0);
                }
                40%{
                    -webkit-transform: translateY(-10px);

                }
                65%{
                    -webkit-transform: translateY(-10px);

                }
            }

            .doble_click:hover{
                -webkit-animation: 1s dobleclick 1;
            }

            @media screen and (max-width: 480px){
                .caja-contenido
                {
                    width: 100%; position: absolute;top: 0px;border: 1px solid #000 
                }
                .contenidoconocenos
                {
                    width: 100%;                
                    height: 200px;
                    background: #fff url(recursos/imagenes/Sintítulo1.png) center center/cover no-repeat; 
                }
                #menu-conocenos{
                    background: #002C48 !important; 
                }
            }
        </style>
        <style>
            .bn{
                -webkit-filter: grayscale(100%);
                filter: grayscale(100%);
                border-radius: 200px;
            }
             .video
                    {
                        width: 100%; height: 370px;
                        box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%);
                        border-bottom: 10px solid #5BAB90;
                        border-top: 10px solid #5BAB90;
                      
                        -webkit-transition: -webkit-transform .5s cubic-bezier(.19, 1, .22, 1);
                        transition: transform .5s cubic-bezier(.19, 1, .22, 1);
                        transition: transform .5s cubic-bezier(.19, 1, .22, 1),-webkit-transform .5s cubic-bezier(.19, 1, .22, 1);
                        text-decoration: none; 
                    }
        </style>
    </head>
    <body >
        
        <%@include  file="plantillas/menu_conocenos.jsp"%>
        <div class=" mb-2 contenidoconocenos   justify-content-center d-none d-sm-none d-md-flex" >   
               <div  style="width: 100%; position: absolute; bottom: 10px;">
                <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                    <h1 class="text-center"  style="font-size: 30px;font-weight: bold;"><b>CAPACITACIONES IMPARTIDAS</b></h1>
                </div>
            </div>
       </div> 
        
        <div class="mb-2 justify-content-center d-block d-sm-flex d-md-none"> 
            <img class="w-100" src="recursos/imagenes/Sintítulo1.png" alt=""/>
             <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                <h1 class="text-center"  style="font-size: 30px;font-weight: bold;"><b>CAPACITACIONES IMPARTIDAS</b></h1> 
            </div>
        </div>



        <div class="container">
            <div class="row mb-5  pt-1 pb-3">
               
                <div class="col-lg-7 mt-2">
                    <iframe class="video" src="https://www.youtube.com/embed/QryXeEbbRGo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    
                </div>
                <div class="col-lg-5 mt-2">
                    <h3> 1.	Creación de recursos interactivos para necesidades educativas especiales</h3><br>
                    <p>
                        <b> Dirigido a: </b><br>
                        Docentes de la Dirección de Desarrollo Social del GADM de Quevedo..<br>
                        <b >Fecha: </b>  agosto-septiembre de 2021.<br>
                        <b>Facilitadores: </b> Fabricio Baño, Bryan Mendoza.<br>
                    </p>                                                                               
                </div>
                
                
                 <div class="col-lg-7 mt-5">
                     <iframe class="video"  height="315" src="https://www.youtube.com/embed/MsD9No9NZvg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                   
                </div>
                <div class="col-lg-5 mt-5">
                    <h3>2.  Uso de herramientas para la creación de recursos interactivos</h3><br>
                    <p>
                        <b> Dirigido a: </b><br>
                        Técnicos de discapacidad de la Dirección de Desarrollo Comunitario y Gestión Social del Gobierno Autónomo Descentralizado Municipal de El Empalme.<br>
                        <b >Fecha: </b>  diciembre de 2021 – enero de 2022.<br>
                        <b>Facilitadores: </b>  Victor Guillén, Deyalit Plaza.<br>
                    </p>                                                                               
                </div>

            </div>
        </div>

  <%@include  file="plantillas/footer_conocenos.jsp"%>
    </body>
</html>
