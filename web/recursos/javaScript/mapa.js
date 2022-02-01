var patronatos = L.layerGroup();
;
var institutos = L.layerGroup();;
var organizaciones = L.layerGroup();;
var fundaciones = L.layerGroup();;
var ecuelas = L.layerGroup();;
var centrosMedicos = L.layerGroup();;
var jsonMapa;
var icono;
$.ajax({
    method: "GET",
    url: 'LugarSrv',
    success: function (data) {
        var htmlTabla = ``;
        var lista = ``;
        jsonMapa = data.Lugar;
        for (var i = 0; i < jsonMapa.length; i++)
        {
            lista+= `<option value="${ jsonMapa[i].lugar}"></option>`;
            if (jsonMapa[i].etiqueta === "PATRONATOS")
            {
                 icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/patronatos.ico", 
                    iconSize: [50, 50] // size of the icon          
                });

                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(jsonMapa[i].lugar).addTo(patronatos);
            } else if (jsonMapa[i].etiqueta === "INSTITUTOS")
            {
                 icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/instituciones.ico", 
                    iconSize: [50, 50] // size of the icon          
                });
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(jsonMapa[i].lugar).addTo(institutos);
            } else if (jsonMapa[i].etiqueta === "ORGANIZACIONES")
            {
                 icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/organizaciones.ico", 
                    iconSize: [50, 50] // size of the icon          
                });
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(jsonMapa[i].lugar).addTo(organizaciones);
            } else if (jsonMapa[i].etiqueta === "FUNDACIONES")
            {
                 icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/Ong.ico", 
                    iconSize: [50, 50] // size of the icon          
                });
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(jsonMapa[i].lugar).addTo(fundaciones);
            } else if (jsonMapa[i].etiqueta === "ESCUELAS")
            {
                 icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/Estudio.ico", 
                    iconSize: [50, 50] // size of the icon          
                });
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(jsonMapa[i].lugar).addTo(ecuelas);
            } else if (jsonMapa[i].etiqueta === "CENTROS MÉDICOS")
            {
                 icono = L.icon({
                    iconUrl: "recursos/iconos/iconos mapa/Clinica.ico", 
                    iconSize: [50, 50] // size of the icon          
                });
                L.marker([jsonMapa[i].coordendax, jsonMapa[i].coordenday], {icon: icono}).bindPopup(jsonMapa[i].lugar).addTo(centrosMedicos);
            }



        }
        document.getElementById("lugares").innerHTML=lista;

    },
    error: function (error)
    {
    }
});

var mbAttr = 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>';
var mbUrl = 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw';

var grayscale = L.tileLayer(mbUrl, {id: 'mapbox/light-v9', tileSize: 512, zoomOffset: -1, attribution: mbAttr});
var streets = L.tileLayer(mbUrl, {id: 'mapbox/streets-v11', tileSize: 512, zoomOffset: -1, attribution: mbAttr});

var baseLayers = {
    'Grayscale': grayscale,
    'Streets': streets
};

var overlays = {
    'patronatos': patronatos,
    'institutos': institutos,
    'organizaciones': organizaciones,
    'fundaciones': fundaciones,
    'ecuelas': ecuelas,
    'centrosMedicos': centrosMedicos
};


//var layerControl = L.control.layers(baseLayers, overlays).addTo(map);

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





