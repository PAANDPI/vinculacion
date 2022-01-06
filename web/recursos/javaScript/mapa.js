//var cities = L.layerGroup();
//
//var mLittleton = L.marker([39.61, -105.02]).bindPopup('This is Littleton, CO.').addTo(cities);
//var mDenver = L.marker([39.74, -104.99]).bindPopup('This is Denver, CO.').addTo(cities);
//var mAurora = L.marker([39.73, -104.8]).bindPopup('This is Aurora, CO.').addTo(cities);
//var mGolden = L.marker([39.77, -105.23]).bindPopup('This is Golden, CO.').addTo(cities);
//
//var mbAttr = 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>';
//var mbUrl = 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw';
//
//var grayscale = L.tileLayer(mbUrl, {id: 'mapbox/light-v9', tileSize: 512, zoomOffset: -1, attribution: mbAttr});
//var streets = L.tileLayer(mbUrl, {id: 'mapbox/streets-v11', tileSize: 512, zoomOffset: -1, attribution: mbAttr});
//

//
//var baseLayers = {
//    'Grayscale': grayscale,
//    'Streets': streets
//};
//
//var overlays = {
//    'Cities': cities
//};

//var layerControl = L.control.layers(baseLayers, overlays).addTo(map);

var map = L.map('map', {
    center: [39.73, -104.99],
    zoom: 2,
    
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

L.control.layers(basemaps).addTo(map);

