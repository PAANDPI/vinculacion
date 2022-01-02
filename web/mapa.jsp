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
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
        <!--Mapa-->

        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>
        <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.css" />
        <link rel="stylesheet"  href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css"/>
        <!--Fin de la parte del mapa-->
    </head>
    <body style="overflow: hidden">
        <%@include  file="plantillas/menu.jsp" %>  
        <div class="row">
            <div class="col-lg-3">

                <div class="pl-3 pr-3 pt-5 mt-5 m-3" 
                     style="border: 3px solid #052C46; 
                     width: 100%; height: auto; border-radius: 10px">
                    <form>
                        <img style="width: 130px; height: 130px; position: absolute; top:-10px"  src="recursos/imagenes/Logo_colorido.png" alt=""/>
                        <h4>Generador de ruta<h4>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Ubicación</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" a placeholder="Ruta">       
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Ubicación</label>
                            <input type="text" class="form-control"  placeholder="Ubicación">
                        </div>                        
                        <button style="border: 3px solid #052C46;border-radius: 10px" type="button" class="btn font-weight-bold">Ruta</button>
                    </form>
                </div>
                <div>
                    Hospital
                    Fundaciones
                    ONG
                    Clinicas
                    Centro de atencion
                </div>
                <div>
                    Buffer
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
