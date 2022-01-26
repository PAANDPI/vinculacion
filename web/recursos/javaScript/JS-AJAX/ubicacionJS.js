/* global Ciudad */

$(document).ready(function () {
    function cargaProvincia(e) {
        $.ajax({
            method: "GET",
            url: 'ProvinciaSvr',
            success: function (data) {
                jsonProvincia = data;
                var html = `<option value="" selected disabled hidden>-- Seleccione Provincia --</option>`;
                for (var i = 0; i < jsonProvincia.Provincia.length; i++)
                {
                    var idProvincia = jsonProvincia.Provincia[i].idprovincia;
                    var nombreProvincia = jsonProvincia.Provincia[i].provincia;
                    html += `<option value="${idProvincia}">${nombreProvincia}</option>`;
                }
                var cmbCatDiscapacidades = document.getElementById("cmb-provincia");
                cmbCatDiscapacidades.innerHTML = html;

            },
            error: function (error) {
                console.log(error);
            }
        });
    }
    $('#btnUbicaciones').click(function (e) {
        cargaProvincia();
        console.log('llenado de provincia');
    });

    $('#cmb-provincia').change(function () {
        var Provincia = this.value;
        var datos = {"opcion": "2", "idProvincia": Provincia };
        $.ajax({
            method: "GET",
            url: 'CiudadSrv',
            data: datos,
            success: function (data) {
                console.log(data);
                var html = `<option value="" selected disabled hidden>-- Seleccione Cantón --</option>`;
                for (var i = 0; i < data.Ciudad.length; i++)
                {
                    var idCanton = data.Ciudad[i].idciudad;
                    var nombreCanton = data.Ciudad[i].ciudad;
                    html += `<option value="${idCanton}">${nombreCanton}</option>`;
                }
                var cmbCatDiscapacidades = document.getElementById("cmb-canton");
                cmbCatDiscapacidades.innerHTML = html;
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
    var Ciudad;
      $("#cmb-canton").change(function(e){
          Ciudad= this.value;
      });
    $('#btn_guarda_lugar').click(function (e) {
        
        var Lugar = $("#txt-nombreLugar").val();
        var Descripcion = $("#txt-descripcionLugar").val();
        var coordenadaX = $("#txt-coordenadaX").val();
        var coordenadaY = $("#txt-coordenadaY").val();
        ;
        var Estado = 'true';
        var datos = {"IdCiudad": Ciudad, "Lugar": Lugar, "Descripcion": Descripcion, "CoordenadaX": coordenadaX, "CoordenadaY": coordenadaY, "Estado": Estado};
        console.log(datos);
        $.ajax({
            method: "POST",
            url: 'LugarSrv',
            data: datos,
            success: function (data) {
                console.log(data);
                Limpiar();
                alerta(`Ubicacion ${Lugar} añadida con exito`, "success");
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
    function Limpiar(e) {
        $("#txt-nombreLugar").val('');
        $("#txt-descripcionLugar").val('');
        $("#txt-coordenadaX").val('');
        $("#txt-coordenadaY").val('');
        cargaProvincia();
        $("#cmb-canton").val('');
    }
});

