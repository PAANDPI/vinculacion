/* global Ciudad */
tbl_Lugares();
        var jsonUbicaciones;
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
        var datos = {"opcion": "2", "idProvincia": Provincia};
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
        $("#cmb-canton").change(function (e) {
Ciudad = this.value;
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
        function tbl_Lugares()
                {
                $.ajax({
                method: "GET",
                        url: 'LugarSrv',
                        success: function (data) {
                        var htmlTabla = ``;
                                jsonUbicaciones = data.Lugar;
                                for (var i = 0; i < jsonUbicaciones.length; i++) {
                        console.log(jsonUbicaciones[i].lugar);
                                htmlTabla += `<tr>
                             <td>
                                <div class="card caja">
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