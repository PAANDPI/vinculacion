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

        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>

        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
        <title>Conócenos</title>
    </head>
    <style>
          .cajas
                    {
                        width: 100%; height: 370px;
                        box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%);
                        border-bottom: 10px solid #5BAB90;
                        border-top: 10px solid #5BAB90;
                        border-radius: 50px;
                        -webkit-transition: -webkit-transform .5s cubic-bezier(.19, 1, .22, 1);
                        transition: transform .5s cubic-bezier(.19, 1, .22, 1);
                        transition: transform .5s cubic-bezier(.19, 1, .22, 1),-webkit-transform .5s cubic-bezier(.19, 1, .22, 1);
                        text-decoration: none; 
                    }
    </style>
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
                    <h1 class="text-center"  style="font-size: 70px;font-weight: bold;"><b>COLABORADORES</b></h1>
                    <h2 class="text-center" style="color: #2F2F2F;">Instituciones colaboradoras.</h2>
                </div>
            </div>
       </div> 
    
          <div class="row">
                <div class="col-lg-12">                   
                    <div class="container">
                        <div class="row justify-content-center align-content-center">

                            <div class="col-sm-3">
                                <div class="card cajas">
                                    
                                    <div class="mt-3" style="display: flex; justify-content: center;align-items: center;height: auto; ">
                                        <div style="width: 150px; height: 150px;">
                                            <img class="rounded-circle" style="object-fit: cover; width: 100%"   src="recursos/conocenos/Logo-Down.jpg" >
                                        </div>                                       
                                    </div>  
                                    
                                    <div style="position: absolute; bottom: 10px"  class="card-body">
                                        <h6 class="card-title text-center">Fundación de y para personas con Síndrome de Down de Santo Domingo</h6>
                                        <a href="https://www.facebook.com/FundacionDownSD" class="btn btn-block  btn-link" >Ir al sitio</a>
                                    </div>                                                                        
                                </div>
                        </div>

                            <div class="col-sm-3">
                                <div class="card cajas"> 
                                    
                                    <div class="mt-3" style="display: flex; justify-content: center;align-items: center;height: auto; ">
                                        <div style="width: 150px; height: 150px;">
                                             <img class="rounded-circle" style="object-fit: cover; width: 100%"   src="recursos/conocenos/Quevedo.png" >
                                        </div>                                       
                                    </div>  

                                    <div style="position: absolute; bottom: 10px"  class="card-body">
                                        <h6 class="card-title text-center">Dirección de Gestión de Desarrollo Social del Gobierno Autónomo Descentralizado Municipal de Quevedo</h6>
                                        <a href="https://www.facebook.com/Direcci%C3%B3n-de-Desarrollo-Social-GAD-Quevedo-475024629920635" class="btn btn-block  btn-link">Ir al sitio</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="card cajas">
                                    <div class="mt-3" style="display: flex; justify-content: center;align-items: center;height: auto; ">
                                        <div style="width: 80%; height: 150px;">
                                             <img style="object-fit: contain; object-position: center; width: 100%; height: 100%"   src="recursos/conocenos/LOGOTIPO_INSTITUCIONAL_GADM_EL_EMPALME2.png" >
                                        </div>                                       
                                    </div>  


                                    <div style="position: absolute; bottom: 10px"  class="card-body">
                                        <h6  class="card-title text-center">Dirección de Desarrollo Comunitario y Gestión Social del Gobierno Autónomo Descentralizado Municipal de El Empalme</h6>
                                        <a href="https://www.municipioelempalme.gob.ec/gad/" class="btn btn-block  btn-link">Ir al sitio</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="card cajas"> 
                                    <div class="mt-3" style="display: flex; justify-content: center;align-items: center;height: auto; ">
                                        <div style="width: 80%; height: 150px; ">
                                             <img style="object-fit: cover; object-position: center; width: 100%; height: 100%"   src="recursos/conocenos/La_esperanza.png" >
                                        </div>                                       
                                    </div> 

                                    <div style="position: absolute; bottom: 10px" class="card-body">
                                        <h6 class="card-title text-center">Gobierno Autónomo Descentralizado Parroquial Rural La Esperanza</h6>                                     
                                        <a href="https://laesperanza.gob.ec/" class="btn btn-block  btn-link">Ir al sitio</a>
                                    </div>
                                </div>
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
