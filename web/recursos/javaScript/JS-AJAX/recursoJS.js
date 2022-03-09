var formData;
var base64;
var jsonRecursos;
tbl_recursos();
BotonCancelar();
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
function verArchivo(ruta) {
    var ruta2 = jsonRecursos.Recurso[ruta].ruta;
    var rutaDefinitiva=ruta2.replace(`http:/`,`http://`)
    window.open(rutaDefinitiva, null);
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
                var url = `https://img.icons8.com/color/48/000000/folder-invoices--v1.png`;
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
                                                                                                                                             
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                         <h6><b>Discapacidad:</b> ${discapacidad}</h6>    
                                                                    </div>
                                                                    <div class="col-lg-4">
                                                                         <h6> <b>Etiquetas: </b> ${etiquetas}</h6>
                                                                    </div> 
                                                                        <div class="col-lg-12">
                                                                          <b>Descripción:</b>
                                                                          <p style="font-style: normal; font-weight:normal;" >${descripcion}</p>
                                                                        </div>
                                                        </div>
                                                        <hr>
                                                        <div class="row p-0">
                                                            <div class="col-lg-12 pl-3">     
                                                                <button onclick="seleccionarRecurso(${idrecurso})" type="button" class="btn btn-info btn-sm bi bi-pencil-fill"> Seleccionar</button>
                                                                <button onclick="eliminarRecurso(${idrecurso})" type="button" class="btn btn-danger btn-sm bi bi-person-dash-fill"> Eliminar</button>
                                                                <a  onclick="verArchivo(${i})"  class="btn btn-success blanco btn-sm bi bi-journals"> Ver archivo</a>
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
            document.getElementById("tbl_recursos").innerHTML="";
            console.log(error);
        }
    });
}

