//var jsonCategoria;
//var jsonDiscapacidades;
//var idDiscapacidad2 = localStorage.getItem('idDiscapacidad');
//$(document).ready(function () {
//
//    cargarCategoriaDiscapacidades();
//    cargarDiscapacidades();
//    function cargarCategoriaDiscapacidades()
//    {
//        $.ajax({
//            method: "GET",
//            url: "CategoriaDiscapacidadSrv",
//            success: function (data) {
//                jsonCategoria = data;
//                var html = `<option value="" selected disabled hidden></option>`;
//                for (var i = 0; i < jsonCategoria.CategoriaDiscapacidad.length; i++)
//                {
//                    var idCategoria = jsonCategoria.CategoriaDiscapacidad[i].idcategoriadiscapacidad;
//                    var nombreCategoria = jsonCategoria.CategoriaDiscapacidad[i].categoriadiscapacidad;
//                    html += `<option value="${idCategoria}">${nombreCategoria}</option>`;
//
//                }
//                var cmbCatDiscapacidades = document.getElementById("cmbIdCategoriDiscapacidad");
//                cmbCatDiscapacidades.innerHTML = html;
//
//            },
//            error: function (error) {
//                console.log(error);
//            }
//        });
//    }
//    function cargarDiscapacidades()
//    {
//
//        $.ajax({
//            method: "GET",
//            url: "DiscapacidadSrv",
//            success: function (data) {
//                jsonDiscapacidades = JSON.parse(data);
//
//                var cmbDiscapacidades = `<option value="" selected disabled hidden></option>`;
//                for (var i = 0; i < jsonDiscapacidades.Discapacidad.length; i++)
//                {
//                    var idDiscapacidad = jsonDiscapacidades.Discapacidad[i].iddiscapacidad;
//                    var nombreCategoriaDiscapacidad = jsonDiscapacidades.Discapacidad[i].categoriadiscapacidad;
//                    var idCategoriaDiscapacidad = jsonDiscapacidades.Discapacidad[i].idcategoriadiscapacidad;
//                    var nombreDiscapacidad = jsonDiscapacidades.Discapacidad[i].discapacidad;
//
//                    cmbDiscapacidades += `<option value="${idDiscapacidad}">${nombreDiscapacidad}</option>`;
//                }
//
//                var cmb_Discapacidad = document.getElementById("cmb-discapacidad");
//                cmb_Discapacidad.innerHTML = cmbDiscapacidades;
//                try {
//                    if (idDiscapacidad2.length > 0)
//                {
//                    cmb_Discapacidad.value = idDiscapacidad2;
//
//                }  
//                } catch (e) {
//                    
//                }
//
//               
//
//            },
//            error: function (error) {
//
//            }
//        });
//
//
//
//    }
//    $('#btnGuardarDiscapacidad').on('click', function () {
//        var idCategoriaDiscapacidad = document.getElementById("cmbIdCategoriDiscapacidad").value;
//        var nombreDiscapacidad = document.getElementById("txtNombreDiscapacidad").value;
//        var datos = {"discapacidad": nombreDiscapacidad, "idCategoriaDiscapacidad": idCategoriaDiscapacidad}
//        $.ajax({
//            method: "POST",
//            url: "DiscapacidadSrv",
//            data: datos,
//            success: function (data) {
//                document.getElementById("btnClickCerrar").click();
//                alerta(`Discapacidad ${nombreDiscapacidad} añadida con exito`, "success");
//                cargarDiscapacidades();
//
//            },
//            error: function (error) {
//                console.log(error);
//                alerta("Algo salio mal" + error, "error");
//            }
//        });
//
//    });
//    $('#btnGuardarConcepto').on('click', function () {
//
//        var htmlDescripcion = resultado();
//        var iDDiscapacidad = document.getElementById("cmb-discapacidad").value;
//        var etiquetas = document.getElementById("etiquetas").value;
//        var txttitulo = document.getElementById("txttitulo").value;
//        
//        var datos = {"idDiscapacidad": iDDiscapacidad,
//            "descripcion": htmlDescripcion,
//            "etiquetas": etiquetas+ `titulo: ${txttitulo}`, "accion": 1};
//        console.log(datos);
//
//        if (htmlDescripcion.length > 0)
//        {
//            if ((iDDiscapacidad.length * etiquetas.length) > 0) {
//
//                $.ajax({
//                    method: "POST",
//                    url: "ConceptoSrv",
//                    data: datos,
//                    success: function (data) {
//                        console.log(data);
//                        alerta("Concepto guardado correctamente:", "success");
//                        localStorage.removeItem("idDiscapacidad");
//                    },
//                    error: function (error) {
//                        console.log(error);
//                        alerta("Algo salio mal:" + error, "error");
//                    }
//                });
//            } else
//            {
//                alerta("Complete todo los campos", "error");
//            }
//
//        } else {
//            alerta("Ejecute primero la vista previa", "info");
//        }
//
//
//    });
//
//
//});
//
//
//function alerta(texto, icono)
//{
//    swal({text: texto, icon: icono});
//}
//
//function resultado()
//{
//    document.getElementById("resu").innerHTML = document.getElementById("descripcion").innerHTML;
//    var aux = document.getElementById("resu").textContent;
//    document.getElementById("resu").innerHTML = aux;
//    return aux;
//}
