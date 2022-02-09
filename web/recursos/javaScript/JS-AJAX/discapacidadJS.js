var jsonCategoria;
var jsonDiscapacidades;
var jsonConceptos;
var nConceptos = 0;

$(document).ready(function () {

    cargarCategoriaDiscapacidades();
    cargarDiscapacidades();
    $('#btnGuardarDiscapacidad').on('click', function () {
        var idCategoriaDiscapacidad = document.getElementById("cmbId\n\s.CategoriDiscapacidad").value;
        var nombreDiscapacidad = document.getElementById("txtNombreDiscapacidad").value;
        var datos = {"discapacidad": nombreDiscapacidad, "idCategoriaDiscapacidad": idCategoriaDiscapacidad, "accion": "1"};
        $.ajax({
            method: "POST",
            url: "DiscapacidadSrv",
            data: datos,
            success: function (data) {
                console.log(data);
                document.getElementById("btnClickCerrar").click();
                alerta(`Discapacidad ${nombreDiscapacidad} añadida con exito`, "success");
                cargarDiscapacidades();

            },
            error: function (error) {
                console.log(error);
                alerta("Algo salio mal" + error, "error");
            }
        });

    });
    $('#btnAnadirConcepto').on('click', function () {
        var idDiscapacidad = localStorage.getItem('idDiscapacidad');
        if (idDiscapacidad !== null)
        {
            swal("¿Quiere añadir un concepto a la discapacidad seleccionada?", {
                buttons: {
                    cancel: "Cancelar",
                    si: {
                        text: "Sí",
                        value: "Si",
                        className: "btn btn-success",
                    },
                    no: {
                        text: "No",
                        value: "No",
                        className: "btn btn-warning",
                    }
                }
            })
                    .then((value) => {
                        switch (value) {

                            case "Si":
                                window.location.href = "redactar.jsp";
                                break;

                            case "No":
                                localStorage.removeItem("idDiscapacidad");
                                window.location.href = "redactar.jsp";
                                break;

                            default:

                        }
                    });
        } else
        {
            window.location.href = "redactar.jsp";
        }
    });


});
function cargarCategoriaDiscapacidades()
{
    $.ajax({
        method: "GET",
        url: "CategoriaDiscapacidadSrv",
        success: function (data) {
            jsonCategoria = data;
            var html = `<option value="" selected disabled hidden></option>`;
            for (var i = 0; i < jsonCategoria.CategoriaDiscapacidad.length; i++)
            {
                var idCategoria = jsonCategoria.CategoriaDiscapacidad[i].idcategoriadiscapacidad;
                var nombreCategoria = jsonCategoria.CategoriaDiscapacidad[i].categoriadiscapacidad;
                html += `<option value="${idCategoria}">${nombreCategoria}</option>`;

            }
            var cmbCatDiscapacidades = document.getElementById("cmbIdCategoriDiscapacidad");
            cmbCatDiscapacidades.innerHTML = html;

        },
        error: function (error) {
            console.log(error);
        }
    });
}
function cargarDiscapacidades()
{

    $.ajax({
        method: "GET",
        url: "DiscapacidadSrv",
        success: function (data) {
            jsonDiscapacidades = JSON.parse(data);
            var htmlTabla = ``;
            var cmbDiscapacidades = `<option value="" selected disabled hidden></option>`;
            for (var i = 0; i < jsonDiscapacidades.Discapacidad.length; i++)
            {
                var idDiscapacidad = jsonDiscapacidades.Discapacidad[i].iddiscapacidad;
                var nombreCategoriaDiscapacidad = jsonDiscapacidades.Discapacidad[i].categoriadiscapacidad;
                var idCategoriaDiscapacidad = jsonDiscapacidades.Discapacidad[i].idcategoriadiscapacidad;
                var nombreDiscapacidad = jsonDiscapacidades.Discapacidad[i].discapacidad;
                htmlTabla += `<tr style="border-radius:10px ">
                                    <th>${i + 1}</th>
                                    <td>${nombreDiscapacidad}</td>
                                    <td>${nombreCategoriaDiscapacidad}</td>
                                        <td>
                                            <div class="btn-group" role="group" aria-label="Basic example">
                                            <button id="d${idDiscapacidad}" onclick=seleccionarDiscapacidad("${idDiscapacidad}") type="button" class="btn btn-info btn-sm bi bi-check-circle"></button> 
                                            <button onclick=modificarDiscapacidad("${idDiscapacidad}") type="button" class="btn btn-warning btn-sm bi bi-pencil-fill"></button> 
                                            <button onclick=eliminarDiscapacidad("${idDiscapacidad}") type="button" class="btn btn-danger btn-sm bi bi-x-square"></button>   
                                            </div>
                                        </td>                                 
                                  </tr>`;
                cmbDiscapacidades += `<option value="${idDiscapacidad}">${nombreDiscapacidad}</option>`;
            }

            var tbl_Discapacidad = document.getElementById("tbl_Discapacidad");
            var cmb_Discapacidad = document.getElementById("cmb-discapacidad");
            tbl_Discapacidad.innerHTML = htmlTabla;
            cmb_Discapacidad.innerHTML = cmbDiscapacidades;

        },
        error: function (error) {

        }
    });


}
function eliminarDiscapacidad(idDiscapacidad)
{
    swal("¿Esta seguro querer eliminar esta discapacidad?", {
        buttons: {
            cancel: "Cancelar",
            si: {
                text: "Sí",
                value: "Si",
                className: "btn btn-success",
            },
            no: {
                text: "No",
                value: "No",
                className: "btn btn-warning",
            }
        }
    })
            .then((value) => {
                switch (value) {

                    case "Si":
                        $.ajax({
                            method: "POST",
                            url: "DiscapacidadSrv",
                            data: {"idDiscapacidad": idDiscapacidad, "accion": "2"},
                            success: function (data) {

                                swal({text: "Discapacidad eliminada", icon: "success"});
                                cargarDiscapacidades();
                            },
                            error: function (error) {
                                console.log(error);

                                swal({text: "No se pudo eliminar la discapacidad", icon: "error"});

                            }
                        });
                        break;

                    case "No":
                        swal({text: "Eliminación cancelada", icon: "info"});
                        break;

                    default:

                }
            });

}
function navegacionConceptos(n)
{
    var contenedor = document.getElementById("containerConceptos");
    var pag = document.getElementById("pag");

    nConceptos = nConceptos + n;
    if (nConceptos < 0)
    {
        nConceptos = 0;
    }
    if (nConceptos > jsonConceptos.Concepto.length)
    {
        nConceptos = jsonConceptos.Concepto.length - 1;
    }
    var html = "";
    var titulo = jsonConceptos.Concepto[nConceptos].discapacidad;
    var descripcion = jsonConceptos.Concepto[nConceptos].descripcion;
    var idConcepto = jsonConceptos.Concepto[nConceptos].idconcepto;

   html = `<div class="card col-lg-12" style="width:100%; height: 75vh; background:white; border-radius: 10px; overflow-y:auto;">
                            <div  class="card-body" style="height: 80vh; overflow-y:auto; ">
                                <div id="contenedoDescripcion" style="zoom:100%" class="card-text">${descripcion}</div>                              
                            </div>
                            <div class="card-footer text-muted">
                                    <button onClick="modificarConcepto(${idConcepto})" class="btn btn-warning">Modificar</button>
                                    <button onClick="eliminarConcepto(${idConcepto})" class="btn btn-danger ">Eliminar</button>  
                                <div class=" float-right">                                  
                                   <input class="mr-2" list="tickmarks" onmousemove="labelZoom()"  id="cantidadZoom" type="range" value="100" >
                                   <label   id="valorZoom">50%</label>
                                </div>
                            </div>
                        </div>`;
    contenedor.innerHTML = html;
    pag.innerHTML = (nConceptos + 1);
}

