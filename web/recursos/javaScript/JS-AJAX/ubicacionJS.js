/* global Ciudad */
tbl_Lugares();
var jsonUbicaciones;
var jsonCantones;
var todoCantones;

var idlugar;
$(document).ready(function () {
    cargarTodoCantones()
    $("#buscadorLugaress").keyup(function () {
        _this = this;
        // Show only matching TR, hide rest of them
        $.each($("#tblUbicacionesss tbody tr"), function () {
            if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                $(this).hide();
            else
                $(this).show();
        });
    });
    function cargarTodoCantones()
    {
        var datos = {"opcion": "1"};
        $.ajax({
            method: "GET",
            url: 'CiudadSrv',
            data: datos,
            success: function (data) {
                todoCantones = data;
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
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
        $('#btn_modUbicacion').hide();
        $('#btn_cancelarUbica').hide();
    });
    $('#cmb-provincia').change(function () {
        var Provincia = this.value;
        var datos = {"opcion": "2", "idProvincia": Provincia};
        $.ajax({
            method: "GET",
            url: 'CiudadSrv',
            data: datos,
            success: function (data) {
                jsonCantones = data;
                var html = ``;
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
    $("#cmb-canton").change(function (e) {
        Ciudad = this.value;
    });
    $('#btn_cancelarUbica').click(function () {
        $('#btn_guarda_lugar').show("2000");
        $('#btn_modUbicacion').hide();
        $('#btn_cancelarUbica').hide();
        if (anteriorr.length > 0) {
        var btnAux = document.getElementById("cardLugares" + anteriorr);
        btnAux.className = "card cajas"
    }
        Limpiar();

    });
    $('#btn_modUbicacion').click(function (e) {
        var Lugar = $("#txt-nombreLugar").val();
        var Descripcion = $("#txt-descripcionLugar").val();
        var coordenadaX = $("#txt-coordenadaX").val();
        var coordenadaY = $("#txt-coordenadaY").val();
        var etiquete = $("#txt-etiqueta").val();
        var idCiudad = $("#cmb-canton").val();
        var Estado = 'true';
        var datos = {"idUbicacion": idmodUbicacion,
            "IdCiudad": idCiudad,
            "Lugar": Lugar,
            "Descripcion": Descripcion,
            "CoordenadaX": coordenadaX,
            "CoordenadaY": coordenadaY,
            "Estado": Estado,
            "Etiquete": etiquete,
            "accion": "3"};
        $.ajax({
            method: "POST",
            url: 'LugarSrv',
            data: datos,
            success: function (data)
            {
                console.log(data);
                Limpiar();
                 Swal.fire("La ubicacion a sido Modificada con exito", {
                        icon: "success",
                    });
                tbl_Lugares();
                Limpiar();
                 $('#btn_cancelarUbica').click();
            },
            error: function (error) {
                console.log(error);
            }
        });
    });
    $('#btn_guarda_lugar').click(function (e) {

        var Lugar = $("#txt-nombreLugar").val();
        var Descripcion = $("#txt-descripcionLugar").val();
        var coordenadaX = $("#txt-coordenadaX").val();
        var coordenadaY = $("#txt-coordenadaY").val();
        var etiquete = $("#txt-etiqueta").val();
        var Estado = 'true';
        var datos = {"IdCiudad": Ciudad, "Lugar": Lugar,
            "Descripcion": Descripcion,
            "CoordenadaX": coordenadaX,
            "CoordenadaY": coordenadaY,
            "Estado": Estado,
            "Etiquete": etiquete,
            "accion": "1"};

        if (Lugar.length > 0 && Descripcion.length > 0 && coordenadaX.length > 0 &&
                coordenadaY.length > 0 && etiquete.length > 0 && (Ciudad + "").length > 0)
        {

            if (validarExistenciaLugares())
            {
                $.ajax({
                    method: "POST",
                    url: 'LugarSrv',
                    data: datos,
                    success: function (data)
                    {
                        console.log(data);
                        Limpiar();
                        alerta(`Ubicacion ${Lugar} añadida con exito`, "success");
                        tbl_Lugares();
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            } else
            {
                alerta("Ya se encuentra registrado un lugar con el mismo nombre", "info");
            }


        } else {
            alerta("Llene todo los campos", "info");
        }




         tbl_Lugares();



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
function  validarExistenciaLugares()
{
    for (var i = 0; i < jsonUbicaciones.length; i++) {
        if (jsonUbicaciones[i].lugar == $("#txt-nombreLugar").val())
        {
            return false;
            break;
        }
    }
    return true;
}
var anteriorr = "";
var idmodUbicacion, idCiudad;
function seleccionarUbicacion(idub) {
    if (anteriorr.length > 0) {
        var btnAux = document.getElementById("cardLugares" + anteriorr);
        btnAux.className = "card cajas"
    }
    document.getElementById("cardLugares" + idub).className = "card text-white cajas bg-info"
    var idProv;
    for (var x of jsonUbicaciones) {
        if (idub == x.idlugar) {
            idlugar = x.idlugar;
            // $('#cmb-provincia :selected').text(x.provincia);
            for (var y of jsonProvincia.Provincia) {
                if (y.provincia == x.provincia) {
                    idProv = y.idprovincia;
                    break;
                }
            }
            $('#cmb-provincia').prop('selectedIndex', idProv);
            $('#cmb-provincia :selected').change();
            for (var a = 0; a < todoCantones.Ciudad.length; a++)
            {
                var ciudad = todoCantones.Ciudad[a].ciudad
                if (ciudad === x.ciudad)
                {
                    idCiudad = ciudad;
                }
            }
            idmodUbicacion = idub;
            $('#cmb-canton').val(idCiudad);
            $('#txt-nombreLugar').val(x.lugar);
            $('#txt-descripcionLugar').val(x.descripcion);
            $('#txt-coordenadaX').val(x.coordendax);
            $('#txt-coordenadaY').val(x.coordenday);
            $('#txt-etiqueta :selected').text(x.etiqueta);
            $('#btn_guarda_lugar').hide("slow");
            $('#btn_modUbicacion').show("2000");
            $('#btn_cancelarUbica').show("2000");
        }
    }
    anteriorr = idub + "";
}
function eliminiarUbicacion(id) {
    
    
    var dato = {"idlugar": id, "accion": "2"}
      Swal.fire({
        title: "¿Desea Eliminar ubicación?",
        icon: 'warning',
        showDenyButton: true,
        confirmButtonText: 'No',
        denyButtonText: `Si`,
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({text: "Eliminación cancelada", icon: "info"});
        } else if (result.isDenied) {
           $.ajax({
                method: "POST",
                url: 'LugarSrv',
                data: dato,
                success: function (data)
                {
                    console.log(data);
                    Swal.fire("La ubicacion a sido eliminada", {
                        icon: "success",
                    });
                    anteriorr = "";
                    tbl_Lugares();
                },
                error: function (error) {
                    console.log(error);
                    tbl_Lugares();
                }
            });
           
        }
    });
             
}
function tbl_Lugares()
{
    $.ajax({
        method: "GET",
        url: 'LugarSrv',
        success: function (data) {
            var htmlTabla = ``;
            jsonUbicaciones = data.Lugar;
            document.getElementById("caounLugares").innerHTML = jsonUbicaciones.length;
            for (var i = 0; i < jsonUbicaciones.length; i++) {
                // console.log(jsonUbicaciones[i].lugar);
                htmlTabla += `<tr>
                             <td>
              
                                <div id="cardLugares${jsonUbicaciones[i].idlugar}" class="card caja">
                                            <div class="card-header ">
                                              <div class="row">
                                                  <h5 class="card-title col-lg-11"><span class="bi bi-geo-fill"></span>${jsonUbicaciones[i].lugar}</h5>
                                                  <div class="col-lg-1"> <img class="float-right " src="https://flagcdn.com/ec.svg" width="35"></div>
                                              </div>
                                            </div>
                                            <div class="card-body">
                                              <div class="row">
                                                <div class="col-lg-6">
                                                    <h6 class="font-weight-bold">País: ${jsonUbicaciones[i].pais}</h6>   
                                                    <h6 class="font-weight-bold">Ciudad: ${jsonUbicaciones[i].ciudad}</h6>      
                                                    <h6 class="font-weight-bold">Provincia: ${jsonUbicaciones[i].provincia}</h6>  
                                                </div>
                                                <div class="col-lg-6">
                                                  <h6 class="font-weight-bold">Longitud: ${jsonUbicaciones[i].coordendax}</h6>   
                                                    <h6 class="font-weight-bold">Latitud: ${jsonUbicaciones[i].coordenday}</h6>      
                                                    <h6 class="font-weight-bold">Estado: ${jsonUbicaciones[i].estado}</h6>  
                                                </div>
                                                <hr>
                                                <div class="col-lg-12">
                                                  <h6>Descripción:</h6>
                                                  <p>${jsonUbicaciones[i].descripcion}</p>
                                                </div>
                                                <hr>
                                                <div class="col-lg-10">

                                                    <button type="button" onclick="seleccionarUbicacion(${jsonUbicaciones[i].idlugar})" class="btn btn-primary btn-sm bi bi-eye"> Seleccionar</button>
                                                    <button type="button" onclick="eliminiarUbicacion(${jsonUbicaciones[i].idlugar})" class="btn btn-danger btn-sm bi bi-trash"> Eliminar</button>  

                                                </div>
                                                   
                                              </div>
                                            </div>
                                          </div>
                              </td>
                              </tr>`;
            }

            var tbl_ubicaciones = document.getElementById("tbl_ubicaciones");
            tbl_ubicaciones.innerHTML = htmlTabla;
        },
        error: function (error) {

        }
    });

}


