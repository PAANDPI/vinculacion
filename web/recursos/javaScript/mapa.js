var patronatos = L.layerGroup();
;
var institutos = L.layerGroup();
;
var organizaciones = L.layerGroup();
;
var fundaciones = L.layerGroup();
;
var escuelas = L.layerGroup();
;
var centrosMedicos = L.layerGroup();
;
var jsonMapa;
var icono;
$.ajax({
    method: "GET",
    url: 'LugarSrv',
    success: function (data) {
        var htmlTabla = ``;
        var cardMapa = ``;
        jsonMapa = data.Lugar;
        for (var i = 0; i < jsonMapa.length; i++)
        {

            if (jsonMapa[i].etiqueta === "PATRONATOS")
            {
                icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/patronatos.ico",
                    iconSize: [50, 50] // size of the icon          
                });
                cardMapa = htmlCar(jsonMapa[i].lugar, jsonMapa[i].ciudad, jsonMapa[i].descripcion, i);
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(cardMapa).addTo(patronatos);
            } else if (jsonMapa[i].etiqueta === "INSTITUTOS")
            {
                icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/instituciones.ico",
                    iconSize: [50, 50] // size of the icon          
                });
                cardMapa = htmlCar(jsonMapa[i].lugar, jsonMapa[i].ciudad, jsonMapa[i].descripcion, i);
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(cardMapa).addTo(institutos);
            } else if (jsonMapa[i].etiqueta === "ORGANIZACIONES")
            {
                icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/organizaciones.ico",
                    iconSize: [50, 50] // size of the icon          
                });
                cardMapa = htmlCar(jsonMapa[i].lugar, jsonMapa[i].ciudad, jsonMapa[i].descripcion, i);
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(cardMapa).addTo(organizaciones);
            } else if (jsonMapa[i].etiqueta === "FUNDACIONES")
            {
                icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/Ong.ico",
                    iconSize: [50, 50] // size of the icon          
                });
                cardMapa = htmlCar(jsonMapa[i].lugar, jsonMapa[i].ciudad, jsonMapa[i].descripcion, i);
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(cardMapa).addTo(fundaciones);
            } else if (jsonMapa[i].etiqueta === "ESCUELAS")
            {
                icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/Estudio.ico",
                    iconSize: [50, 50] // size of the icon          
                });
                cardMapa = htmlCar(jsonMapa[i].lugar, jsonMapa[i].ciudad, jsonMapa[i].descripcion, i);
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(cardMapa).addTo(escuelas);
            } else if (jsonMapa[i].etiqueta === "CENTROS M??DICOS")
            {
                icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/Clinica.ico",
                    iconSize: [50, 50] // size of the icon          
                });
                cardMapa = htmlCar(jsonMapa[i].lugar, jsonMapa[i].ciudad, jsonMapa[i].descripcion, i);
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(cardMapa).addTo(centrosMedicos);
            }

            htmlTabla +=
                    `<tr>
                        <td scope="col"><b>${jsonMapa[i].lugar}</b> <br> ${jsonMapa[i].ciudad} </td>
                        <td scope="col"><button id="btnRuta${i}" onclick="formarRuta(${i})" type="button" class="btn btn-warning btn-sm bi bi-geo-alt font-weight-bold"></button></td>                    
                      </tr>`;

        }

        var lugaresMapa = document.getElementById("lugaresMapa");
        lugaresMapa.innerHTML = htmlTabla;
    },
    error: function (error)
    {
    }
});
function htmlCar(Nombre, ciudad, descripcion, i)
{
    return `<div class="card" style="width: 18rem;">
                                <div class="card-header">
                                 <b> ${Nombre}</b>
                                </div>
                                <ul class="list-group list-group-flush">
                                  <li class="list-group-item">${ciudad}</li>
                                  <li class="list-group-item">${descripcion}</li>
                                  <li class="list-group-item"><button onclick="formarRuta(${i})" type="button" class="btn btn-warning btn-sm bi bi-geo-alt">Formar ruta</button></li>
                                </ul>
                              </div>`;

}
var mbAttr = 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery ?? <a href="https://www.mapbox.com/">Mapbox</a>';
var mbUrl = 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw';

var grayscale = L.tileLayer(mbUrl, {id: 'mapbox/light-v9', tileSize: 512, zoomOffset: -1, attribution: mbAttr});
var streets = L.tileLayer(mbUrl, {id: 'mapbox/streets-v11', tileSize: 512, zoomOffset: -1, attribution: mbAttr});

var baseLayers = {
    'Grayscale': grayscale,
    'Streets': streets
};

var overlays = {
    'Patronatos': patronatos,
    'Institutos': institutos,
    'Organizaciones': organizaciones,
    'Fundaciones': fundaciones,
    'Escuelas': escuelas,
    'Centros Medicos': centrosMedicos
};




var map = L.map('map', {
    center: [-1.0803599757262687, -78.46033885786659],
    zoom: 7,

});
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

var basemaps = {

    Darck: L.tileLayer.wms('https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}{r}.png', {
        layers: 'Modo_darck'
    }),
    Nomal: L.tileLayer.wms('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        layers: 'Modo_nomal'
    }),
    Blanco: L.tileLayer.wms('http://ows.mundialis.de/services/service?', {
        layers: 'OSM-Overlay-WMS'
    }),
    Satelital: L.tileLayer.wms('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
        layers: 'OSM-Overlay-WMS'
    }),

    'Topography': L.tileLayer.wms(' https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
        layers: 'TOPO-WMS,OSM-Overlay-WMS'
    })
};

L.control.layers(basemaps, overlays).addTo(map);


function MostrarCapas(num)
{
    var opciones= document.getElementsByClassName("leaflet-control-layers-selector")
        opciones[num].click();
}
        
