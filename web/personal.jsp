<%-- 
    Document   : colaboradores
    Created on : 16-feb-2022, 21:08:43
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>

        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
        <title>F&C - Personal</title>
    </head>
    <style>
        .bn{
            -webkit-filter: grayscale(100%);
            filter: grayscale(100%);
            border-radius: 200px;
        }
        .caja-contenido
        {
            width: 60%; position: absolute; bottom: -26px; 
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
    <body >
        <%@include  file="plantillas/menu_conocenos.jsp"%>
        <div class=" mb-2 contenidoconocenos   justify-content-center d-none d-sm-none d-md-flex" >  
            <div class="caja-contenido ">
                <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                    <h1 class="text-center"  style="font-size: 70px;font-weight: bold;"><b>PERSONAL</b></h1>
                    <h2 class="text-center font-weight-bold" style="font-size: 150%;font-weight: bold;">
                        <b>DIRIGIDO POR:</b></h2>
                    <div class="container">
                        <p class="text-center pr-5 pl-5" style="font-size: 16px;color: gray">                        
                            Orlando Erazo  <br>
                            Mercedes Moreira<br>                    
                        </p>
                    </div>
                </div>  
            </div>
        </div> 
        <div class="mb-5 justify-content-center d-block d-sm-flex d-md-none"> 
            <img class="w-100" src="recursos/imagenes/Sintítulo1.png" alt=""/>
            <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                <h1 class="text-center"  style="font-size: 30px;font-weight: bold;"><b>PERSONAL</b></h1>
                <h2 class="text-center font-weight-bold"  style="font-size: 150%;font-weight: bold;">
                    <b>DIRIGIDO POR:</b></h2>
            </div>
            <div class="container">
                <p class="text-center pr-5 pl-5" style="font-size: 16px;color: gray">                        
                    Orlando Erazo  <br>
                    Mercedes Moreira<br>                    
                </p>
            </div>
        </div>

        <div class="container" >
            <div class="row  mb-5 justify-content-center">
                <div class=" text-center col-lg-12  ">
                    <h1 class="mb-5  text-center"  style="font-size: 150%;font-weight: bold;"><b>EN LA ADMINISTRACIÓN DE:</b></h1>  
                </div>
                <div class=" mb-4 text-center col-lg-4  ">
                    Eduardo Díaz<br>
                    (Rector)</div>

                <div class="  mb-4 text-center col-lg-4  ">
                    Jenny Torres<br>
                    (Vicerrectora Académica)</div>

                <div class=" mb-4 text-center col-lg-4  ">
                    Roberto Pico<br>
                    (Vicerrector Administrativo)</div>

                <div class=" mb-4 text-center col-lg-4 ">
                    Henry Alarcón<br>
                    (Director de Vinculación</div>

                <div class=" mb-4 text-center col-lg-4 ">
                    Washington Chiriboga<br>
                    (Decano FCI)</div>

                <div class=" mb-4 text-center col-lg-4 ">
                    Stalin Carreño<br>
                    (Unidad de TIC)</div>


            </div>
        </div>



        <div class="container">
            <div class="row justify-content-center">
                <div class=" text-center col-lg-12  ">
                    <h1 class="mb-1 text-center"  style="font-size: 150%;font-weight: bold;"><b>ESTUDIANTES:</b></h1>
                    <h1  class="mb-5 text-center" style="font-size: 100%;"><b>Segundo  periodo académico 2021-2022:</b></h1>
                </div>



                <div class="m-3 mb-4 text-center col-lg-2 ">Ariel Fernández</div>
                <div class="m-3 mb-4 text-center col-lg-2">Aura Táquez</div>
                <div class="m-3 mb-4 text-center col-lg-2">Bryan Zambrano</div>
                <div class="m-3 mb-4 text-center col-lg-2">Cristhian Burbano</div>
                <div class="m-3 mb-4 text-center col-lg-2">Daniela Moreira</div>
                <div class="m-3 mb-4 text-center col-lg-2">Dayanna Vélez</div>
                <div class="m-3 mb-4 text-center col-lg-2">Deyalit Plaza</div>
                <div class="m-3 mb-4 text-center col-lg-2">Doris Solano</div>
                <div class="m-3 mb-4 text-center col-lg-2">Francisco Moreira</div>
                <div class="m-3 mb-4 text-center col-lg-2">Janer Torrales</div>
                <div class="m-3 mb-4 text-center col-lg-2">Jorge Molina</div>
                <div class="m-3 mb-4 text-center col-lg-2">José García</div>
                <div class="m-3 mb-4 text-center col-lg-2">Josimar Galarza</div>
                <div class="m-3 mb-4 text-center col-lg-2">Kevin Cheves</div>
                <div class="m-3 mb-4 text-center col-lg-2">Luis Espin</div>
                <div class="m-3 mb-4 text-center col-lg-2">Miguel Suárez</div>
                <div class="m-3 mb-4 text-center col-lg-2">Rubén Jaya</div>
                <div class="m-3 mb-4 text-center col-lg-2">Tyrone Tocta</div>
                <div class="m-3 mb-4 text-center col-lg-2">Victor Guillén</div>
                <div class="m-3 mb-4 text-center col-lg-2">Victor Romero</div>
                <div class="m-3 mb-4 text-center col-lg-2">Victor Zapata</div>


            </div>
        </div>

        <div class="container">
            <div class="row align-content-center justify-content-center">
                <div class=" text-center col-lg-12  ">
                    <h1 class="mb-5 mt-5"  style="font-size: 100%;"><b>Primer periodo académico 2021-2022:</b></h1>
                </div>
                <div class="m-3 mb-4 text-center col-lg-2 ">Bryan Mendoza</div>
                <div class="m-3 mb-4 text-center col-lg-2 ">Cristhian Briones </div>
                <div class="m-3 mb-4 text-center col-lg-2 ">Fabricio Baño </div>
                <div class="m-3 mb-4 text-center col-lg-2 ">Germán Álvarez</div>
                <div class="m-3 mb-4 text-center col-lg-2 ">Henry Pérez </div>
                <div class="m-3 mb-4 text-center col-lg-2 ">Ingrid Ortiz</div>
                <div class="m-3 mb-4 text-center col-lg-2 ">John Pincay</div>
                <div class="m-3 mb-4 text-center col-lg-2 ">José Cordero</div>
                <div class="m-3 mb-4 text-center col-lg-2 ">Paola Morales</div>
                <div class="m-3 mb-4 text-center col-lg-2 ">Randy Rodríguez</div>
                <div class="m-3 mb-4 text-center col-lg-2 ">Steven Hurtado</div>
               <div class="m-3 mb-4 text-center col-lg-2 ">Suanny Tigselema</div>                                    
            </div>
        </div>
        <%@include  file="plantillas/footer_conocenos.jsp"%>
    </body>
</html>
