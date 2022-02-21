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
        Limpiar();

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
                coordenadaY.length > 0 && etiquete.length > 0 && (Ciudad+"").length > 0)
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
var anterio="";
function seleccionarUbicacion(idub) {
    
    
      if (anterio.length > 0) {
        var btnAux = document.getElementById("cardLugares" + anterio);
        btnAux.className = "card cajas"
    }
        document.getElementById("cardLugares" + idub).className = "card text-white cajas bg-primary"

    
    var idProv, idCiudad;
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

            $('#cmb-canton').prop('selectedIndex', idCiudad);
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
    anterio=idub+"";
}
function eliminiarUbicacion(id) {
    // console.log(id);
    var dato = {"idlugar": id, "accion": "2"}
    swal({
        title: "¿Desea Eliminar ubicación?",
        //text: "Once deleted, you will not be able to recover this imaginary file!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willDelete) => {
        if (willDelete) {
            $.ajax({
                method: "POST",
                url: 'LugarSrv',
                data: dato,
                success: function (data)
                {
                    console.log(data);
                    swal("La ubicacion a sido eliminada", {
                        icon: "success",
                    });
                },
                error: function (error) {
                    console.log(error);
                }
            });

        } else {
            //swal("Your imaginary file is safe!");
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
             document.getElementById("caounLugares").innerHTML= jsonUbicaciones.length;
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
                                                   <div class="col-lg-2">
                                                     <button style="border-radius: 70px 20px 70px 20px;" onclick="verUbicacion(${jsonUbicaciones[i].idlugar})" type="button" class="ti btn btn-success bi bi-compass btn-sm "> ver</button>
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