function labelZoom()
{
    var cantidadZoom = document.getElementById("cantidadZoom");
    var valorZoom= document.getElementById("valorZoom");    
    valorZoom.innerText = cantidadZoom.value+"%";
    
    var contenedoDescripcion = document.getElementById("contenedoDescripcion");
    contenedoDescripcion.style.cssText = `zoom:${cantidadZoom.value}%`;
    
}
function seleccionarDiscapacidad(idDiscapacidad)
{
    var contenedor = document.getElementById("containerConceptos");
    localStorage.setItem("idDiscapacidad", idDiscapacidad);
    var numero = document.getElementById("cont");
    var pag = document.getElementById("pag");
    var html = "";
    contenedor.innerHTML = "";
    $.ajax({
        method: "GET",
        url: "ConceptoSrv",
        data: {"busqueda": idDiscapacidad, "tipobusqueda": "1"},
        success: function (data) {
            try {
                jsonConceptos = JSON.parse(data);
                console.log(jsonConceptos);
                var titulo = jsonConceptos.Concepto[0].discapacidad;
                var descripcion = jsonConceptos.Concepto[0].descripcion;
                var idConcepto = jsonConceptos.Concepto[0].idconcepto;

                html = `<div class="card col-lg-12" style="width:100%; height: 75vh; background:white; border-radius: 10px; overflow-y:auto;">
                            <div  class="card-body" style="height: 80vh; overflow-y:auto; ">
                                <div id="contenedoDescripcion" style="zoom:100%" class="card-text">${descripcion}</div>                              
                            </div>
                            <div class="card-footer text-muted">
                                    <button onClick="modificarConcepto(${idConcepto})" class="btn btn-warning">Modificar</button>
                                    <button onClick="eliminarConcepto(${idConcepto})" class="btn btn-danger ">Eliminar</button>  
                                <div class=" float-right">                                  
                                   <input class="mr-2" list="tickmarks" onmousemove="labelZoom()"  id="cantidadZoom" type="range" value="100" >
                                   <label  id="valorZoom">50%</label>
                                </div>
                            </div>
                        </div>`;
                contenedor.innerHTML = html;
                pag.innerHTML = 1;
                numero.innerHTML = jsonConceptos.Concepto.length;
            } catch (e)
            {
                html = `<div class="card p-5 justify-content-center" style="width:100%; height: 80vh; overflow-y:auto;  ">                            
                            <div class="alert alert-danger m-auto" style="width: 50%">    
                             <h3 class="bi bi-exclamation-triangle-fill" style="font-size: 25px"> No contiene coneptos</h3>                            
                             <hr style="border: 1px  solid">
                             <p>La discapacidad seleccionada no contiene ningún concepto o no se pudo cargar los conceptos esta discapacidad</p>
                            </div> 
                        </div>`;
                contenedor.innerHTML = html;
            }

        },
        error: function (error) {
            console.log(error);


        }
    });
}
function eliminarConcepto(idConcepto)
{

    $.ajax({
        method: "POST",
        url: "ConceptoSrv",
        data: {"idconcepto": idConcepto, "accion": "3"},
        success: function (data) {

            swal({text: "Concepto eliminado con exito", icon: "success"});

        },
        error: function (error) {
            console.log(error);

            swal({text: "No se pudo eliminar el concepto", icon: "error"});

        }
    });
}
function alerta(texto, icono)
{
    swal({text: texto, icon: icono});
}
function resultado()
{
    document.getElementById("resu").innerHTML = document.getElementById("descripcion").innerHTML;
    var aux = document.getElementById("resu").textContent;
    document.getElementById("resu").innerHTML = aux;
    return aux;
}