<%-- 
    Document   : mapa
    Created on : 15-dic-2021, 1:28:34
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mapa</title>
        <link rel="icon" href="recursos/iconos/Logo_colorido.ico" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="recursos/bootstrap/js/jquery-2.1.1.min.js" type="text/javascript"></script>      
        <script src="recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="recursos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="recursos/estilos/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="recursos/estilos/administrador.css" rel="stylesheet" type="text/css"/>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!--Iconos-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
        <!--Mapa-->
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>

        <!--zona de la ruta-->
        <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.css" />
        <link rel="stylesheet"   href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css"/>
        <script src="//cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>


    </head>
    <body >   
        <div class="row">
            <div id="accordion" style="position: absolute; left: 10px; bottom: 5px; z-index: 10; width: 500px; ">
                <div class="card" style="border-top-left-radius: 20px;border-top-right-radius: 20px">
                    <div class="color_base blanco" style="width: 100%; height: auto; border-top-left-radius: 20px;border-top-right-radius: 20px" id="headingOne">
                        <h5 class="mb-0 p-4">
                            <button class="btn bi bi-caret-down-fill font-weight-bold blanco"  data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">                                
                                Generador de ruta
                            </button>
                            <a id="btnInforcion"  class=" float-right bi bi-info-circle p-2"></a>
                        </h5>
                    </div>

                    <div id="collapseOne" style="max-height: 70vh;overflow-x: hidden;  overflow-y: auto" class="collapse show barra-colores" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="row">
                            <div class="col-lg-12" >
                                <div class="form-group pl-4 pr-4 m-2">
                                    <div class="row">                                       
                                        <div id="informacionContenedor" class="col-lg-12">
                                            <div class="alert alert-warning" role="alert">
                                                <h6 class="alert-heading">¿Cómo marcar el punto de destino?</h6>
                                                <p style="text-align: justify">Marque el lugar de incio en el mapa o directamente presionar el boton <b class="bi bi-hand-index-fill"> Buscar ubicación</b> </p>                                       
                                            </div>                                    
                                        </div> 
                                        <div class="col-lg-12 mt-2"> 
                                            <button onclick="ponerubicacion()" style="border-radius: 50px;" class="btn btn-sm btn-warning  font-weight-bold float-left">Buscar ubicación  <span class="bi bi-hand-index-fill"></span></button>
                                            <a href="index.jsp" style="border-radius: 50px;" class="btn btn-sm color_base blanco font-weight-bold float-right">Menú <span class="bi bi-arrow-left"></span></a>
                                        </div>
                                    </div>    
                                </div>
                            </div> 
                            <div class="col-lg-12">
                                <div class="ml-3 mr-3 mb-2 p-3" style="-webkit-box-shadow: 1px 1px 5px 1px rgba(0,0,0,0.20); 
                                     box-shadow: 1px 1px 40px 1px rgba(0,0,0,0.20); border-radius: 10px;"> 
                                     <label  class="font-weight-bold">Lugar de destino:</label><br>
                                        <div class="input-group">
                                            <input id="search" type="text" class="form-control form-control-sm" placeholder="Ingrese el lugar a buscar" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                        </div>  
                                </div>
                                <div class="ml-3 mt-2 mr-3 p-3  barra-colores" 
                                     style="overflow-y: auto; max-height: 250px; border-radius: 10px;
                                     -webkit-box-shadow: 1px 1px 5px 1px rgba(0,0,0,0.20); 
                                     box-shadow: 1px 1px 40px 1px rgba(0,0,0,0.20);">
                                    <table id="mytable" class="table table-sm">
                                        <thead>
                                        </thead>
                                        <tbody id="lugaresMapa">                       

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-lg-12 ">
                                <div class="ml-3 mr-3 mb-3 mt-3 p-3 " style="-webkit-box-shadow: 1px 1px 5px 1px rgba(0,0,0,0.20); 
                                     box-shadow: 1px 1px 40px 1px rgba(0,0,0,0.20); border-radius: 10px;">
                                    <label class="ml-1 font-weight-bold"> Significado de los íconos: </label>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">                                    
                                            <i> <img src="recursos/iconos/iconos mapa/Clinica.ico" width="25" />  Centros Médicos</i>
                                            <input type="checkbox" class="form-check float-right" onclick="MostrarCapas(10)">

                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <i><img src="recursos/iconos/iconos mapa/Estudio.ico" width="25" />  Escuelas</i>
                                             <input type="checkbox" class="form-check" onclick="MostrarCapas(9)">
                                            
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <i><img src="recursos/iconos/iconos mapa/Ong.ico" width="25" />  Fundaciones</i>
                                             <input type="checkbox" class="form-check" onclick="MostrarCapas(8)">
                                            
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <i><img src="recursos/iconos/iconos mapa/instituciones.ico" width="25" />  Institutos</i>
                                             <input type="checkbox" class="form-check" onclick="MostrarCapas(6)">
                                            
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <i> <img src="recursos/iconos/iconos mapa/organizaciones.ico" width="25" />  Organizaciones</i>
                                             <input type="checkbox" class="form-check" onclick="MostrarCapas(7)">
                                           
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center">
                                            <i> <img src="recursos/iconos/iconos mapa/patronatos.ico" width="25" />  Patronatos</i>
                                             <input type="checkbox" class="form-check" onclick="MostrarCapas(5)">
                                           
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>    
        <div class="col-lg-12 m-0 p-0">
            <div id="map" style="width: 100%; height: 100vh;z-index: 1;" class=" "></div>  
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

