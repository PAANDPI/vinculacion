let tipoMap = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
var mymap = L.map('mapid').setView([0.12194430246108894, -79.25425620962596], 13);
L.tileLayer(tipoMap, {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(mymap);