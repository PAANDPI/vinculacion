traerCategoriaDiscapacidad();
$(document).ready(function () {

    $("#claPorcategoria").animate({height: 'toggle'}, "slow");

});
traerCategoriaRecurso();

var jsonCategoriaDiscapacidad;

$("#bntBusquedaEspecifica").click(function () {

    var bntBusquedaEspecifica2 = document.getElementById("bntBusquedaEspecifica2");
    bntBusquedaEspecifica2.style.cssText = "border-bottom: 2px solid #fff";
    var bntBusquedaEspecifica = document.getElementById("bntBusquedaEspecifica");
    bntBusquedaEspecifica.style.cssText = "border-bottom: 2px solid #0B3049";
    $('#buscadorEspecifica').show();
    $("#claPorcategoria").hide();
        $("#indicador").html("");
        


});
$("#bntBusquedaEspecifica2").click(function () {


    var bntBusquedaEspecifica = document.getElementById("bntBusquedaEspecifica");
    bntBusquedaEspecifica.style.cssText = "border-bottom: 2px solid #fff";
    var bntBusquedaEspecifica2 = document.getElementById("bntBusquedaEspecifica2");
    bntBusquedaEspecifica2.style.cssText = "border-bottom: 2px solid #0B3049";
    $('#buscadorEspecifica').hide();
    $("#claPorcategoria").show();
  
});

