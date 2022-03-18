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
        <title>F&C - aplicaciones</title>
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
            .cajas
            {
                width: 100%;
                box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%);                     
                border-radius: 50px;
                -webkit-transition: -webkit-transform .5s cubic-bezier(.19, 1, .22, 1);
                transition: transform .5s cubic-bezier(.19, 1, .22, 1);
                transition: transform .5s cubic-bezier(.19, 1, .22, 1),-webkit-transform .5s cubic-bezier(.19, 1, .22, 1);
                text-decoration: none;  
            }
        </style>
    <body>
        <%@include  file="plantillas/menu_conocenos.jsp"%>
        <div class=" mb-5 contenidoconocenos   justify-content-center d-none d-sm-none d-md-flex" >   
            <div  style="width: 100%; position: absolute; bottom: 10px;">
                <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                    <h1 class="text-center"  style="font-size: 30px;font-weight: bold;"><b>APLICACIONES DEL PROYECTO</b></h1>
                    <h2 class="text-center" style="color: #2F2F2F; font-size: 16px">A continuacion las aplicaciones desarrolladas </h2>
                </div>
            </div>
        </div> 

        <div class="mb-5 justify-content-center d-block d-sm-flex d-md-none"> 
            <img class="w-100" src="recursos/imagenes/Sintítulo1.png" alt=""/>
            <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                <h1 class="text-center"  style="font-size: 30px;font-weight: bold;"><b>APLICACIONES DEL PROYECTO</b></h1>
                <h2 class="text-center" style="color: #2F2F2F; font-size: 20px">A continuacion las aplicaciones desarrolladas</h2>
            </div>
        </div>

        <div class="container">
            <div class="row  align-content-center justify-content-center">

                <div class="col-lg-6">
                    <div class="card  cajas mt-1 mb-3" style="width: 560px">
                        <iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/L1fr4MH0zuQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        <div class="card-body p-5">
                            <h3 class="card-title">PetFriend21</h3>
                            <p class="card-text"><b>Desarrolladores:</b> Germán Álvarez, Cristhian Briones, José Cordero, Paola Morales, Ingrid Ortiz, Suanny Tigselema</p>          
                        </div>
                         <div class="card-footer row justify-content-center text-muted">
                        <a  target="_blank" href="http://fyc.uteq.edu.ec:8080/apk/petfriend21.apk" class="btn btn-light font-weight-bold">Conocer PetFriend21</a>
                    </div>
                    </div>
                   
                </div>

                <div class="col-lg-6">
                    <div class="card  cajas mt-1 mb-3" style="width: 560px">
                        <iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/y6w6GwBH4K0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                       
                        <div class="card-body p-5">
                            <h3 class="card-title">Yuyapuy</h3>
                            <p class="card-text"><b>Desarrolladores:</b>  Luis Espín, Ariel Fernández, Francisco Moreira, Doris Solano, Dayanna Vélez</p>          
                        </div>
                        <div class="card-footer row justify-content-center text-muted">
                            <a target="_blank" href="index.jsp" class="btn btn-light font-weight-bold">Conocer Yuyapuy</a>
                        </div>

                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card  cajas mt-1 mb-3" style="width: 560px"> 
                      
                        <iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/hV7gAbRzZMU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

                        <div class="card-body p-5">
                            <h3 class="card-title">JIT (Juegos Interactivos para Todos)</h3>
                            <p class="card-text"><b>Desarrolladores:</b> Steven Hurtado, Henry Pérez, John Pincay, Randy Rodríguez; José García, Jorge Molina, Aura Táquez</p>          
                        </div>
                        <div class="card-footer row justify-content-center text-muted">
                            <a target="_blank" href="http://fyc.uteq.edu.ec:8080/jit/"  target="_blank" class="btn btn-light font-weight-bold">Conocer JIT</a>
                        </div>
                    </div>
                </div>


                <div class="col-lg-6">
                    <div class="card  cajas mt-1 mb-3" style="width: 560px"> 
                        <iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/LnqHQpwc0sg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                                               
                        <div class="card-body p-5">
                            <h3 class="card-title">Money Game</h3>
                            <p class="card-text"><b>Desarrolladores:</b> Kevin Cheves, Josimar Galarza, Miguel Suárez, Victor Zapata</p>          
                        </div>
                        <div class="card-footer row justify-content-center text-muted">
                            <a  target="_blank" href="http://fyc.uteq.edu.ec:8080/apk/MoneyGame.apk" class="btn btn-light font-weight-bold">Descarga Money Game</a>
                        </div>
                    </div>
                </div>




                <div class="col-lg-6">
                    <div class="card  cajas mt-1 mb-3" style="width: 560px"> 
                        <img style="width: 300px; height: 300px; margin: 0px auto" class="p-2" src="recursos/imagenes/logo_tulang.png" alt=""/>
                        <!--<iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/fOW8Y09GVek" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>-->                         
                        <div class="card-body p-5">
                            <h3 class="card-title">ToLan</h3>
                            <p class="card-text"><b>Desarrolladores:</b> Cristhian Burbano, Rubén Jaya, Daniela Moreira, Bryan Zambrano</p>          
                        </div>
                        <div class="card-footer row justify-content-center text-muted">
                            <a target="_blank" href="index.jsp" class="btn btn-light font-weight-bold">Conocer ToLan</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card  cajas mt-1 mb-3" style="width: 560px"> 
                        <img style="width: 300px; height: 300px; margin: 0px auto" class="p-3" src="recursos/imagenes/micro.png" alt=""/>
                        <!--<iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/fOW8Y09GVek" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>-->                         
                        <div class="card-body p-5">
                            <h3 class="card-title">Titopi</h3>
                            <p class="card-text"><b>Desarrolladores:</b> Victor Romero, Tyrone Tocta, Janer Torrales</p>          
                        </div>
                         <div class="card-footer row justify-content-center text-muted">
                            <a target="_blank" href="http://fyc.uteq.edu.ec:3000/" class="btn btn-light font-weight-bold">Conocer Titopi</a>
                        </div>
                    </div>
                </div>



            </div>





        </div>
     <%@include  file="plantillas/footer_conocenos.jsp"%>
    </body>
</html>