var routingControl;
var anterio = "";
var marcadorDestino;
var idGlobal;
function formarRuta(idLugar)
{
    idGlobal = idLugar;
    var iconoDestino = "";
    if (jsonMapa[idLugar].etiqueta === "PATRONATOS")
    {
        iconoDestino = L.icon({
            iconUrl: "recursos/iconos/iconos mapa/patronatos.ico",
            iconSize: [50, 50]
        });
    } else if (jsonMapa[idLugar].etiqueta === "INSTITUTOS")
    {
        iconoDestino = L.icon({
            iconUrl: "recursos/iconos/iconos mapa/instituciones.ico",
            iconSize: [50, 50] // size of the icon          
        });

    } else if (jsonMapa[idLugar].etiqueta === "ORGANIZACIONES")
    {
        iconoDestino = L.icon({
            iconUrl: "recursos/iconos/iconos mapa/organizaciones.ico",
            iconSize: [50, 50] // size of the icon          
        });
    } else if (jsonMapa[idLugar].etiqueta === "FUNDACIONES")
    {
        iconoDestino = L.icon({
            iconUrl: "recursos/iconos/iconos mapa/Ong.ico",
            iconSize: [50, 50] // size of the icon          
        });
    } else if (jsonMapa[idLugar].etiqueta === "ESCUELAS")
    {
        iconoDestino = L.icon({
            iconUrl: "recursos/iconos/iconos mapa/Estudio.ico",
            iconSize: [50, 50] // size of the icon          
        });
    } else if (jsonMapa[idLugar].etiqueta === "CENTROS M??DICOS")
    {
        iconoDestino = L.icon({iconUrl: "recursos/iconos/iconos mapa/Clinica.ico",
            iconSize: [50, 50] // size of the icon          
        });
    }

    if (anterio.length > 0) {
        var btnAux = document.getElementById("btnRuta" + anterio);
        btnAux.className = "btn btn-warning btn-sm bi bi-geo-alt"
    }
    var coordenadasx = jsonMapa[idLugar].coordendax;
    var coordenadasy = jsonMapa[idLugar].coordenday;

    if (routingControl != null) {
        map.removeControl(routingControl);
        routingControl = null;
    }

    if (marcadorDestino === undefined)
    {
        cardMapa = htmlCar(jsonMapa[idLugar].lugar, jsonMapa[idLugar].ciudad, jsonMapa[idLugar].descripcion, idLugar);
        marcadorDestino = L.marker([jsonMapa[idLugar].coordendax, jsonMapa[idLugar].coordenday], {icon: iconoDestino}).addTo(map);
    } else {
        map.removeLayer(marcadorDestino);
        cardMapa = htmlCar(jsonMapa[idLugar].lugar, jsonMapa[idLugar].ciudad, jsonMapa[idLugar].descripcion, idLugar);
        marcadorDestino = L.marker([jsonMapa[idLugar].coordendax, jsonMapa[idLugar].coordenday], {icon: iconoDestino}).addTo(map);


    }

    routingControl = L.Routing.control({

        showAlternatives: true,
        formatter: new L.Routing.Formatter({
            language: 'sp'
        }),
        waypoints: [
            L.latLng(marcadorInicial.getLatLng()),
            L.latLng(marcadorDestino.getLatLng())
        ], createMarker: function () {
            return null;
        },
    }).addTo(map);






    var btnU = document.getElementById("btnRuta" + idLugar);
    btnU.className = "btn btn-success btn-sm bi bi-check2-all "
    anterio = idLugar + "";

}
var marcadorInicial;
function ponerubicacion()
{
    if (marcadorInicial === undefined) {
    } else {
        map.removeLayer(marcadorInicial);
    }
    if ("geolocation" in navigator) {
        navigator.geolocation.getCurrentPosition(function (position) {
            xcomputer = position.coords.latitude;
            ycomputer = position.coords.longitude;
            icono = L.icon({
                iconUrl: "recursos/iconos/iconos mapa/persona.ico",
                iconSize: [50, 50] // size of the icon          
            });
            marcadorInicial = L.marker([position.coords.latitude.toString(), position.coords.longitude.toString()], {icon: icono}).bindPopup("Mi ubicaci??n o punto de partida").addTo(centrosMedicos).addTo(map);
        });
    } else
    {
        console.log("Browser doesn't support geolocation!");
    }
}

var popup = L.popup();
function onMapClick(e)
{
    popup
            .setLatLng(e.latlng)
            .setContent("Ubicacido en:<br> " + e.latlng.lat.toString() + "," + e.latlng.lng.toString()) // Sets the HTML content of the popup.
            .openOn(map);
    if (marcadorInicial === undefined) {
    } else {
        map.removeLayer(marcadorInicial);
    }
    icono = L.icon({
        iconUrl: "recursos/iconos/iconos mapa/persona.ico",
        iconSize: [50, 50] // size of the icon          
    });
    marcadorInicial = L.marker([e.latlng.lat.toString(), e.latlng.lng.toString()], {icon: icono}).bindPopup("Mi ubicaci??n o punto de partida").addTo(centrosMedicos).addTo(map);
    if (marcadorInicial === undefined) {

    } else
    {
        formarRuta(idGlobal);
    }



}
map.on('dblclick', onMapClick);

$(document).ready(function () {
    $("#informacionContenedor").hide();
    $("#search").keyup(function () {
        _this = this;
        // Show only matching TR, hide rest of them
        $.each($("#mytable tbody tr"), function () {
            if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                $(this).hide();
            else
                $(this).show();
        });
    });

    $("#btnInforcion").click(function () {

        if ($('#informacionContenedor').is(':visible')) {
            $('#informacionContenedor').hide();
        } else {
            $('#informacionContenedor').show();
        }

    });


});