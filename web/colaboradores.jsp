<%-- 
    Document   : colaboradores
    Created on : 16-feb-2022, 21:08:43
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--zdfsz-->
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
        <title>F&C - Participantes</title>
    </head>
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
    <%@include  file="plantillas/menu_conocenos.jsp"%>
        <div class=" mb-5 contenidoconocenos   justify-content-center d-none d-sm-none d-md-flex" >   
               <div  style="width: 100%; position: absolute; bottom: 10px;">
                <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                    <h1 class="text-center"  style="font-size: 70px;font-weight: bold;"><b>COLABORADORES</b></h1>
                    <h2 class="text-center" style="color: #2F2F2F;">Instituciones colaboradoras</h2>
                </div>
            </div>
       </div> 
        
        <div class="mb-5 justify-content-center d-block d-sm-flex d-md-none"> 
            <img class="w-100" src="recursos/imagenes/Sintítulo1.png" alt=""/>
             <div class="row pr-5 pl-5 flex-column justify-content-center"   >
                <h1 class="text-center"  style="font-size: 30px;font-weight: bold;"><b>COLABORADORES</b></h1>
                <h2 class="text-center" style="color: #2F2F2F; font-size: 20px">Instituciones colaboradoras</h2>
            </div>
        </div>
        
         
                                 
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
                                        <a target="_blank" href="https://www.facebook.com/FundacionDownSD" class="btn btn-block  btn-link" >Ir al sitio</a>
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
                                        <a target="_blank" href="https://www.facebook.com/Direcci%C3%B3n-de-Desarrollo-Social-GAD-Quevedo-475024629920635" class="btn btn-block  btn-link">Ir al sitio</a>
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
                                        <a target="_blank" href="https://www.municipioelempalme.gob.ec/gad/" class="btn btn-block  btn-link">Ir al sitio</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="card cajas"> 
                                    <div class="mt-3" style="display: flex; justify-content: center;align-items: center;height: auto; ">
                                        <div style="width: 80%; height: 150px; ">
                                            <img style="object-fit: cover; object-position: center; width: 100%; height: 100%"   src="recursos/conocenos/CX1TE_uG_400x400.jpg" >
                                        </div>                                       
                                    </div> 

                                    <div style="position: absolute; bottom: 10px" class="card-body">
                                        <h6 class="card-title text-center">Gobierno Autónomo Descentralizado Parroquial Rural La Esperanza</h6>                                     
                                        <a target="_blank" href="https://laesperanza.gob.ec/" class="btn btn-block  btn-link">Ir al sitio</a>
                                    </div>
                                </div>
                            </div>
                       
                </div>
            </div>
          <%@include  file="plantillas/footer_conocenos.jsp"%>
    </body>
</html>
