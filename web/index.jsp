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
        <link href="recursos/estilos/app.css" rel="stylesheet" type="text/css"/>
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">        

    </head>

    <style>
        body
        {
            overflow-x: hidden;
        }

    </style>

    <body >

        <%@include  file="plantillas/menu.jsp" %>     

        <div class="degradado mb-3 sombra">
            <div class="container blanco encabezado">
                <div class="row flex-column-reverse flex-lg-row justify-content-center">
                    <div class="col-lg-6 col-sm-12 col-xm-12 p-5 centrar_objeto ">                        
                        <label class="" style="font-size: 20px">Conocimiento y buen vivir</label>
                        <label class="font-weight-bold" style="font-size: 45px" >¿Tiene curiosidad sobre las discapacidades?</label>
                        <p class="pt-2" style="font-size: 25px">Puede acceder a recursos y conceptos que le pueden ayudar a entender sobre las discapacidades.</p>           
                    </div>
                    <div class="col-lg-6 col-sm-12 col-xm-12 p-5 ">
                        <div class="row  flex-column"> 
                            <img class="m-auto" style="width: 100%; height: 40%" src="recursos/imagenes/ninios_estudiando.png" alt=""/>                                                                                                                                 
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <div class="container mb-5">
            <div class="row container" >
                <div class="col-lg-12 ">
                    <label style="font-size: 45px" class="font-weight-bold ">Funciones de YUYAPUY </label> 
                    <p>YUYAPUY es un proyecto social con el objetivo de mantener informado a grupos de atención 
                        prioritaria, tiene tres secciones principales: buscador de discapacidades, recursos
                        didácticos y mapa informativo, acceda a las siguientes opciones para conocer toda la 
                        información disponible: </p>

                </div>
            </div>
        </div>
        <%@include file="plantillas/principal/servicios.jsp" %> 

        <%@include  file="plantillas/footer.jsp" %>  
        <link href="recursos/estilos/menuflotante.css" rel="stylesheet" type="text/css"/>





        <a type="button"  
           style=" position: fixed;right: 20px; bottom: 50px ;width: 50px; height: 50px;transition: all 300ms ease 0ms;font-size: 21px" 
           class="btn btn-info bi bi-gear blanco   rounded-circle " data-toggle="modal" data-target="#exampleModalCenter" ></a>

           <div  class="modal fade " style="position:fixed; top:0px; left:800px;width:600px;" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div  class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content modaConfiguraciones">
                    <div class="p-4">
                        <h5 class="modal-title" id="exampleModalLongTitle">Ajuste de pagina</h5>

                    </div>
                    <div  class="modal-body p-3">
                        <div class="row">
                            <div class="col-lg-12">
                                <label class="m-1 mb-3 font-weight-bold">Ajuste de visión</label>
                            </div>
                            <div class="col-lg-4">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button id="plusBtn" onclick="test(1)" type="button" class="btn  btn-secondary bi bi-dash"></button>
                                    <button id="restBtn" type="button" class="btn  btn-secondary bi bi-fullscreen"></button>
                                    <button id="minusBtn" onclick="test(0)"  type="button" class="btn  btn-secondary bi bi-plus"></button>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <button type="button" class="btn   btn-secondary bi bi-search"> Lupa</button> 
                            </div>   
                            <div class="col-lg-5">    
                                <!--<input id="ColorTexto" type="color" ><button id="aplicarColor" class="btn btn-sm  btn-secondary" type="button">Restablecer</button>-->
                                <button id="" class="btn float-right  btn-secondary" type="button">Restablecer</button>
                            </div> 

                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <label class="m-1 mb-3 font-weight-bold">Modos de contraste</label>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-lg-4">
                                <div id="modoOscuro" class="manino modoOscuro">
                                    <span class="bi bi bi-circle-fill blanco m-1 float-right"></span>
                                    <label class="blanco" style="font-size: 20px;position:absolute; bottom: 45px; left: 55px">Texto</label>    
                                </div>    

                            </div> 
                            <div class="col-lg-4">
                                <div id="modoGris" class="manino" style="  background: gray; width: 100%;  width: 130px; height: 130px; border-radius: 10px;border: 1px solid #CFCFCF">
                                    <span class="bi bi bi-circle-fill blanco m-1 float-right"></span>
                                    <label class="blanco" style="font-size: 20px;position:absolute; bottom: 45px; left: 55px">Texto</label> 
                                </div>    


                            </div> 
                            <div class="col-lg-4 ">
                                <div id="modoNormal"class="manino"  style="  background: whitesmoke;  width: 130px; height: 130px; border: 1px solid #CFCFCF; border-radius: 10px">
                                    <span class="bi bi bi-circle-fill m-1 float-right"></span>
                                    <label class="negro" style="font-size: 20px;position:absolute; bottom: 45px; left: 55px">Texto</label> 
                                </div>    
                            </div>                                                        
                        </div>  
                        <div class="row">
                            <div class="col-lg-12">
                                <label class="m-1 mt-3 font-weight-bold">Efectos de imagenes
                            </div>   
                            <div class="col-lg-12">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <button id="ByN" type="button" class="btn btn-primary">Blanco y negro</button>
                                    <button id="Sepia" type="button" class="btn btn-secondary">Sepia</button>
                                    <button id="BajoBrillo" type="button" class="btn btn-danger">Bajo brillo</button>
                                    <button id="AltoContraste" type="button" class="btn btn-success">Alto contraste</button>
                                    <button id="Saturar" type="button" class="btn btn-warning">Saturar</button>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>

                        </div>
                    </div>

                </div> 

            </div>
        </div>

            <script src="recursos/javaScript/app.js" type="text/javascript"></script>
            <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>   
    </body>

</html>
