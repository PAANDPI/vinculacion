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
        <meta name="keywords" content="uteq, yuyapuy, fic, cuidar, discapacidad, discapacidades"/>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>


        <link href="recursos/estilos/conocenos.css" rel="stylesheet" type="text/css"/>
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
        <title>F&C - Conócenos</title>
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
            .efe:hover
            {    
                cursor:pointer;
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
    </head>
    <body>

        <%@include  file="plantillas/menu_conocenos.jsp"%>   
        <div class=" mb-5 contenidoconocenos   justify-content-center d-none d-sm-none d-md-flex" >   
            <div class="container">
                <div class="row d-flex flex-wrap mt-2 justify-content-center">
                    <div style="width: auto" class=" m-1 p-0">

                        <div class=" efe pr-1 pl-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4); 
                             box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4);">
                            <a href="aplicaciones.jsp" target="_blank" class="font-weight-bold blanco text-justify ">
                                <img style="width: 50px; height: 50px; "src="recursos/imagenes/PetFriend21.PNG" alt=""/>
                                PetFriend21
                            </a>                           
                        </div>                            

                    </div>
                    <div style="width: auto" class=" m-1 p-0">

                        <div class=" efe pr-3 pl-1 pt-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4); 
                             box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4);">
                            <a href="index.jsp" target="_blank" class="font-weight-bold blanco text-justify ">
                                <img style="width: 40px; height: 40px; background: white" class="rounded-circle" src="recursos/imagenes/Logo_colorido.png" alt=""/>
                                Yuyapuy                               
                            </a> 
                        </div>                            

                    </div>
                    <div style="width: auto" class="m-1 p-0">

                        <div class=" efe pr-3 pl-3 pt-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4); 
                             box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4);">
                            <a href="http://fyc.uteq.edu.ec:8080/jit/" target="_blank" class="font-weight-bold blanco text-justify ">
                                <img style="width: 40px; height: 40px" class="rounded-circle" src="recursos/imagenes/JIT.PNG" alt=""/>
                                JIT (Juegos)
                            </a>
                        </div>                            

                    </div>
                    <div style="width: auto" class=" m-1 p-0">

                        <div class=" efe pr-3 pl-3 pt-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4); 
                             box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4);">
                            <a href="http://fyc.uteq.edu.ec:3000/" target="_blank" class="font-weight-bold blanco text-justify ">
                                <img style="width: 40px; height: 40px; background: white" class="rounded-circle" src="recursos/imagenes/micro.png" alt=""/>
                                Titopi
                            </a>
                        </div>                            

                    </div>
                    <div style="width: auto" class=" m-1 p-0">

                        <div class=" efe pr-3 pl-3 pt-1 pb-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4); 
                             box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4);">
                            <a href="aplicaciones.jsp" target="_blank" class="font-weight-bold blanco text-justify ">
                                <img style="width: 40px; height: 40px; background: white" class="rounded-circle" src="recursos/imagenes/Logo v2.png" alt=""/>
                                Money Game </a>
                        </div>                            

                    </div>
                    <div style="width: auto" class=" m-1 p-0">

                        <div class=" efe pr-3 pl-3 pt-1 pb-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4); 
                             box-shadow: inset 2px 1px 22px -2px rgba(255,255,255,0.4);">
                            <a href="aplicaciones.jsp" target="_blank" class="font-weight-bold blanco text-justify ">
                                <img style="width: 40px; height: 40px; background: white" class="rounded-circle" src="recursos/imagenes/logo_tulang.png" alt=""/>
                                ToLan
                            </a>
                        </div>                            

                    </div>

                </div>

            </div>




            <div class="caja-contenido " >
                <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                    <h1 class="text-center mb-2"  style="font-size: 70px;font-weight: bold;"><b>F&C</b></h1>
                    <h2 class="text-center" style="color: #2F2F2F; font-size: 17px">
                        Tecnologías de la Información y Comunicación enfocadas a la  discapacidad en la zona de influencia de la UTEQ</h2>
                    <div class="container">
                        <p class="text-center pr-lg-5 pl-lg-5 pr-sm-0 pl-sm-0" style="font-size: 16px;color: gray">                        
                            Es un proyecto de vinculación con la comunidad de la carrera de Ingeniería en Sistemas/Software de la Facultad de Ciencias
                            de la Ingeniería de la Universidad Técnica Estatal de Quevedo (UTEQ). Inició su ejecución en mayo de 2021,
                            bajo la dirección de Orlando Erazo y con la colaboración de Mercedes Moreira.                    
                        </p>
                    </div>
                </div>
            </div>                    
        </div> 

        <div class="mb-5 justify-content-center d-block d-sm-flex d-md-none"> 
            <img class="w-100" src="recursos/imagenes/Sintítulo1.png" alt=""/>
            <div class="container">
                <h2 class="text-center font-weight-boldN"><b>HERRAMIENTAS  F&C</b></h2>
                <div class="row d-flex pl-3 pr-3 flex-wrap mt-2 justify-content-center">

                    <div style="width: auto" class=" m-1 p-0">
                        <a href="aplicaciones.jsp" target="_blank">
                            <div class=" efe pr-1 pl-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4); 
                                 box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4);">
                                <img class="" style="width: 50px; height: 50px; " src="recursos/imagenes/PetFriend21.PNG" alt=""/>
                            </div>   
                        </a>                                                 
                    </div>
                    <div style="width: auto" class=" m-1 p-0">
                        <a href="index.jsp" target="_blank">
                            <div class=" efe pr-2 pl-2 pt-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4); 
                                 box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4);">
                                <img style="width: 40px; height: 40px; background: white" class="rounded-circle" src="recursos/imagenes/Logo_colorido.png" alt=""/>
                            </div>                            
                        </a> 
                    </div>
                    <div style="width: auto" class="m-1 p-0">
                        <a href="http://fyc.uteq.edu.ec:8080/jit/" target="_blank">
                            <div class=" efe pr-2 pl-2 pt-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4); 
                                 box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4);">
                                <img style="width: 40px; height: 40px" class="rounded-circle" src="recursos/imagenes/JIT.PNG" alt=""/>
                            </div>  
                        </a>
                    </div>
                    <div style="width: auto" class=" m-1 p-0">
                        <a href="http://fyc.uteq.edu.ec:3000/" target="_blank">
                            <div class=" efe pr-2 pl-2 pt-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4); 
                                 box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4);">
                                <img style="width: 40px; height: 40px; background: white" class="rounded-circle" src="recursos/imagenes/micro.png" alt=""/>
                            </div> 
                        </a>                                                   
                    </div>
                    <div style="width: auto" class=" m-1 p-0">
                        <a href="aplicaciones.jsp" target="_blank">
                            <div class=" efe pr-2 pl-2 pt-1 pb-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4); 
                                 box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4);">
                                <img style="width: 40px; height: 40px; background: white" class="rounded-circle" src="recursos/imagenes/Logo v2.png" alt=""/>
                            </div>                            
                        </a>

                    </div>
                    <div style="width: auto" class=" m-1 p-0">
                        <a href="aplicaciones.jsp" target="_blank">
                            <div class=" efe pr-2 pl-2 pt-1 pb-1 bote" style="height: 50px;-webkit-box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4); 
                                 box-shadow: inset 2px 1px 22px -2px rgba(0,0,0,0.4);">
                                <img style="width: 40px; height: 40px; background: white" class="rounded-circle" src="recursos/imagenes/logo_tulang.png"  alt=""/>

                            </div>                            
                        </a>
                    </div>

                </div>
            </div>

            <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                <h1 class="text-center"  style="font-size: 70px;font-weight: bold;"><b>F&C</b></h1>
                <h2 class="text-justify" style="color: #2F2F2F; font-size: 20px">
                    Tecnologías de la Información y Comunicación enfocadas a la  discapacidad en la zona de influencia de la UTEQ.</h2>
                <div class="container">
                    <p class="text-justify pr-lg-5 pl-lg-5 pr-sm-0 pl-sm-0" style="font-size: 20px;color: gray">                        
                        Es un proyecto de vinculación con la comunidad de la carrera de Ingeniería en Sistemas/Software de la Facultad de Ciencias
                        de la Ingeniería de la Universidad Técnica Estatal de Quevedo (UTEQ). Inició su ejecución en mayo de 2021,
                        bajo la dirección de Orlando Erazo y con la colaboración de Mercedes Moreira.                    
                    </p>
                </div>
            </div>

        </div>

        <div class="row mb-5 justify-content-center align-content-center" >
            <div class="col-sm-12">
                <h1 class="text-center"  style="font-size: 30px;font-weight: bold;"><b>NOVEDADES DE F&C</b></h1>
                <p class="text-center pr-lg-5 pl-lg-5 pr-sm-0 pl-sm-0" style="font-size: 16px;color: gray">                        
                    Le invitamos a conocer las novedades de F&C
                </p>
            </div>

            <div class="col-sm-12 col-md-5 pl-sm-2 pr-sm-2">
                <div id="carouselExampleIndicators" class="carousel slide w-100 rounded" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100 " style="border-radius: 50px" src="recursos/imagenes/1.png" alt="First slide">
                            <div class="carousel-caption d-none d-md-block">
                            </div>
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100 " style="border-radius: 50px" src="recursos/imagenes/2.png" alt="First slide">
                            <div class="carousel-caption d-none d-md-block">
                            </div>
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100 " style="border-radius: 50px" src="recursos/imagenes/3.png" alt="First slide">
                            <div class="carousel-caption d-none d-md-block">
                            </div>
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100 " style="border-radius: 50px" src="recursos/imagenes/4.png" alt="First slide">
                            <div class="carousel-caption d-none d-md-block">
                            </div>
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100 " style="border-radius: 50px" src="recursos/imagenes/Juegos.png" alt="First slide">
                            <div class="carousel-caption d-none d-md-block">
                            </div>
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100 " style="border-radius: 50px" src="recursos/imagenes/Musica.png" alt="Second slide">
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100 " style="border-radius: 50px" src="recursos/imagenes/Imagenes.png" alt="Second slide">
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100" style="border-radius: 50px" src="recursos/imagenes/Videos.png" alt="Second slide">
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100 " style="border-radius: 50px" src="recursos/imagenes/pagina.png" alt="Third slide">
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100 " style="border-radius: 50px" src="recursos/imagenes/Archivo.png" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>  
            </div>

        </div>


        <div class="container">
            <div class="row  mt-5" >
                <div class="col-sm-12">
                    <h1 class="text-center"  style="font-size: 30px;font-weight: bold;"><b>OBJETIVOS DE F&C</b></h1>
                    <p class="text-center pr-lg-5 pl-lg-5 pr-sm-0 pl-sm-0" style="font-size: 16px;color: gray">                        

                    </p>
                </div>
                <div class="col-lg-6 ">
                    <img style="width: 100%;" src="recursos/imagenes/Herramientas.png" alt=""/>
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
        <%@include  file="plantillas/footer_conocenos.jsp"%>

    </body>
    <script src="recursos/javaScript/carrucel.js" type="text/javascript"></script>
</html>