function traerCategoriaDiscapacidad() {

    $.ajax({
        method: "GET",
        url: "CategoriaDiscapacidadSrv",
        success: function (data) {
            jsonCategoriaDiscapacidad = data;
            html = ``;
            for (var i = 0; i < jsonCategoriaDiscapacidad.CategoriaDiscapacidad.length; i++)
            {
                if (jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].categoriadiscapacidad == 'Discapacidad auditiva')
                {
                    html += ` <button id="btn${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad}" 
                            onclick="seleccionCategoria('#28BD57', this.id, ${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad})"
                            type="button" class="btn blanco m-2 " style="background: #28BD57; border-bottom: 10px solid #1f9143">
                        <img src="recursos/iconos/oido.png" alt=""/>
                        <b style=" text-shadow: 1px 1px 10px #333;">Discapacidad auditiva</b>
                    </button>`;

                } else if (jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].categoriadiscapacidad == 'Discapacidad física')
                {
                    html += ` <button id="btn${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad}"  onclick="seleccionCategoria('#FFDE41', this.id,${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad})" type="button" class="btn btn-warning blanco m-2 " style=" border-bottom: 10px solid #a68011">
                        <img  width="60" height="60" src="recursos/iconos/ruedas.png" alt=""/>
                        <b style=" text-shadow: 1px 1px 10px #333;">Discapacidad física</b>
                    </button>`;

                } else if (jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].categoriadiscapacidad == 'Discapacidad intelectual')
                {
                    html += `<button id="btn${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad}"  onclick="seleccionCategoria('#23A6AB', this.id,${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad})" type="button" class="btn blanco m-2 " style="background: #23A6AB; border-bottom: 10px solid #0f6a6e">
                        <img width="60" height="60" src="recursos/iconos/cerebro.png" alt=""/>
                        <b style=" text-shadow: 1px 1px 10px #333;">Discapacidad intelectual</b>
                    </button>`;

                } else if (jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].categoriadiscapacidad == 'Discapacidad Multiple')
                {
                    html += `<button id="btn${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad}"  onclick="seleccionCategoria('#FF2C2C', this.id,${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad})" type="button" class="btn btn-danger m-2" style=" border-bottom: 10px solid #9e1623">
                        <img width="60" height="60" src="recursos/iconos/multiple.png" alt=""/>
                        <b style=" text-shadow: 1px 1px 10px #333;">Discapacidad múltiple</b>
                    </button>`;

                } else if (jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].categoriadiscapacidad == 'Discapacidad psicosocial')
                {
                    html += `<button id="btn${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad}"  onclick="seleccionCategoria('#723aa1', this.id,${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad})" type="button" class="btn   blanco m-2 morado" style=" border-bottom: 10px solid #723aa1">
                        <img width="60" height="60" src="recursos/iconos/mente.png" alt=""/>
                        <b style=" text-shadow: 1px 1px 10px #333;">Discapacidad psicosocial</b>
                    </button>`;

                } else if (jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].categoriadiscapacidad == 'Discapacidad visual')
                {
                    html += ` <button id="btn${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad}" onclick="seleccionCategoria('#E6A628', this.id,${jsonCategoriaDiscapacidad.CategoriaDiscapacidad[i].idcategoriadiscapacidad})" type="button" class="btn  blanco m-2" 
                            style="background: #E6A628; border-bottom: 10px solid #bf8719">
                        <img width="60" height="60" src="recursos/iconos/ciego.png" alt=""/> 
                        <b style=" text-shadow: 1px 1px 10px #333;">Discapacidad visual</b>
                    </button>`;
                }


            }
            html += ` <button  id="btn000" onclick="seleccionCategoria('#212121', this.id,1000)"  type="button" class="btn btn-dark m-2" 
                            style="border-bottom: 10px solid #333232">
                        <img width="60" height="60" src="https://img.icons8.com/ios-filled/50/ffffff/show-all-views.png"/>                        
                        <b style=" text-shadow: 1px 1px 10px #333;">Cargar todos</b>
                    </button>`
            document.getElementById("indicador2").innerHTML = html;
            console.log(data);

        },
        error: function (error) {
            console.log(error);
        }
    });
}
var btnAnterios = "";
function seleccionCategoria(seleccion, id, cmbCategoriaDiscapacidad) {
    idRecursoMod = id;

    if (btnAnterios.length > 0) {
        var btonAn = document.getElementById(btnAnterios);
        btonAn.style.cssText += "opacity: 1;";
    }
    var borde = document.getElementById("indicador");
   borde.innerHTML= ` <div class="rounded-circle mr-3 blanco font-weight-bold text-center" style="width: 25px; height: 25px; background: ${seleccion} ;">
                            <i>R</i>          
                </div> <div id="cantidad" class="font-weight-bold"> Resultado de esta categoría: </div>`;

    var boton = document.getElementById(id);
    boton.style.cssText += "opacity: 0.7;";
    btnAnterios = id;

    if (cmbCategoriaDiscapacidad == 1000)
    {
        tbl_recursos();
        $("#cantidad").html("Resultado de esta categoría:  " +jsonRecursos.Recurso.length);
    } else
    {
        $.ajax({
            method: "GET",
            url: "RecursoSrv",
            data: {"accion": 7, "cmbCategoriaDiscapacidad": cmbCategoriaDiscapacidad},
            success: function (data) {
               
                    htmlPoner(data);
                    $("#cantidad").html("Resultado de esta categoría:  " +data.Recurso.length);
                    if(data.Recurso.length==0)
                    {
                        var tbl_recursos = document.getElementById("tbl_recursos");
                        tbl_recursos.innerHTML = ""; 
                    }
            },
            error: function (error) {
                console.log(error);
                $("#cantidad").html("Resultado de esta categoría: 0");
                var tbl_recursos = document.getElementById("tbl_recursos");
                        tbl_recursos.innerHTML = ""; 
               
               
            }
        });
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
function tbl_recursos() {
    $.ajax({
        method: "GET",
        url: "RecursoSrv",
        data: {"accion": 1},
        success: function (data) {
            htmlPoner(data);
            Swal.fire({
                icon: 'success',
                title: 'Busqueda realizada',
                text: ' ',
                timer: 700, didOpen: () => {
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

                }
            })
        },
        error: function (error) {
            Swal.fire("No se encontraron recursos de este tipo");
             var tbl_recursos = document.getElementById("tbl_recursos");
                tbl_recursos.innerHTML = "";
        }
    });
}
function Open(ruta) {
    var ruta2 = jsonRecursos.Recurso[ruta].ruta;
    var rutaDefinitiva = ruta2.replace(`http:/`, `http://`)
    window.open(rutaDefinitiva, null);
}
function tbl_recursos_parametros() {
    var accion = 4;
    var txtDiscapacidad = document.getElementById("txtDiscapacidad").value;
    if (txtDiscapacidad.length > 0)
    {
        var checNombreDiscapacidad = document.getElementById("checNombreDiscapacidad").checked;
        if (checNombreDiscapacidad)
        {
            accion = 4;
        } else
        {
            accion = 5;

        }
        $.ajax({
            method: "GET",
            url: "RecursoSrv",
            data: {"accion": accion, "txtDiscapacidad": txtDiscapacidad},
            success: function (data)
            {

                htmlPoner(data);
                console.log(data);
                Swal.fire({
                    icon: 'success',
                    title: 'Busqueda realizada',
                    text: 'Numero de resultados: ' + jsonRecursos.Recurso.length,
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

                    }
                })
            },
            error: function (error) {

                Swal.fire("No se encontraron recursos de este tipo")



            }
        });
    } else
    {
        Swal.fire("Ingrese al menos un letra para buscar un recurso")
    }


}
function aplicar_filtro() {
    var cmbCategoria = document.getElementById("cmb-categoria").value;
    var txtDiscapacidad = document.getElementById("txtDiscapacidad").value;
    var checNombreDiscapacidad = document.getElementById("checNombreDiscapacidad").checked;
    if (checNombreDiscapacidad)
    {
        accion = 2;
    } else
    {
        accion = 6;

    }
    $.ajax({
        method: "GET",
        url: "RecursoSrv",
        data: {"accion": accion, "cmbCategoria": cmbCategoria, "txtDiscapacidad": txtDiscapacidad},
        success: function (data) {
            htmlPoner(data)

            Swal.fire({
                icon: 'success',
                title: 'Filtros aplicados',
                text: 'Numero de resultados: ' + jsonRecursos.Recurso.length,
                timer: 500, didOpen: () => {
                    Swal.showLoading()
                    const b = Swal.getHtmlContainer().querySelector('b')
                    timerInterval = setInterval(() => {
                    }, 100)
                },
                willClose: () => {
                    clearInterval(timerInterval)
                }
            }).then((result) => {
                if (result.dismiss === Swal.DismissReason.timer) {

                }
            })

        },
        error: function (error) {

            Swal.fire("No se encontraron recursos de este tipo")
            console.log(error)

        }
    });

}
function htmlPoner(data) {
    jsonRecursos = data;
    var htmlTabla = ``;
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

        if (categoriarecurso === "Juegos")
        {
            url = `recursos/iconos/iconos recuros/juegos.png`;
            htmlTabla += ` 
                                    <div class="card infoCar sombras2">
                                    <img class="card-img-top" src="recursos/imagenes/Juegos.png" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text text-justify">${descripcion}</p>
                                            <div><b>Discapacidad:</b> ${discapacidad}</div>
                                            <div><b>Tipo de recurso:</b> ${categoriarecurso}</div>  
                                            <button onclick="Open(${i})"  class="btn btn-sm btn-info">Abri enlace</button>                                            
                                        </div>
                                </div> `;

        } else if (categoriarecurso === "Video")
        {
            url = `recursos/iconos/iconos recuros/video.png`;

            var rutaVector = ruta.split("/");
            var nombreVideo = rutaVector[rutaVector.length - 1];
            htmlTabla += `  
                                    <div class="card infoCar sombras2">
                                     <iframe class="card-img-top"  style="width=100%;" src="https://www.youtube.com/embed/${nombreVideo}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                                      
                                    <div class="card-body">
                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text">${descripcion}</p>
                                            <h6>Discapacidad: ${discapacidad}</h6>
                                            <h6>Tipo de recurso: ${categoriarecurso}</h6>                                             
                                             <a  onclick="Open(${i})"  class="btn btn-sm btn-danger blanco">Ver video</a>
                                        </div>                                   
                                </div> `;

//            }
        } else if (categoriarecurso === "Archivo")
        {

            url = `recursos/iconos/iconos recuros/archivo.png`;
            htmlTabla += ` 
                                    <div class="card infoCar sombras2">
                                    <img class="card-img-top" src="recursos/imagenes/Archivo.png" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text">${descripcion}</p>
                                            <h6>Discapacidad: ${discapacidad}</h6>
                                            <h6>Tipo de recurso: ${categoriarecurso}</h6>    
                                           <button onclick="Open(${i})"  class="btn btn-sm btn-warning">Visualizar</button>                                           
                                        </div>
                                   
                                </div>
                                   `;

        } else if (categoriarecurso === "Imagen")
        {
            if (estado == "true") //archivo de la pc
            {
                var ruta = jsonRecursos.Recurso[i].ruta;
                var rutaDefinitiva = ruta.replace(`http:/`, `http://`)
                url = `recursos/iconos/iconos recuros/imagen.png`;

                htmlTabla += `  
                                            <div class="card infoCar sombras2">
                                                <img class="card-img-top" src="${rutaDefinitiva}" alt="Card image cap">
                                                <div class="card-body">

                                                    <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                                    <p class="card-text">${descripcion}</p>
                                                    <h6>Discapacidad: ${discapacidad}</h6>
                                                    <h6>Tipo de recurso: ${categoriarecurso}</h6>                                           
                                                    <button onclick="Open(${i})" class="btn btn-sm btn-success">Ver imagen</button>
                                                </div>

                                        </div>
                                           `;
            } else if (estado == "false") //enlace externo
            {
                htmlTabla += ` 
                                    <div class="card  infoCar sombras2">
                                    <img class="card-img-top" src="${ruta}" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text text-justify">${descripcion}</p>
                                            <div><b>Discapacidad:</b> ${discapacidad}</div>
                                            <div><b>Tipo de recurso:</b> ${categoriarecurso}</div>                                           
                                            <a  href="${ruta}"  class="btn btn-sm btn-info  mt-5">Ver página</a>
                                        </div>
                                </div> `;
            }



        } else if (categoriarecurso === "Audio")
        {
            url = `recursos/iconos/iconos recuros/audio.png`;
            htmlTabla += ` 
                                    <div class="card infoCar sombras2">
                                    <img class="card-img-top" src="recursos/imagenes/Audio.png" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text text-justify">${descripcion}</p>
                                            <div><b>Discapacidad:</b> ${discapacidad}</div>
                                            <div><b>Tipo de recurso:</b> ${categoriarecurso}</div>                                           
                                            <a  href="${ruta}"  class="btn btn-sm btn-info  mt-5">Abri enlace de jugar</a>
                                        </div>
                                </div> `;
            



        }
        else if (categoriarecurso === "Pagína")
        {
            url = `recursos/iconos/iconos recuros/todo.png`;
            htmlTabla += ` 
                                    <div class="card infoCar sombras2">
                                    <img class="card-img-top" src="recursos/imagenes/pagina.png" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text text-justify">${descripcion}</p>
                                            <div><b>Discapacidad:</b> ${discapacidad}</div>
                                            <div><b>Tipo de recurso:</b> ${categoriarecurso}</div>                                           
                                            <a  href="${ruta}"  class="btn btn-sm btn-info  mt-5">Abri enlace de jugar</a>
                                        </div>
                                </div> `;
            



        }
        else
        {
            url = `recursos/iconos/iconos recuros/todo.png`;
            htmlTabla += ` 
                                    <div class="card infoCar sombras2">
                                    <img class="card-img-top" src="recursos/imagenes/pagina.png" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text text-justify">${descripcion}</p>
                                            <div><b>Discapacidad:</b> ${discapacidad}</div>
                                            <div><b>Tipo de recurso:</b> ${categoriarecurso}</div>                                           
                                            <a  href="${ruta}"  class="btn btn-sm btn-info  mt-5">Abri enlace de jugar</a>
                                        </div>
                                </div> `;
        }


    }
    var tbl_recursos = document.getElementById("tbl_recursos");
    tbl_recursos.innerHTML = htmlTabla;
}