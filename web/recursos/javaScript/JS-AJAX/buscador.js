var jsonConsulta;
$(document).ready(function ()
{
    cargarAutoCompletado();
     function cargarAutoCompletado()
     {
           var opciones="";
             $.ajax({
                method: "GET",
                url: "DiscapacidadSrv",           
                success: function (data) {
                 var lista=  JSON.parse(data);
                     for (var i = 0; i < lista.Discapacidad.length; i++) {
                           opciones+=`<option value="${lista.Discapacidad[i].discapacidad}">`;
                     }
                  document.getElementById("lista_discapacidades").innerHTML=opciones;
                },
                 error: function (error) {
                    
                }
            });
     }
    $("#nombreDiscapacidad").keypress(function (event) {
        if (event.keyCode === 13) {
            $("#btnBuscarDiscapacidad").click();
        }
    });

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
                    try {
                        jsonConsulta = JSON.parse(data);
                        Swal.fire({
                            icon: 'success',
                            title: 'Busqueda realizada',
                            text: 'Numero de resultados: ' + jsonConsulta.Concepto.length,
                            timer: 1000, didOpen: () => {
                                Swal.showLoading()
                                const b = Swal.getHtmlContainer().querySelector('b')
                                timerInterval = setInterval(() => {
                                }, 100)
                            },
                            willClose: () => {
                                clearInterval(timerInterval)
                            }
                        }).then((result) => {
                            /* Read more about handling dismissals below */
                            if (result.dismiss === Swal.DismissReason.timer) {
                                console.log('I was closed by the timer')
                            }
                        })


                        for (var i = 0; i < jsonConsulta.Concepto.length; i++) {

                            var titulo = jsonConsulta.Concepto[i].discapacidad;
                            var descripcion = jsonConsulta.Concepto[i].descripcion;
                            var idConcepto = jsonConsulta.Concepto[i].idconcepto;
                            var etiquetas = jsonConsulta.Concepto[i].etiquetas;
                            var vector = etiquetas.split("titulo:");
                            
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
                    } catch (e) {
                        Swal.fire({
                            title: 'No se encontron resultados!',
                            imageUrl: 'recursos/imagenes/No_resultados.gif',
                            imageWidth: 200,
                            imageHeight: 200,
                            imageAlt: 'Custom image',
                        })
                         $('#informacionBusqueda').show(100);
                         $('#resultadosBusqueda').hide(100);
                    }



                },
                error: function (error) {
                    console.log(error);
                    alerta("Algo salio mal", "error");
                    $('#informacionBusqueda').show(100);
                    $('#resultadosBusqueda').hide(100);
                }
            });

        } else
        {
            Swal.fire({
                title: 'Información!',
                text: 'Por favor, ingrese el nombre de la discapacidad a buscar',
                imageUrl: 'recursos/imagenes/Falta_nombre.gif',
                imageWidth: 400,
                imageHeight: 200,
                imageAlt: 'Custom image',
            })
             $('#informacionBusqueda').show(100);
             $('#resultadosBusqueda').hide(100);
        }


    });

});

function alerta(texto, icono)
{
    swal({text: texto, icon: icono});
}