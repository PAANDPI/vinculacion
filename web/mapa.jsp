<%-- 
    Document   : mapa
    Created on : 15-dic-2021, 1:28:34
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/estilos/administrador.css" rel="stylesheet" type="text/css"/>
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
        <!--Mapa-->
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/><!--
        <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.css" />
        <link rel="stylesheet"  href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css"/>-->
        <!--Fin de la parte del mapa-->
    </head>
    <body style="overflow: hidden">
        <%@include  file="plantillas/menu.jsp" %>  
        <div class="row">
            <div class="col-lg-3">
                <div class=" m-3 mt-5 p-3" style="border: 3px solid #052C46; border-radius: 10px" >
                    <h5>Generar ruta</h5>
                    <img style="height: 100px;width: 100px; position: absolute; top: -1px; right: 10px" src="recursos/imagenes/Logo_colorido.png" alt=""/>               
                    <div class="">                        
                        <div class="form-group">
                            <label >Ubicación</label>
                            <input type="text" class="form-control form-control-sm" id="exampleInputEmail1"  placeholder="Mi ubicación">       
                        </div>
                        <div class="form-group">
                            <label>Destino</label>
                            <input type="text" class="form-control form-control-sm"  placeholder="Mi destino">
                        </div> 
                        <button style="border: 3px solid #052C46;border-radius: 10px; position: relative; right: 1px " 
                                type="button" class="btn font-weight-bold bi bi-compass "> Ruta</button>
                    </div>                                               

                </div>
                <h5 class="m-3">Lista de lugares</h5>
                <div  class="mt-1  m-3 mb-1 barra-colores"  style="height: 250px; max-height: 250px; overflow-y: auto;                     ">
                   
                    <ul class="list-group p-1">
                        <li class="list-group-item d-flex  align-items-center">
                            <input class="m-1" type="checkbox">Hospital
                        </li>
                        <li class="list-group-item d-flex   align-items-center">
                            <input class="m-1" type="checkbox">Fundaciones                            
                        </li>
                        <li class="list-group-item d-flex  align-items-center">
                            <input class="m-1" type="checkbox">Clinicas   
                        </li>                    
                        <li class="list-group-item d-flex   align-items-center">
                            <input class="m-1" type="checkbox"> Centro de atencion
                        </li>
                        <li class="list-group-item d-flex   align-items-center">
                            <input class="m-1" type="checkbox"> Centros
                        </li>
                    </ul>
                </div>
                <div class="ml-3 mt-5 mr-3 pl-3 pr-3 pt-3" style="border: 3px solid #052C46; border-radius: 10px">
                    <div class="row">
                         
                        <div class="col-lg-10">
                            <h5>Area del buffer:</h5>
                            <input style="width: 90%"  type="range" name="price" id="rango" min="0" max="5000" step="100" value="0">
                        </div>
                        <div class="col-lg-2">
                            <h5 class="bi bi-trash"></h5>
                        </div>
                    </div>                                                                          
                </div>
            </div>
            <div class="col-lg-9">
                <div id="mapid" style="width: 100%; height: 90vh; z-index: -1" class=" "></div>
            </div>
        </div>
    </body>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
            integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
    crossorigin=""></script>
    <script src="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.js"></script>
    <script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>
    <script src="recursos/javaScript/mapa.js" type="text/javascript"></script>
</html>
