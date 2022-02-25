var jsonCategoria;
var jsonDiscapacidades;
var jsonConceptos;
var jsonInformacionExtraDiscapacidades;
var nConceptos = 0;
var IdDiscapacidad = -1;
var anterio = "";
var actual="";
$(document).ready(function () {

    informacionExtreDiscapacidad();
    cargarCategoriaDiscapacidades();
    cargarDiscapacidades();
    $('#btnGuardarDiscapacidad').on('click', function () {
        var idCategoriaDiscapacidad = document.getElementById("cmbIdCategoriDiscapacidad").value;
        var nombreDiscapacidad = document.getElementById("txtNombreDiscapacidad").value;

        if (idCategoriaDiscapacidad.length > 0 && nombreDiscapacidad.length > 0)
        {

            if (validarExistenciaDiscapacidades())
            {
                if (IdDiscapacidad > 0) {
                    var datos = {"discapacidad": nombreDiscapacidad, "idDiscapacidad": IdDiscapacidad, "idCategoriaDiscapacidad": idCategoriaDiscapacidad, "accion": "3"};
                } else {
                    var datos = {"discapacidad": nombreDiscapacidad, "idCategoriaDiscapacidad": idCategoriaDiscapacidad, "accion": "1"};
                }
                $.ajax({
                    method: "POST",
                    url: "DiscapacidadSrv",
                    data: datos,
                    success: function (data) {
                        //console.log(data);
                        document.getElementById("btnClickCerrar").click();
                        alerta(`Discapacidad ${nombreDiscapacidad} añadida con exito`, "success");
                        cargarDiscapacidades();

                    },
                    error: function (error) {
                        console.log(error);
                        alerta("Algo salió mal" + error, "error");
                    }
                });
            } else
            {
                alerta("Esta discapacidad ya esta registrada", "info");
            }
        } else
        {
            alerta("Llene todo los campos", "info");
        }
    });
    $("#btnClickCerrar").click(function (e) {
        $('#cmbIdCategoriDiscapacidad').val('');
        $('#txtNombreDiscapacidad').val('');
        $('#btnGuardarDiscapacidad').text('Guardar discacidad');
        $('#btnGuardarDiscapacidad').css("background", "");
        IdDiscapacidad = -1;
    });
    $("#addDiscapacidad").click(function (e) {
        $('#cmbIdCategoriDiscapacidad').val('');
        $('#txtNombreDiscapacidad').val('');
        $('#btnGuardarDiscapacidad').text('Guardar discacidad');
        $('#btnGuardarDiscapacidad').css("background", "");
        IdDiscapacidad = -1;
    });
    $('#btnAnadirConcepto').on('click', function () {
        var idDiscapacidad = localStorage.getItem('idDiscapacidad');
        if (idDiscapacidad !== null)
        {
            Swal.fire({
                title: '¿Quiere añadir un concepto a la discapacidad seleccionada?',
                showDenyButton: true,
                confirmButtonText: 'No',
                denyButtonText: `Si`,
            }).then((result) => {
                if (result.isConfirmed) {
                    localStorage.removeItem("idDiscapacidad");
                    window.location.href = "redactar.jsp";
                } else if (result.isDenied) {
                    window.location.href = "redactar.jsp";

                }
            });
        } else
        {
            window.location.href = "redactar.jsp";
        }
    });
    $("#buscadorDiscapacidades").keyup(function () {
        _this = this;
        $.each($("#tblDiscapacidad tbody tr"), function () {
            if ($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                $(this).hide();
            else
                $(this).show();
        });
    });
});
function validarExistenciaDiscapacidades() {

    var nombreDiscapacidad = document.getElementById("txtNombreDiscapacidad").value;
    for (var i = 0; i < jsonDiscapacidades.Discapacidad.length; i++)
    {
        var nombreDiscapacidad2 = jsonDiscapacidades.Discapacidad[i].discapacidad;
        if (nombreDiscapacidad2 == nombreDiscapacidad)
        {
            return false;
            break;
        }
    }
    return true;
}
function modificarDiscapacidad(idDis) {
    $('#addDiscapacidad').click();
    $('#btnGuardarDiscapacidad').text('Modificar');
    $('#btnGuardarDiscapacidad').css("background", "#218838");
    IdDiscapacidad = idDis;
    for (var x of jsonDiscapacidades.Discapacidad) {
        if (x.iddiscapacidad == idDis) {
            //console.log(x);
            $('#cmbIdCategoriDiscapacidad').prop('selectedIndex', x.idcategoriadiscapacidad);
            $('#txtNombreDiscapacidad').val(x.discapacidad);
        }
    }
}
function cargarCategoriaDiscapacidades() {
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
function cargarDiscapacidades() {

    $.ajax({
        method: "GET",
        url: "DiscapacidadSrv",
        success: function (data) {
            jsonDiscapacidades = JSON.parse(data);
            var htmlTabla = ``;
            var cmbDiscapacidades = `<option value="" selected disabled hidden></option>`;
            document.getElementById("caounDiscapacidades").innerHTML = jsonDiscapacidades.Discapacidad.length;
            for (var i = 0; i < jsonDiscapacidades.Discapacidad.length; i++)
            {
                var idDiscapacidad = jsonDiscapacidades.Discapacidad[i].iddiscapacidad;
                var nombreCategoriaDiscapacidad = jsonDiscapacidades.Discapacidad[i].categoriadiscapacidad;
                var idCategoriaDiscapacidad = jsonDiscapacidades.Discapacidad[i].idcategoriadiscapacidad;
                var nombreDiscapacidad = jsonDiscapacidades.Discapacidad[i].discapacidad;
                htmlTabla += `<tr style="border-radius:10px ">
                                   
                                    <td>${nombreDiscapacidad}</td>
                                    <td>${nombreCategoriaDiscapacidad}</td>
                                        <td>
                                            <div class="btn-group" role="group" aria-label="Basic example">
                                            <button style=" font-size: 10px" id="d${idDiscapacidad}" onclick=seleccionarDiscapacidad("${idDiscapacidad}") type="button" class="btn btn-info btn-sm bi bi-circle "></button> 
                                            <button style=" font-size: 10px"  onclick=modificarDiscapacidad("${idDiscapacidad}") type="button" class="btn btn-warning btn-sm bi bi-pencil-fill "></button> 
                                            <button style=" font-size: 10px"  onclick=eliminarDiscapacidad("${idDiscapacidad}") type="button" class="btn btn-danger btn-sm bi bi-x-square "></button>   
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
function informacionExtreDiscapacidad() {

    $.ajax({
        method: "GET",
        url: "reporteSrv",
        success: function (data) {
            jsonInformacionExtraDiscapacidades = JSON.parse(data);

        },
        error: function (error) {

        }
    });


}
function eliminarDiscapacidad(idDiscapacidad) {
    for (var i = 0; i < jsonInformacionExtraDiscapacidades.Discapacidad.length; i++)
    {
        if (jsonInformacionExtraDiscapacidades.Discapacidad[i].iddiscapacidad === idDiscapacidad)
        {
            var Nrecurso = jsonInformacionExtraDiscapacidades.Discapacidad[i].recursos;
            var Nconceptos = jsonInformacionExtraDiscapacidades.Discapacidad[i].conceptos;

            if (Nrecurso == "0" && Nconceptos == "0")
            {

                Swal.fire({
                    title: 'Estas seguro de eliminar esta discapacidad?',
                    showDenyButton: true,
                    confirmButtonText: 'No',
                    denyButtonText: `Si`,
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({text: "Eliminación cancelada", icon: "info"});
                    } else if (result.isDenied) {
                        $.ajax({
                            method: "POST",
                            url: "DiscapacidadSrv",
                            data: {"idDiscapacidad": idDiscapacidad, "accion": "2"},
                            success: function (data) {

                                Swal.fire({text: "Discapacidad eliminada", icon: "success"});

                                cargarDiscapacidades();
                                informacionExtreDiscapacidad();

                            },
                            error: function (error) {
                                console.log(error);

                                Swal.fire({text: "No se pudo eliminar la discapacidad", icon: "error"});

                            }
                        });

                    }
                });


            } else
            {
                var html = `<div style="max-width: 100%" class="row justify-content-center align-content-center">
                            <div class="col-12">
                             <div class="alert alert-danger" role="alert">
                                   No puede eliminar esta discapacidad debido a que tiene elemento vinculados
                                  </div>       
                           </div>
                            <div class="col-lg-6 col-sm-6 col-6">
                                    <img width="100"   src="recursos/imagenes/002-folder.png" alt=""/>
                                          <h5 class="font-weight-bold text-center">${Nrecurso}</h5>
                            </div>
                            <div class="col-lg-6 col-sm-6 col-6">
                                     <img width="100"  src="recursos/imagenes/004-programmer.png" alt=""/> 
                                          <h5 class="font-weight-bold text-center">${Nconceptos}</h5>
                           </div>                                    
                      </div>`;
                Swal.fire({
                    title: '<h4>No se puede eliminar este elemento</h4>',
                    html: html,
                    showCloseButton: true,
                    confirmButtonText: '<i class="fa fa-thumbs-up"></i> Entendido!',
                });
            }




        }
    }


}
function navegacionConceptos(n) {
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
function labelZoom() {
    var cantidadZoom = document.getElementById("cantidadZoom");
    var valorZoom = document.getElementById("valorZoom");
    valorZoom.innerText = cantidadZoom.value + "%";

    var contenedoDescripcion = document.getElementById("contenedoDescripcion");
    contenedoDescripcion.style.cssText = `zoom:${cantidadZoom.value}%`;

}
function seleccionarDiscapacidad(idDiscapacidad) {

    actual=idDiscapacidad;

    if (anterio.length > 0) {
        var btnAux = document.getElementById("d" + anterio);
        btnAux.className = "btn btn-info btn-sm bi bi-circle"
    }
    document.getElementById("d" + idDiscapacidad).className = "btn btn-success btn-sm bi bi-check-circle"

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
                jsonConceptos = JSON.parse(data.replace(/\n/g, ""));
                var titulo = jsonConceptos.Concepto[0].discapacidad;
                var descripcion = jsonConceptos.Concepto[0].descripcion;
                var idConcepto = jsonConceptos.Concepto[0].idconcepto;

                html = `<div class="card col-lg-12" style="width:100%; height: 75vh; background:white; border-radius: 10px; overflow-y:auto;">
                            <div  class="card-body" style="height: 80vh; overflow-y:auto; ">
                                <div id="contenedoDescripcion" style="zoom:100%" class="card-text">${descripcion}</div>                              
                            </div>
                            <div class="card-footer text-muted">
                                    <button onClick="modificarConcepto(${idConcepto})" class="btn btn-sm btn-warning bi bi-pencil-square"> Modificar</button>
                                    <button onClick="eliminarConcepto(${idConcepto})" class="btn btn-sm btn-danger bi bi-x-circle-fill"> Eliminar</button>  
                                <div class=" float-right">                                  
                                   <input class="mr-2" list="tickmarks" onmousemove="labelZoom()"  id="cantidadZoom" type="range" value="100" >
                                   <label  id="valorZoom">50%</label>
                                </div>
                            </div>
                        </div>`;
                
                contenedor.innerHTML = html;
                pag.innerHTML = 1;
                numero.innerHTML = jsonConceptos.Concepto.length;

                $("#btnAnterio").attr("disabled", false);
                $("#btnSiguiente").attr("disabled", false);

            } catch (e)
            {
                
                $("#btnAnterio").attr("disabled", true);
                $("#btnSiguiente").attr("disabled", true);                
                pag.innerHTML = "#";
                numero.innerHTML = "#";                
                html = `<div class="card p-5 justify-content-center" style="width:100%; height: 80vh; overflow-y:auto;  ">  
                           
                            <div class="alert alert-danger m-auto" style="width: 50%">    
                           
                             <h3 class="bi bi-exclamation-triangle-fill" style="font-size: 25px"> No contiene conceptos   </h3>                            
                             <hr style="border: 1px  solid">
                             <p>La discapacidad seleccionada no contiene ningún concepto o no se pudo cargar la información</p>
                             <img width="100"  style="position: relative; left: 40%; " class="m-auto" src="recursos/imagenes/cat-png.gif" alt=""/>
                            </div> 
                        </div>`;
                contenedor.innerHTML = html;
            }

        },
        error: function (error) {
            console.log(error);


        }
    });
    anterio = idDiscapacidad + "";
}
function modificarConcepto(idModConcepto) {
    $(location).attr('href', "redactar.jsp");
    localStorage.setItem("JsonConcepto", JSON.stringify(jsonConceptos.Concepto));
    localStorage.setItem("idModConcepto", idModConcepto);
}
function eliminarConcepto(idConcepto) {

    Swal.fire({
        title: '¿Esta seguro de eliminar este concepto?',
        showDenyButton: true,
        confirmButtonText: 'No',
        denyButtonText: `Si`,
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({text: "Eliminación cancelada", icon: "info"});
        } else if (result.isDenied) {
            $.ajax({
                method: "POST",
                url: "ConceptoSrv",
                data: {"idconcepto": idConcepto, "accion": "3"},
                success: function (data) {

                  Swal.fire({text: "Concepto eliminado con exito", icon: "success"});
                  seleccionarDiscapacidad(actual);
                },
                error: function (error) {
                    console.log(error);

                    Swal.fire({text: "No se pudo eliminar el concepto", icon: "error"});

                }
            });
           
        }
    });


}
function alerta(texto, icono) {
    Swal.fire({text: texto, icon: icono});
}
function resultado() {
    document.getElementById("resu").innerHTML = document.getElementById("descripcion").innerHTML;
    var aux = document.getElementById("resu").textContent;
    document.getElementById("resu").innerHTML = aux;
    return aux;
}