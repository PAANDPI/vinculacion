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
        <title>Conócenos</title>
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
    </head>
    <body >
        <div class="mb-5" style="width: 100%; height: 100vh; background: #fff url(recursos/imagenes/Sintítulo-1.png) center center/cover no-repeat; ">

           <nav class="navbar navbar-expand-lg  navbar-dark bg-dark sombra1" style="background: none !important; "  >
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav m-auto align-content-center">
                        <li class="nav-item ">
                            <a class="nav-link btn mr-3 botones mt-3  p-1 blanco" href="conocenos.jsp"><span></span>  ¿Cuál es nuestro proposito?  </a>
                        </li>
                        <li class="nav-item "> 
                            <a class="nav-link btn mr-3 botones mt-3  p-1 blanco"  href="colaboradores.jsp"> <span ></span> Colaboradores </a>
                        </li>
                        <li class="nav-item "> 
                            <a class="nav-link btn mr-3 botones mt-3  p-1 blanco"  href="personal.jsp"> <span></span>  Participantes </a>
                        </li> 
                        <li class="nav-item "> 
                            <a class="nav-link btn mr-3 botones  mt-3  p-1 blanco"  href="aplicaciones.jsp"> <span></span>  Otras aplicaciones </a>
                        </li> 
                         <li class="nav-item "> 
                             <a class="nav-link btn mr-3 botones  mt-3  p-1 blanco"  href="recursos.jsp"> <span></span>Recursos </a>
                        </li>
                        <li class="nav-item "> 
                            <a class="nav-link btn mr-3 botones  mt-3  p-1 blanco"  href="capacitaciones.jsp"> <span></span>  Capacitaciones impartidas </a>
                        </li> 
                    </ul>               
                </div>
            </nav>     

            <div  style="width: 100%; position: absolute; bottom: 10px;">
                <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                    <h1 class="text-center"  style="font-size: 50px;font-weight: bold;"><b>OTRAS APLICACIONES DEL PROYECTO</b></h1> 
                    <h2 class="text-center">Podemos observar otras aplicaciones desarrollades </h2>
                </div>
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
                    </div>
                </div>
                
                <div class="col-lg-6">
                     <div class="card  cajas mt-1 mb-3" style="width: 560px">
                        <iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/d7qXEMdks4U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                       
                        <div class="card-body p-5">
                            <h3 class="card-title">Yuyapuy</h3>
                            <p class="card-text"><b>Desarrolladores:</b>  Luis Espín, Ariel Fernández, Francisco Moreira, Doris Solano, Dayanna Vélez</p>          
                        </div>
                    </div>
                </div>
                
                  <div class="col-lg-6">
                     <div class="card  cajas mt-1 mb-3" style="width: 560px"> 
                         <iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/e-6H1tB-WVI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        
                        <div class="card-body p-5">
                            <h3 class="card-title">JIT (Juegos Interactivos para Todos)</h3>
                            <p class="card-text"><b>Desarrolladores:</b> Steven Hurtado, Henry Pérez, John Pincay, Randy Rodríguez; José García, Jorge Molina, Aura Táquez</p>          
                        </div>
                    </div>
                   </div>
                
                
                <div class="col-lg-6">
                     <div class="card  cajas mt-1 mb-3" style="width: 560px"> 
                         <iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/OE-XvL6q9Y4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                                               
                        <div class="card-body p-5">
                            <h3 class="card-title">Money Game</h3>
                            <p class="card-text"><b>Desarrolladores:</b> Kevin Cheves, Josimar Galarza, Miguel Suárez, Victor Zapata</p>          
                        </div>
                    </div>
                   </div>
                
                    
                
                   
                <div class="col-lg-6">
                     <div class="card  cajas mt-1 mb-3" style="width: 560px"> 
                         <iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/ob_K1W3XLQc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                         
                        <div class="card-body p-5">
                            <h3 class="card-title">ToLan</h3>
                            <p class="card-text"><b>Desarrolladores:</b> Cristhian Burbano, Rubén Jaya, Daniela Moreira, Bryan Zambrano</p>          
                        </div>
                    </div>
                   </div>
                
                 <div class="col-lg-6">
                     <div class="card  cajas mt-1 mb-3" style="width: 560px"> 
                         <iframe width="560" height="315" style=" border-top-left-radius: 50px; border-top-right-radius: 50px;" src="https://www.youtube.com/embed/ob_K1W3XLQc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                         
                        <div class="card-body p-5">
                            <h3 class="card-title">Juguetes???</h3>
                            <p class="card-text"><b>Desarrolladores:</b> Victor Romero, Tyrone Tocta, Janer Torrales</p>          
                        </div>
                    </div>
                   </div>
                
                
                
            </div>





        </div>
          <div class="mt-5" style="background: rgb(50,113,129);
                    background: linear-gradient(262deg, rgba(50,113,129,1) 62%, rgba(65,140,159,1) 100%);"  >  
            <div class="container p-4">
                <div class="row mt-5">    
                   
                    <div class="col-sm-12 col-md-6">
                        <h5 class="font-weight-bold blanco">Información</h5>
                         <ul  class="nav list-group ">
                            <li class="b blanco nav-item mb-2" ><i class="bi bi-caret-right-fill"></i> © 2021 Universidad Técnica Estatal de Quevedo</li>
                            <li class="blanco nav-item mb-2"  ><i class="bi bi-caret-right-fill"></i> Campus "Ingeniero Manuel Agustín Haz Álvarez"</li>
                            <li class="blanco nav-item mb-2" ><i class="bi bi-caret-right-fill"></i> Av. Quito km. 1 1/2 vía a Santo Domingo de los Tsáchilas</li>
                            <li class="blanco mb-2" ><i class="bi bi-caret-right-fill"></i> (+593) 5 3702-220 Ext. 8039</li>
                            <li class="blanco mb-2" ><i class="bi bi-caret-right-fill"></i> Email: info@uteq.edu.ec</li>
                            <li class="blanco mb-2" ><i class="bi bi-caret-right-fill"></i> Quevedo - Los Ríos - Ecuador</li>
                            <li class="blanco mb-2" ><i class="bi bi-caret-right-fill"></i> www.uteq.edu.ec</li>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-md-6 ">
                        <h5 class="blanco">Contacto</h5>
                        <ul style="list-style:none;" class="footer-links     ">
                            <li class="blanco mb-2"><i class="bi bi-caret-right-fill"></i> Orlando Erazo (oerazo@uteq.edu.ec)</li>
                            <li class="blanco mb-2"><i class="bi bi-caret-right-fill"></i> Mercedes Moreira (mmoreira@uteq.edu.ec)</li>
                            <li class="blanco mb-2"><b>Redes sociales:</b>
                            <li class="blanco mb-2"><a class="btn p-0 m-0 blanco" href="https://www.facebook.com/fycuteq"><i class="bi bi-facebook"></i>  Facebook</a></li>
                            <li class="blanco mb-2"><a class="btn p-0 m-0 blanco" href="https://youtube.com/playlist?list=PL2t9AygoxQ1u9Wjs_Im_CYUvK27DHk5Hq"><i class="bi bi-youtube"></i> Youtube</a></li>
                            <li class="blanco mb-2"><i class="bi bi-caret-right-fill"></i> Noticias</li>
                            <li class="blanco mb-2"><i class="bi bi-caret-right-fill"></i> Conócenos</li>
                            <li class="blanco mb-2"> <i class="bi bi-caret-right-fill"></i> Identifícate</li>
                        </ul>
                    </div>

                    <div class="col-xs-12 col-md-12 ">
                        <div class="row flex-row mt-5 justify-content-center">
                            <img style="width: 150px" class="rounded-circle m-3" src="recursos/conocenos/descarga.jfif"/>
                            <img style="width: 150px" class="rounded-circle m-3" src="recursos/conocenos/logo_vinculacion.png" alt=""/>
                            <img style="width: 150px" class="rounded-circle m-3" src="recursos/conocenos/Logo_F_C.png" alt=""/>                           
                            
                        </div>
                    </div>
                </div>
              
            </div>               
        </div> 
    </body>
</html>
