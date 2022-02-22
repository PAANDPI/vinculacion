var formData;
var base64;
var jsonRecursos;
tbl_recursos();
const toBase64 = file => new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = error => reject(error);
    });
async function Main() {
    var checkArchivo = document.getElementById("checkArchivo").checked;
    var checkEnlace = document.getElementById("checkEnlace").checked;
    var datosM
    if (checkArchivo) {
        try {
            const file = document.querySelector('#formFile').files[0];
            base64 = await toBase64(file);
            guardarRecurso();
        } catch (e) {
            alerta("Por favor selecione un archivo", "info")
        }


    } else if (checkEnlace) {
        guardarRecurso();
    }


}
function tbl_recursos()
{
    $.ajax({
        method: "GET",
        url: "RecursoSrv",
        data: {"accion": 1},
        success: function (data) {
            jsonRecursos = data;
            var htmlTabla = ``;
            document.getElementById("caounRecursos").innerHTML = jsonRecursos.Recurso.length;
            for (var i = 0; i < jsonRecursos.Recurso.length; i++)
            {
                var idrecurso = jsonRecursos.Recurso[i].idrecurso;
                var idcategoriarecurso = jsonRecursos.Recurso[i].idcategoriarecurso;
                var categoriarecurso = jsonRecursos.Recurso[i].categoriarecurso;
                var iddiscapacidad = jsonRecursos.Recurso[i].iddiscapacidad;
                var discapacidad = jsonRecursos.Recurso[i].discapacidad;
                var recurso = jsonRecursos.Recurso[i].recurso;
                var descripcion = jsonRecursos.Recurso[i].descripcion;
                var etiquetas = jsonRecursos.Recurso[i].etiquetas;
                var estado = jsonRecursos.Recurso[i].estado;
                var ruta = jsonRecursos.Recurso[i].ruta;
                var url = `recursos/iconos/iconos recuros/archivo.png`;
                if (categoriarecurso === "Archivos")
                {
                    url = `recursos/iconos/iconos recuros/archivo.png`;
                } else if (categoriarecurso === "Videos")
                {
                    url = `recursos/iconos/iconos recuros/video.png`;
                } else if (categoriarecurso === "musica")
                {
                    url = `recursos/iconos/iconos recuros/musica.png`;
                } else if (categoriarecurso === "Imagenes")
                {
                    url = `recursos/iconos/iconos recuros/imagen.png`;
                } else if (categoriarecurso === "Audio")
                {
                    url = `recursos/iconos/iconos recuros/audio.png`;
                } else
                {
                    url = `recursos/iconos/iconos recuros/todo.png`;
                }


                htmlTabla += `<tr>
                                    <th>
                                        <div  id="cardRecurso${idrecurso}" class="card" style="border: 1px solid #c4c4c4;  " role="alert">
                                                <div class="card-header ">
                                                <div class="row">
                                                   <h5 class="card-title col-lg-11"> ${recurso}</h5> 
                                                     <div class="col-lg-1"> <img class="float-right " src="${url}" width="35"></div>
                                                </div>                                                   
                                                 </div>
                                                <div class="card-body">
                                                        <div class="row">
                                                                    <div class="col-lg-4">
                                                                         <h6><b>Categoria:</b> ${categoriarecurso}</h6>
                                                                         <h6><b>Discapacidad:</b> ${discapacidad}</h6>
                                                                         
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                        <h6><b>Estado:</b> ${estado}</h6> 
                                                                         <h6> <b>Etiquetas: </b> ${etiquetas}</h6>
                                                                    </div> 
                                                                        <div class="col-lg-12">
                                                                          <b>Descripción:</b>
                                                                          <p>${descripcion}</p>
                                                                        </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row p-0">
                                                            <div class="col-lg-12 pl-3">     
                                                                <button onclick="seleccionarRecurso(${idrecurso})" type="button" class="btn btn-info btn-sm bi bi-pencil-fill"> Seleccionar</button>
                                                                <button onclick="eliminarRecurso(${idrecurso})" type="button" class="btn btn-danger btn-sm bi bi-person-dash-fill"> Eliminar</button>
                                                                <button onclick="verArchivo(${idrecurso})" type="button" class="btn btn-success btn-sm bi bi-journals"> Ver archivo</button>
                                                            </div>        
                                                        </div>
                                                 </div>                                                                                               
                                             
                                            </div>
                                     </th>
                </tr>
                                   `;
            }
            var tbl_recursos = document.getElementById("tbl_recursos");
            tbl_recursos.innerHTML = htmlTabla;
            BotonCancelar();
        },
        error: function (error) {
            console.log(error);
        }
    });
}

