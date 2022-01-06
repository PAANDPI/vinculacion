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
              crossorigin=""/>
    </head>
    <body style="overflow-y:hidden ">
        <%@include  file="plantillas/menu.jsp" %>    
        <div class="mt-3" style="position: absolute; left: 10px; bottom: 10px; z-index: 10; width: 400px">
            <div style="width: 100%; height: auto; border:  1px solid gray ; border-radius: 10px; background: white">
                <div  style="width: 100%; height: 50px; border-top-left-radius: 10px; border-top-right-radius: 10px" class="degradado_2 p-3">
                    <h5 class="blanco">Generar ruta</h5>                            
                </div> 
                <div class="form-group p-3">
                    <label >Ubicación</label>
                    <input type="text" class="form-control form-control-sm mb-2" id="exampleInputEmail1"  placeholder="Mi ubicación">       
                    <label>Destino</label>
                    <input type="text" class="form-control form-control-sm"  placeholder="Mi destino">


                    <button style="border: 3px solid #052C46;border-radius: 10px; position: relative; left:  1px " 
                            type="button" class="btn btn-block mt-3 btn-sm font-weight-bold bi bi-compass "> Ruta</button>
                </div> 
            </div>
        </div>

        <div id="map" style="width: 100%; height: 91vh;z-index: 1" class=" "></div>  
        <div style="position: absolute; right:  10px; bottom: 10px; z-index: 9; width: 400px; background: white">
            <div class="pl-3 pr-3 pt-3" style="border: 1px solid gray; border-radius: 10px">
                <h5>Area del buffer:   <a class=" btn bi bi-trash" style="font-size: 20px"></a></h5>
                <input style="width: 100%"  type="range" name="price" id="rango" min="0" max="5000" step="100" value="0">

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
