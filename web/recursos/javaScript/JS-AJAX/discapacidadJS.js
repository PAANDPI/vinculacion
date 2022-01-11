
$(document).ready(function () {
    
        cargarCategoriaDiscapacidades();
        cargarDiscapacidades();
        function cargarCategoriaDiscapacidades()
        {
            $.ajax({
                method: "GET",
                url: "",          
                success: function (data) {
                    var htmlCat_discapacidades="";
                    var cmbCatDiscapacidades= document.getElementById("cmbIdCategoriDiscapacidad").value;
                    var jsonCategoria=JSON.parse(data);
                   
                },
                error: function (error) {
                 
                }
            });
        }
        function cargarDiscapacidades()
        {
            $.ajax({
                method: "GET",
                url: "",          
                success: function (data) {
                    var html_discapacidades="";
                    var jsonDiscapacidades=JSON.parse(data);
                   
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
                url: "",
                data: {"discapacidad": nombreDiscapacidad, "idCategoriaDiscapacidad": idCategoriaDiscapacidad},
                success: function (data) {

                    document.getElementById("btnClickCerrar").click();
                    alerta("Discapacidad Añadida", "success");

                },
                error: function (error) {

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
                    alerta("Concepto guardado correctamente:", "success")
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