$(document).ready(function () {

    $('#cmb-categoria').change(function () {
        var tipo_archivo = $('select[id="cmb-categoria"] option:selected').text();
        if (tipo_archivo == "Archivo")
        {
            $("#checkArchivo").attr("disabled", false);
            $("#checkArchivo").attr("disabled", false);
            $("#formFile").attr("accept", ".doc,.pdf,.docx");

        } else if (tipo_archivo == "Video")
        {
            $("#checkEnlace").click();
            $("#checkArchivo").attr("disabled", true);
        } else if (tipo_archivo == "Imagen")
        {
            $("#checkArchivo").attr("disabled", false);
            $("#checkArchivo").attr("disabled", false);
            $("#formFile").attr("accept", ".jpg,.jpeg,.png, image/gif");

        } else if (tipo_archivo == "Juegos")
        {
            $("#checkEnlace").click();
            $("#checkArchivo").attr("disabled", true);
        }else if (tipo_archivo == "Audio")
        {
            $("#checkEnlace").click();
            $("#checkArchivo").attr("disabled", true);
        } 
        else if (tipo_archivo == "Pagína")
        {
            $("#checkEnlace").click();
            $("#checkArchivo").attr("disabled", true);
        } 
    });
    $("#buscadorRecursos").keyup(function () {
        _this = this;
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
        var ruta = '';
        var frmData = new FormData();
        var datosM;
        if (checkArchivo) {

            ruta = document.querySelector('#formFile').files[0]

            frmData.append('idrecurso', idRecursoMod);           
            frmData.append('idcategoriarecurso', idcategoriarecurso);
            frmData.append('iddiscapacidad', iddiscapacidad);
            frmData.append('recurso', recurso);
            frmData.append('descripcion', descripcion);
            frmData.append('etiquetas', etiquetas);
            frmData.append('estado', true);
            frmData.append('accion', 4);
            frmData.append('host', window.location.protocol + '//' + window.location.host);
            frmData.append('ruta', ruta);


        } else if (checkEnlace) {

            ruta = document.getElementById("txtEnlace").value;

            frmData.append('idrecurso', idRecursoMod);
            frmData.append('idcategoriarecurso', idcategoriarecurso);
            frmData.append('iddiscapacidad', iddiscapacidad);
            frmData.append('recurso', recurso);
            frmData.append('descripcion', descripcion);
            frmData.append('etiquetas', etiquetas);
            frmData.append('estado', false);
            frmData.append('accion', 5);
            frmData.append('ruta', ruta);

        }
        if (ruta && idcategoriarecurso.length > 0 && idRecursoMod.length &&
                iddiscapacidad.length > 0 && recurso.length > 0 &&
                descripcion.length > 0 && etiquetas.length > 0)
        {

            $.ajax({
                method: "POST",
                url: "RecursoSrv",
                data: frmData,
                processData: false,
                contentType: false,
                success: function (data) {
                    alerta("Archivo guardado con exito", "success");
                    tbl_recursos();
                    modRecurso = false;
                    limpiar();
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

var html;
traerCategoriaRecurso();
var jsonCategoriaRecuros;
var modRecurso = false;
var idRecursoMod;
var anterio = "";
var rutaSeleccionador="";
function limpiar() {      
        $('#cmb-discapacidad').val('').prop('selectedIndex', 0);
        $('#cmb-categoria').val('').prop('selectedIndex', 0);
        $('#txtRecurso').val('');
        $('#txt-descripcionRecurso').val('');
        $('#txt-etiquetaa').val('');        
    }
function guardarRecurso() {

    var ruta = base64;
    var idcategoriarecurso = document.getElementById("cmb-categoria").value;
    var iddiscapacidad = document.getElementById("cmb-discapacidad").value;
    var recurso = document.getElementById("txtRecurso").value;
    var descripcion = document.getElementById("txt-descripcionRecurso").value;
    var etiquetas = document.getElementById("txt-etiquetaa").value;
    var checkArchivo = document.getElementById("checkArchivo").checked;
    var checkEnlace = document.getElementById("checkEnlace").checked;
    var ruta;
    var datosM;
    var frmData = new FormData();
    console.log(base64);
    if (checkArchivo) {
        ruta = document.querySelector('#formFile').files[0]
        frmData.append('idcategoriarecurso', idcategoriarecurso);
        frmData.append('iddiscapacidad', iddiscapacidad);
        frmData.append('recurso', recurso);
        frmData.append('descripcion', descripcion);
        frmData.append('etiquetas', etiquetas);
        frmData.append('estado', true);
        frmData.append('accion', 1);
        frmData.append('host', window.location.protocol + '//' + window.location.host);
        frmData.append('ruta', ruta);

    } else if (checkEnlace) {
        ruta = document.getElementById("txtEnlace").value;
        frmData.append('idcategoriarecurso', idcategoriarecurso);
        frmData.append('iddiscapacidad', iddiscapacidad);
        frmData.append('recurso', recurso);
        frmData.append('descripcion', descripcion);
        frmData.append('etiquetas', etiquetas);
        frmData.append('estado', false);
        frmData.append('accion', 2);
        frmData.append('ruta', ruta);
    }

    if (ruta && idcategoriarecurso.length > 0 &&
            iddiscapacidad.length > 0 && recurso.length > 0 &&
            descripcion.length > 0 && etiquetas.length > 0)
    {
        $.ajax({
            method: "POST",
            url: "RecursoSrv",
            data: frmData,
            processData: false,
            contentType: false,
            success: function (data) {
                alerta("Archivo guardado con exito", "success");
                tbl_recursos();
                modRecurso = false;
                limpiar();
            },
            error: function (error) {
                alerta("Algo salio mal al guardar el archivo", "error");
            }
        });

    } else {
        alerta("Llene todos los campos", "info");
    }


}
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
    //datos = {"idrecurso": x, "accion": 3};
    Swal.fire({
        title: "¿Desea Eliminar este Recurso?",
        icon: 'warning',
        showDenyButton: true,
        confirmButtonText: 'No',
        denyButtonText: `Si`,
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({text: "Eliminación cancelada", icon: "info"});
        } else if (result.isDenied) {
            var frmData = new FormData();
            frmData.append('idrecurso', x);
            frmData.append('accion', 3);

            $.ajax({
                method: "POST",
                url: "RecursoSrv",
                data: frmData,
                processData: false,
                contentType: false,
                success: function (data) {
                    alerta("Archivo Eliminado con exito", "success");
                    tbl_recursos();
                    informacionExtreDiscapacidad();
                    limpiar();
                },
                error: function (error) {
                     tbl_recursos();
                    alerta("Algo salio mal al Eliminar el archivo", "error");
                }
            });
        }
    });
}
function seleccionarRecurso(x) {
    idRecursoMod = x;
    if (anterio.length > 0) {
        var card = document.getElementById("cardRecurso" + anterio);
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
                 rutaSeleccionador= i.ruta;
//                $('#formFile').val(i.ruta);
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

