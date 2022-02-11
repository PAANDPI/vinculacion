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
    <body class="color_base">
        <%@include  file="plantillas/menu.jsp" %>    
        <div class="color_base" style="max-width: 100%; height: 200px;">

        </div>
        <div  style="background: white; border-radius: 100px 100px 0px 0px ">
            <div class="container">
                <div class="row mt-5 p-3 pt-5" >
                    <div class="col-lg-6 pl-2 pr-5">
                        <div class="row justify-content-center  mb-3">
                            <div class="col-lg-12  text-center">
                                <h2 class="font-weight-bold">Ofrecer herramientas TIC</h2>
                                <span style="font-size: 25px" class="bi bi-arrow-down-circle-fill"></span>
                            </div>
                        </div> 
                        <div class="row  ">
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
                        </div>
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
                <div class="row align-content-center mb-5 pb-5 pt-5">
                    <div class="col-lg-12 mb-5">
                        <h1>Colaboradores</h1>
                    </div> 
                    <div class=" col-lg-3 ">   
                        <div  style="width: 220px; height: 300px; border-radius: 20px; border-top: 10px solid #466493 ;
                              -webkit-box-shadow: 1px 1px 10px 10px rgba(154, 91, 206,1);
                              box-shadow: 1px 1px 50px 1px  rgba(154, 91, 206,0.70);">
                            <img class="p-3"  style="width: 100%; height: 200px" src="recursos/conocenos/Logo-Down.jpg" alt=""/>
                            <label style="color: #383838" class="font-weight-bold text-center p-1">
                                Fundación Down Santo Domingo</label>
                        </div>                                      
                    </div>
                    <div class=" col-lg-3 ">

                        <div  style="width: 220px; height: 300px; border-radius: 20px; border-top: 10px solid #EE3921;
                              -webkit-box-shadow: 1px 1px 10px 10px rgba(154, 91, 206,1);
                              box-shadow: 1px 1px 50px 1px  rgba(154, 91, 206,0.70);">

                            <img class="p-3" style="width: 100%; height: 200px" src="recursos/conocenos/CX1TE_uG_400x400.jpg" alt=""/>

                            <label style="color: #383838" class="font-weight-bold text-center p-1">
                                GAD Parroquial La esperanza</label>

                        </div>  

                    </div>
                    <div class=" col-lg-3 "> 

                        <div  style="width: 220px; height: 300px; border-radius: 20px;border-top: 10px solid #5B8957;
                              -webkit-box-shadow: 1px 1px 10px 10px rgba(154, 91, 206,1);
                              box-shadow: 1px 1px 50px 1px  rgba(154, 91, 206,0.70);">

                            <img class="p-3" style="width: 100%; height: 200px" src="recursos/conocenos/Quevedo.png" alt=""/>

                            <label style="color: #383838" class="font-weight-bold text-center p-1">
                                Dirección de Desarrollo Social del GADM de Quevedo </label>

                        </div>                                          

                    </div>
                    <div class=" col-lg-3"> 
                        <div  style="width: 220px; height: 300px; border-radius: 20px;border-top: 10px solid #E16D1B;
                              -webkit-box-shadow: 1px 1px 10px 10px rgba(154, 91, 206,1);
                              box-shadow: 1px 1px 50px 1px  rgba(154, 91, 206,0.70);">

                            <img class="p-3" style="width: 100%; height: 200px" src="recursos/conocenos/bartolucci.jpg" alt=""/>

                            <label style="color: #383838" class="font-weight-bold text-center p-1">
                                Unidad de Educación Especializada "Enrique Bartolucci" </label>

                        </div>
                    </div>
                </div>
                <div class="row mb-5 pb-3">
                    <div class="col-lg-12 mb-5">
                        <h2>Juegos y otras aplicaciones</h2>
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
        <%@include  file="plantillas/footer.jsp" %>  
    </body>
</html>
