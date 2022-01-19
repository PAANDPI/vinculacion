var jsonCategoria;
var jsonDiscapacidades;
$(document).ready(function () {
    
        cargarCategoriaDiscapacidades();
        cargarDiscapacidades();
        function cargarCategoriaDiscapacidades()
        {
            $.ajax({
                method: "GET",
                url: "CategoriaDiscapacidadSrv",          
                success: function (data) {
                     jsonCategoria=data; 
//                     ALT+0145;
                     var html=`<option value="" selected disabled hidden></option>`;
                     for(var i=0; i<jsonCategoria.CategoriaDiscapacidad.length; i++)
                     {
                         var idCategoria=jsonCategoria.CategoriaDiscapacidad[i].idcategoriadiscapacidad;
                         var nombreCategoria=jsonCategoria.CategoriaDiscapacidad[i].categoriadiscapacidad;                         
                         html+=`<option value="${idCategoria}">${nombreCategoria}</option>`;
                         
                     }
                     console.log(html);
                     
                    var cmbCatDiscapacidades= document.getElementById("cmbIdCategoriDiscapacidad");
                    cmbCatDiscapacidades.innerHTML=html;
                   
                },
                error: function (error) {
                 
                }
            });
        }
        function cargarDiscapacidades()
        {
            $.ajax({
                method: "GET",
                url: "DiscapacidadSrv",          
               success: function (data) {
                   console.log(data)
                   jsonDiscapacidades=JSON.parse(data);
                   
                     var htmlTabla=`<`;
                     var cmbDiscapacidades=`<`;
                     for(var i=0; i<jsonDiscapacidades.Discapacidad.length; i++)
                     {
                         var idDiscapacidad=jsonDiscapacidades.Discapacidad[i].idcategoriadiscapacidad;
                         var nombreCategoriaDiscapacidad=jsonDiscapacidades.Discapacidad[i].categoriadiscapacidad;   
                         var idCategoriaDiscapacidad=jsonDiscapacidades.Discapacidad[i].iddiscapacidad;
                         var nombreDiscapacidad=jsonDiscapacidades.Discapacidad[i].discapacidad;
                         
                     }
                  
               },
               error: function (error) {
                 
                }
            });
        }
        
        
    $('#btnGuardarDiscapacidad').on('click', function () {
        var idCategoriaDiscapacidad = document.getElementById("cmbIdCategoriDiscapacidad").value;
        var nombreDiscapacidad = document.getElementById("txtNombreDiscapacidad").value;
        
        if ((nombreDiscapacidad.length * idCategoriaDiscapacidad.length) > 0)
        {
            $.ajax({
                method: "POST",
                url: "DiscapacidadSrv",
                data: {"discapacidad": nombreDiscapacidad, "idCategoriaDiscapacidad": idCategoriaDiscapacidad},
                success: function (data) {

                    document.getElementById("btnClickCerrar").click();
                    alerta("Discapacidad Añadida", "success");

                },
                error: function (error) {
                    console.log(error);
                    alerta("Algo salio mal"+error, "error");
                }
            });


        } else
        {
            alerta("Complete todo el formulario", "error");

        }


    });


    $('#btnGuardarConcepto').on('click', function () {

        var htmlDescripcion = resultado();
        var iDDiscapacidad = document.getElementById("iDDiscapacidad").value;
        var etiquetas = document.getElementById("etiquetas").value;
        if (htmlDescripcion.length > 0)
        {
            if ((iDDiscapacidad.length * etiquetas.length) > 0) {

                $.ajax({
                    method: "POST",
                    url: "",
                    data: {"iDDiscapacidad": iDDiscapacidad,
                           "descripcion": htmlDescripcion,
                           "etiquetas":etiquetas},
                       
                    success: function (data) {
                    alerta("Concepto guardado correctamente:", "success");
                    },
                    error: function (error) {
                    alerta("Algo salio mal:"+error, "error");
                    }
                });
            } else
            {
            alerta("Complete todo los campos", "error");
            }

        }else{
        alerta("Ejecute primero la vista previa", "info");
        }


    });
});
function alerta(texto, icono)
{
    swal({text: texto, icon: icono});
}

function resultado()
{
    document.getElementById("resu").innerHTML = document.getElementById("descripcion").innerHTML;
    var aux = document.getElementById("resu").textContent;
    document.getElementById("resu").innerHTML= aux;
    return aux;
}