<div id="formulario-ubicaciones" class="col-lg-12"> 
    <div class="row">
        <div class="col-lg-5 justify-content-center p-3">
            <div  style="width: 500px; height: auto; border-radius: 10px 10px 10px 10px " class="m-auto ">                    
                <div style="border-top:  10px solid #0B3049; background: #0B3049; border-radius: 10px 10px 0px 0px" class="col-lg-12 pl-0 pt-2">
                    <span class="bi bi-info-circle blanco efector_barra" style="font-size: 20px; position: absolute; right: 20px; top: 1px; "></span>
                    <div  class="row ml-4">
                        <label class=" font-weight-bold blanco " style="font-size: 20px" >LUGARES</label>    
                    </div> 
                    <div class="row ">
                        <nav class="nav ml-4">
                            <a class="btn btn-l efecto_guardar  bi bi-save-fill blanco " id="btn_guarda_lugar">  Guardar</a>  
                            <a id="btn_modUbicacion" class="btn btn-l  efecto_modificar bi bi bi-pencil-fill blanco ">  Modificar</a>   
                             <a id="btn_cancelarUbica" class="btn btn-l efecto_limpiar  bi bi-eraser blanco "> Cancelar</a>

                        </nav>
                    </div> 
                </div>  
                <div class="p-4 barra-colores " style="height: 100vh;max-height: 70vh;overflow-y: auto; background:white; border: 1px solid #c4c4c4; border-radius: 0px 0px 10px 10px">

                    <div class="form-group">
                        <label class="font-weight-bold ">Seleccionar provincia</label>
                        <select  class=" form-control form-control-sm" id="cmb-provincia" >

                        </select>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">Seleccionar cantón</label>
                        <select  class=" form-control form-control-sm" id="cmb-canton">
                            <option disabled selected hidden>-- Seleccione Cantón --</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="font-weight-bold">Nombre del lugar</label>
                        <input  class="form-control form-control-sm" type="text" id="txt-nombreLugar" >
                    </div>    
                    <div class="form-group">
                        <label class="font-weight-bold">Descripción</label>
                        <textarea  style="height: 100px" class="form-control form-control-sm" type="text" id="txt-descripcionLugar"></textarea>                                                                    
                    </div>  
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label class="font-weight-bold">Longitud</label>
                            <input  class="form-control form-control-sm" type="text" id="txt-coordenadaX" >
                        </div>
                        <div class="form-group col-md-4">
                            <label class="font-weight-bold">Latitud</label>
                            <input  class="form-control form-control-sm" type="text" id="txt-coordenadaY" >
                        </div>
                        <div class="form-group col-md-4">
                            <label class="font-weight-bold bi bi-info-circle" style=""> Seleccionador</label>
                            <button type="button" class="btn btn-sm btn-success  bi bi-geo-alt " data-toggle="modal" data-target="#exampleModal2" > Buscar en mapa</button>
                        </div>
                    </div> 
                    <div class="form-group">
                        <label class="font-weight-bold">Etiqueta</label>
                        <select  class=" form-control form-control-sm" id="txt-etiqueta" > >
                            <option value="FUNDACIONES">FUNDACIONES</option>
                            <option value="PATRONATOS">PATRONATOS</option>
                            <option value="ORGANIZACIONES">ORGANIZACIONES</option>
                            <option value="INSTITUTOS">INSTITUTOS</option>
                            <option value="ESCUELAS">ESCUELAS</option>
                            <option value="CENTROS MÉDICOS">CENTROS MÉDICOS</option>
                        </select>                       
                    </div>                                    
                </div>
            </div> 
        </div> 
        <div class="col-lg-7 pr-2">
            
            <div class="mr-5 mt-3 mb-2 p-3" style=" background: white; display: flex; flex-wrap: wrap ; 
                                    -webkit-box-shadow: 1px 1px 5px 1px rgba(0,0,0,0.20); 
                                     box-shadow: 1px 1px 40px 1px rgba(0,0,0,0.20);border-radius: 10px;">
               
                <label style="flex-basis: 40%" class="font-weight-bold bi bi-view-list">  LISTA DE LUGARES  </label>
           
                
                     <input  style="flex-basis: 60%" id="buscadorLugaress" placeholder="Buscador de lugares"  type="text" class=" form-control form-control-sm" >
            
            </div>
         
             
            <div class=" barra-colores  mr-5" style="height: 100vh;
                                                max-height: 74vh;
                                                overflow-y: auto;
                                                background: white; 
                                                -webkit-box-shadow: 1px 1px 5px 1px rgba(0,0,0,0.20); 
                                                box-shadow: 1px 1px 40px 1px rgba(0,0,0,0.20);
                                                border-radius: 10px;">
                <table id="tblUbicacionesss" class="table ">
                    <thead>

                    </thead>
                    <tbody id="tbl_ubicaciones">

                    </tbody>
                </table>
            </div>
        </div>
    </div> 
</div> 
  <!--Mapa-->
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>
<!-- Modal -->
<div class="modal fade efecto_cristal"  id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Seleccionar coordenadas</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div id="map" style="width: 100%; height: 450px;"></div>
      </div>
      <div class="modal-footer">
        <button id="btnCerrar_modal_mapa" type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
            integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
    crossorigin=""></script>
    <script src="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.js"></script>
    <script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>

<script type="text/javascript">
    var map = L.map('map').setView([-1.1297892902347988, -78.66221255606148], 13);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
    
    var popup = L.popup();
    
    function onMapClick(e) 
    {
    popup
        .setLatLng(e.latlng) // Sets the geographical point where the popup will open.
        .setContent("Has hecho click en la coordenada:<br> " +  e.latlng.lat.toString() + "," +  e.latlng.lng.toString()) // Sets the HTML content of the popup.
        .openOn(map); // Adds the popup to the map and closes the previous one. 
         swal(e.latlng.lng.toString()+" "+e.latlng.lat.toString());
         btnCerrar_modal_mapa;
         document.getElementById("txt-coordenadaX").value=e.latlng.lat.toString();
         document.getElementById("txt-coordenadaY").value=e.latlng.lng.toString(); 
    }
    map.on('dblclick', onMapClick);
    
    
</script>
        