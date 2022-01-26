var jsonConsulta;
$(document).ready(function ()
{

    $('#btnBuscarDiscapacidad').on('click', function () {

        var nombreDiscapacidad = document.getElementById("nombreDiscapacidad").value;
        var accordionResultante = document.getElementById("accordionResultante");
        var numeroResultado = document.getElementById("numeroResultado");
        var html = "";
        var boolean;
        if (nombreDiscapacidad.length > 0) {
            accordionResultante.innerHTML = "";
            $.ajax({
                method: "GET",
                url: "ConceptoSrv",
                data: {"busqueda": nombreDiscapacidad, "tipobusqueda": "2"},
                success: function (data) {
                    jsonConsulta = JSON.parse(data);
                    alerta("Busqueda realizada", "success");
                    for (var i = 0; i < jsonConsulta.Concepto.length; i++) {

                        var titulo = jsonConsulta.Concepto[i].discapacidad;
                        var descripcion = jsonConsulta.Concepto[i].descripcion;
                        var idConcepto = jsonConsulta.Concepto[i].idconcepto;
                        var etiquetas = jsonConsulta.Concepto[i].etiquetas;
                        var vector= etiquetas.split("titulo:");
                        html += `<div class="card">
                    <div class="card-header" id="heading${idConcepto}">
                        <h5 class="">
                          <button id="btnR${idConcepto}" class="btn font-weight-bold bi bi-bookmark-fill" data-toggle="collapse" data-target="#collapse${idConcepto}" aria-expanded=" ${boolean}" aria-controls="collapse${idConcepto}">
                           ${titulo} :     ${vector[1]}                           
                          </button>
                        </h5>
                         <labels class="font-weight-bold ml-3">Relacionado con:</labels>
                          <labels class="ml-1"> ${vector[0]} </labels>
                    </div>

                    <div id="collapse${idConcepto}" class="collapse show" aria-labelledby="heading${idConcepto}" data-parent="#accordionResultante">
                        <div class="card-body">
                          ${descripcion} 
                        </div>
                    </div>
                </div>`;
                    }
                    numeroResultado.innerHTML = jsonConsulta.Concepto.length;

                    accordionResultante.innerHTML = html;
                    for (var i = 0; i < jsonConsulta.Concepto.length; i++) {
                        document.getElementById("btnR" + jsonConsulta.Concepto[i].idconcepto).click();
                    }

                    $('#informacionBusqueda').hide(100);
                    $('#resultadosBusqueda').show(100);

                },
                error: function (error) {
                    console.log(error);
                    alerta("Algo salio mal", "error");
                }
            });

        } else
        {
            swal({
                title: "Información",
                text: "Por favor, ingrese el nombre de la discapacidad a buscar",
                icon: "info",
                button: "Entendido",
            });
           
        }


    });

});

function alerta(texto, icono)
{
    swal({text: texto, icon: icono});
}