$(document).ready(function () {


    $("#buscadorRecursos").keyup(function () {
        _this = this;
        // Show only matching TR, hide rest of them
        $.each($("#tblRecursos tbody tr"), function () {
            if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                $(this).hide();
            else
                $(this).show();
        });
    });
    $('#enlaceC').hide();
    $("#checkArchivo").click(function () {
        $('#fileC').show();
        $('#enlaceC').hide();
    });
    $("#checkEnlace").click(function () {

        $('#enlaceC').show();
        $('#fileC').hide();
    });
    $('#btn_cancelarRecurso').click(function () {
        BotonCancelar();
    });
    $('#btn_modificarRecurso').click(function () {
        var ruta = base64;
        var idcategoriarecurso = document.getElementById("cmb-categoria").value;
        var iddiscapacidad = document.getElementById("cmb-discapacidad").value;
        var recurso = document.getElementById("txtRecurso").value;
        var descripcion = document.getElementById("txt-descripcionRecurso").value;
        var etiquetas = document.getElementById("txt-etiquetaa").value;
        var checkArchivo = document.getElementById("checkArchivo").checked;
        var checkEnlace = document.getElementById("checkEnlace").checked;
        var datosM;
        if (checkArchivo) {
            datos =
                    {"idrecurso": idRecursoMod, "idcategoriarecurso": idcategoriarecurso,
                        "iddiscapacidad": iddiscapacidad,
                        "recurso": recurso,
                        "descripcion": descripcion,
                        "etiquetas": etiquetas,
                        "estado": "true",
                        "accion": 4,
                        "ruta": ruta,
                        "host": window.location.host
                    };
        } else if (checkEnlace) {
            datos =
                    {"idrecurso": idRecursoMod, "idcategoriarecurso": idcategoriarecurso,
                        "iddiscapacidad": iddiscapacidad,
                        "recurso": recurso,
                        "descripcion": descripcion,
                        "etiquetas": etiquetas,
                        "estado": "false",
                        "accion": 5,
                        "ruta": document.getElementById("txtEnlace").value
                    };
        }
        if (datos.idrecurso.length > 0 &&
                datos.idcategoriarecurso.length > 0 &&
                datos.iddiscapacidad.length > 0 &&
                datos.recurso.length > 0 &&
                datos.descripcion.length > 0 &&
                datos.etiquetas.length > 0 &&
                datos.ruta.length > 0
                )
        {
            $.ajax({
                method: "POST",
                url: "RecursoSrv",
                data: datos,
                success: function (data) {
                    alerta("Archivo guardado con exito", "success");
                    tbl_recursos();
                    modRecurso = false;
                },
                error: function (error) {
                    alerta("Algo salio mal al guardar el archivo", "error");
                }
            });
        } else {
            alerta("Llene todos los campos", "info");
        }

    });
});
function guardarRecurso() {

    var ruta = base64;
    var idcategoriarecurso = document.getElementById("cmb-categoria").value;
    var iddiscapacidad = document.getElementById("cmb-discapacidad").value;
    var recurso = document.getElementById("txtRecurso").value;
    var descripcion = document.getElementById("txt-descripcionRecurso").value;
    var etiquetas = document.getElementById("txt-etiquetaa").value;
    var checkArchivo = document.getElementById("checkArchivo").checked;
    var checkEnlace = document.getElementById("checkEnlace").checked;
    var datosM;
    if (checkArchivo) {
        datos =
                {"idcategoriarecurso": idcategoriarecurso,
                    "iddiscapacidad": iddiscapacidad,
                    "recurso": recurso,
                    "descripcion": descripcion,
                    "etiquetas": etiquetas,
                    "estado": "true",
                    "accion": 1,
                    "ruta": ruta,
                    "host": window.location.host
                };
    } else if (checkEnlace) {
        datos =
                {"idcategoriarecurso": idcategoriarecurso,
                    "iddiscapacidad": iddiscapacidad,
                    "recurso": recurso,
                    "descripcion": descripcion,
                    "etiquetas": etiquetas,
                    "estado": "false",
                    "accion": 2,
                    "ruta": document.getElementById("txtEnlace").value
                };
    }
    if (
            datos.idcategoriarecurso.length > 0 &&
            datos.iddiscapacidad.length > 0 &&
            datos.recurso.length > 0 &&
            datos.descripcion.length > 0 &&
            datos.etiquetas.length > 0 &&
            datos.ruta.length > 0
            )
    {

        $.ajax({
            method: "POST",
            url: "RecursoSrv",
            data: datos,
            success: function (data) {
                alerta("Archivo guardado con exito", "success");
                tbl_recursos();
                modRecurso = false;
            },
            error: function (error) {
                alerta("Algo salio mal al guardar el archivo", "error");
            }
        });

    } else {
        alerta("Llene todos los campos", "info");
    }


}
var html;
traerCategoriaRecurso();
var jsonCategoriaRecuros;
function traerCategoriaRecurso() {

    $.ajax({
        method: "GET",
        url: "CategoriaRecursoSrv",
        success: function (data) {
            jsonCategoriaRecuros = data;
            html = `<option value="" selected disabled hidden></option>`;
            for (var i = 0; i < jsonCategoriaRecuros.CategoriaRecurso.length; i++)
            {
                var idcategoriarecurso = jsonCategoriaRecuros.CategoriaRecurso[i].idcategoriarecurso;
                var categoriarecurso = jsonCategoriaRecuros.CategoriaRecurso[i].categoriarecurso;
                html += `<option value="${idcategoriarecurso}">${categoriarecurso}</option>`;
            }
            var cmbCategoria = document.getElementById("cmb-categoria");
            cmbCategoria.innerHTML = html;
        },
        error: function (error) {
            console.log(error);
        }
    });
}
function eliminarRecurso(x) {
    console.log(x);
    datos = {"idrecurso": x, "accion": 3};
    swal({
        title: "¿Desea Eliminar este Recurso?",
        //text: "Once deleted, you will not be able to recover this imaginary file!",
        icon: "warning",
        buttons: true,
        dangerMode: true
    }).then((willDelete) => {
        if (willDelete) {
            $.ajax({
                method: "POST",
                url: "RecursoSrv",
                data: datos,
                success: function (data) {
                    alerta("Archivo Eliminado con exito", "success");
                    tbl_recursos();
                },
                error: function (error) {
                    alerta("Algo salio mal al Eliminar el archivo", "error");
                }
            });
        } else {
//swal("Your imaginary file is safe!");
        }
    });
}
var modRecurso = false;
var idRecursoMod;
var anterio = "";
function seleccionarRecurso(x) {

    if (anterio.length > 0) {
        var card = document.getElementById("cardRecurso" + x);
        card.className = "card"
    }
    document.getElementById("cardRecurso" + x).className = "card text-white cajas bg-primary"


    for (var i of jsonRecursos.Recurso) {
        if (i.idrecurso == x) {
            var estado = i.estado;
            idRecursoMod = i.idrecurso;
            modRecurso = true;
            $('#cmb-categoria').val(i.idcategoriarecurso);
            $('#cmb-discapacidad').val(i.iddiscapacidad);
            $('#txtRecurso').val(i.recurso);
            $('#txt-descripcionRecurso').val(i.descripcion);
            $('#txt-etiquetaa').val(i.etiquetas);
            if (estado == "true") {
                document.getElementById('checkArchivo').click();
                $('#formFile').val(i.ruta);
            } else {
                document.getElementById('checkEnlace').click();
                $('#txtEnlace').val(i.ruta);
            }
            $('#btnGuardaRecurso').hide("slow");
            $('#btn_modificarRecurso').show("2000");
            $('#btn_cancelarRecurso').show("2000");
        }
    }
    anterio = x + "";
}
function BotonCancelar() {
    $('#btnGuardaRecurso').show("2000");
    $('#btn_cancelarRecurso').hide("slow");
    $('#btn_modificarRecurso').hide("slow");
}
