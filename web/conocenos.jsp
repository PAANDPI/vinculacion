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
    </head>
    <body >
        <div style="width: 100%; height: 100vh; background: #fff url(recursos/imagenes/Sintítulo-1.png) center center/cover no-repeat; ">

            <nav class="navbar navbar-expand-lg  navbar-dark bg-dark sombra1" style="background: none !important; "  >
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav m-auto align-content-center">
                        <li class="nav-item ">
                            <a class="nav-link btn mr-3 botones mt-3  p-1 blanco" href="../vinculacion/index.jsp"><span  class="bi bi-house"></span>  Inicio  </a>
                        </li>
                        <li class="nav-item "> 
                            <a class="nav-link btn mr-3 botones mt-3  p-1 blanco"  href="../vinculacion/buscador.jsp"> <span class="bi bi-search"></span>  Buscador </a>
                        </li>
                        <li class="nav-item "> 
                            <a class="nav-link btn mr-3 botones mt-3  p-1 blanco"  href="../vinculacion/recursos.jsp"> <span class="bi bi-folder"></span>  Recursos </a>
                        </li> 
                        <li class="nav-item "> 
                            <a class="nav-link btn mr-3 botones  mt-3  p-1 blanco"  href="../vinculacion/mapa.jsp"> <span class="bi bi-compass"></span>  Mapa </a>
                        </li> 

                        <li class="nav-item">
                            <a class="nav-link  btn mr-3 botones  mt-3  p-1 blanco"  href="../vinculacion/conocenos.jsp"><span class="bi bi-people"></span>  Conócenos  </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link  btn mr-3 botones mt-3  p-1 blanco"  href="../vinculacion/login.jsp"><span class="bi bi-door-open "></span>  Identifícate </a>
                        </li>
                    </ul>               
                </div>
            </nav>

            <div style="width: 100%; position: absolute; bottom: 50px;">
                <div class="row flex-column justify-content-center"   >
                    <h1 class="text-center"  style="font-size: 70px;font-weight: bold;"><b>YUYAPUY</b> </h1>
                    <p class="text-center" style="font-size: 13px;color: gray">
                        <b>Aquí puedes conocer más sobre yuyapuy y las herramientas que ofrece este proyecto.</b>
                        <br>Ademas, puedes conocer sobre el resto de proyectos enfocados en las <br>
                        personas con discapacidad                    
                    </p>
                </div>

            </div>

        </div> 
        <div  style="background: white;">
            <div class="container">
                <div class="row " >
                    <div class="col-lg-6 pl-2 pr-5">
                        <img style="width: 100%" src="recursos/imagenes/Herramientas.png" alt=""/>

                        <!--                        <div class="row  ">
                                                    <div class="col-lg-8 m-3">
                                                        <div class=" p-3  ali blanco sombra"  style="background:#EABF3F; width: 100%; height: 100px; border-radius: 10px;
                                                             -webkit-box-shadow: 1px 1px 10px 10px rgba(0,0,0,0.20); display: flex; flex-wrap: wrap ;
                                                             box-shadow: 1px 1px 15px 5px  rgba(0,0,0,0.20);border-radius: 10px;">
                                                            <i style="flex-basis: 10%" class="bi bi-vr"></i>
                                                            <h4 style="flex-basis: 90%" class="font-weight-bold">Contruir <br> aplicaciones de TIC</h4>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row justify-content-center ">
                                                    <div class="col-lg-4">
                        
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <div class=" p-3  blanco"  style="background:#CF7F2F; width: 100%; height: 100px; border-radius: 10px;                                
                                                             -webkit-box-shadow: 1px 1px 10px 10px rgba(0,0,0,0.20); display: flex; flex-wrap: wrap ;
                                                             box-shadow: 1px 1px 15px 5px  rgba(0,0,0,0.20);border-radius: 10px;">
                                                            <i style="flex-basis: 10%" class="bi bi-window-stack"></i>
                                                            <h4 style="flex-basis: 90%" class="font-weight-bold">Implementar un <br> sitio web</h4>
                                                        </div> 
                                                    </div>
                                                </div>
                                                <div class="row ">
                                                    <div class="col-lg-8 m-3"> 
                                                        <div class=" p-3  blanco sombra" style="background:#BEBEBE; width: 100%; height: 100px; border-radius: 10px;
                                                             -webkit-box-shadow: 1px 1px 10px 10px rgba(0,0,0,0.20); display: flex; flex-wrap: wrap ;
                                                             box-shadow: 1px 1px 15px 5px rgba(0,0,0,0.20);border-radius: 10px;">
                                                            <i style="flex-basis: 10%" class="bi  bi-people"></i>
                                                            <h4 class="font-weight-bold">Capacitar distintos <br> involucrados</h4>
                                                        </div> 
                                                    </div>
                                                </div>-->
                    </div>
                    <div class="col-lg-6 ">
                        <h2>Objetivo General</h2> 
                        <p class="text-justify">Ofrecer herramientas de tecnologías de la información y comunicación a la comunidad de personas con discapacidad de la zona de influencia de la Universidad Técnica Estatal de Quevedo que les permitan acercarse más a su uso en su vida cotidiana.</p>
                        <h2>Objetivos Específicos</h2> 
                        <ul>
                            <li> <p class="text-justify">Implementar un sitio web que contenga información y acceso a recursos sobre distintos tipos de discapacidad aplicando recomendaciones de accesibilidad web, de manera que puedan ser usados por personas con discapacidad, personas cercanas o relacionadas a ellos, u otras personas interesadas de acuerdo a las condiciones del caso.</p></li>
                            <li> <p class="text-justify">Construir aplicaciones de TIC que puedan ser usadas por personas con discapacidad aplicando los criterios de accesibilidad que correspondan.</p></li>
                            <li> <p class="text-justify">Capacitar a distintos tipos de involucrados de acuerdo a los productos compilados, productos desarrollados o prácticas adquiridas con fines de aprendizaje y/o difusión.</p></li>
                        </ul>

                    </div>
                </div>
                <style>
                    .bn{
                        -webkit-filter: grayscale(100%);
                        filter: grayscale(100%);
                        border-radius: 200px;
                    }
                    .cajas
                    {
                        width: 100%; height: 300px;
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
            </div>
            <div class="row">

                <div class="col-lg-12 p-5">
                    <h2 class="text-center mb-5"  style="font-size: 50px;font-weight: bold;"><b>COLABORADORES</b> </h2>
                    <p></p>
                    <div class="container">
                        <img style="width: 100%;"  src="recursos/imagenes/Colaboradores.png" alt=""/>
                    </div>

                </div>

            </div>

            <div class="container ">
                 <h2 class="text-center mb-5 mt-5 pt-5"  style="font-size: 50px;font-weight: bold;"><b>DESARROLLADORES</b> </h2>
                <div class="row justify-content-center">               
                    <div class=" mt-5 col-lg-2  ">
                       
                        <img class="rounded-circle bn" src="recursos/conocenos/colaboradores/espin.png" style="width: 150px; height: 150px;  box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%);"><br>
                        <label class="text-center font-weight-bold">Luis Miguel Espin Carrascos</label>
                       
                    </div> 
                    <div class=" mt-5 col-lg-2 ">                       
                        <img class="rounded-circle bn" src="recursos/conocenos/colaboradores/ariel.png" style="width: 150px; height: 150px;  box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%); "><br>
                            <label class="text-center font-weight-bold">Ariel Owaldo Fernández Loor</label>              
                    </div>
                    <div class="mt-5 col-lg-2 "> 
                        <img class="rounded-circle bn" src="recursos/conocenos/colaboradores/Francisco.jpg" style="width: 150px; height: 150px;  box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%);"><br>
                            <label class="text-center font-weight-bold">Francisco Simpon Moreira García</label>
                    </div>
                    <div class="mt-5 col-lg-2 ">
                        
                            <img class="rounded-circle bn" src="recursos/conocenos/colaboradores/Michelle.jpeg" style="width: 150px; height: 150px;  box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%); "><br>
                            <label class="text-center font-weight-bold">Doris Michalle Solano Chico</label>
                       
                    </div>
                    <div class="mt-5 col-lg-2"> 
                        <img class="rounded-circle bn" src="recursos/conocenos/colaboradores/Dayana.jpeg" style="width: 150px; height: 150px;  box-shadow: 0 8px 40px -16px rgb(12 22 44 / 100%);"><br>
                                  <label class="text-center font-weight-bold">Dayana Lizzet Velez Araujo </label>             
                    </div>
                </div>
            </div>
                





        </div>


        <div class="container">
        <div class="row mb-5 mt-5 pt-5 pb-3">
            <div class="col-lg-12 mb-5">
                 <h2 class="text-center mb-5"  style="font-size: 50px;font-weight: bold;"><b>OTRAS APLICACIONES DEL PROYECTO</b> </h2>
                
            </div>
            <div class="card mt-1 mb-3">
                <img class="card-img-top" src="..." alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                </div>
            </div 
        </div>
    </div>
</div>
    <div class="row">
        <div class="col-lg-12">

        </div>
    </div>
    <img style="width: 100%; opacity: 0.65" src="recursos/imagenes/mountains-55067.png" alt=""/>
    <%--<%@include  file="plantillas/footer.jsp" %>--%>  
</body>
</html>
