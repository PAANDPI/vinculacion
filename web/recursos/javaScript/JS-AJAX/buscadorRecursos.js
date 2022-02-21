traerCategoriaRecurso();
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

tbl_recursos();
function tbl_recursos()
{
    $.ajax({
        method: "GET",
        url: "RecursoSrv",
        data: {"accion": 1},
        success: function (data) {

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
                /* else 
                 if (categoriarecurso === "Archivos")
                 {
                 url = `recursos/iconos/iconos recuros/archivo.png`;
                 
                 }*/

                if (categoriarecurso === "Juegos")
                {
                    url = `recursos/iconos/iconos recuros/juegos.png`;
                    htmlTabla += ` 
                                    <div class="card sombras2">
                                    <img class="card-img-top" src="recursos/imagenes/Juegos.png" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text text-justify">${descripcion}</p>
                                            <div><b>Discapacidad:</b> ${discapacidad}</div>
                                            <div><b>Tipo de recurso:</b> ${categoriarecurso}</div>                                           
                                            <a  href="${ruta}"  class="btn btn-sm btn-info  mt-5">Abri enlace de jugar</a>
                                        </div>
                                </div> `;

                } else if (categoriarecurso === "Videos")
                {
                    url = `recursos/iconos/iconos recuros/video.png`;
                    if (estado == "true") //archivo de la pc
                    {
                        htmlTabla += `  
                                    <div class="card sombras2">
                                         <img class="card-img-top" src="recursos/imagenes/Videos.png" alt="Card image cap"/>     
                                        <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text">${descripcion}</p>
                                            <h6>Discapacidad: ${discapacidad}</h6>
                                            <h6>Tipo de recurso: ${categoriarecurso}</h6>                                           
                                            <button onclick="Open(${i})" class="btn btn-sm btn-success">Ver imagen</button>
                                        </div>
                                  
                                </div> `;
                    } else if (estado == "false") //enlace externo
                    {
                        var rutaVector = ruta.split("/");
                        var nombreVideo = rutaVector[rutaVector.length - 1];
                        htmlTabla += `  
                                    <div class="card sombras2">
                                     <iframe class="card-img-top"  style="width=100%;" src="https://www.youtube.com/embed/${nombreVideo}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                                      
                                    <div class="card-body">
                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text">${descripcion}</p>
                                            <h6>Discapacidad: ${discapacidad}</h6>
                                            <h6>Tipo de recurso: ${categoriarecurso}</h6>                                           
                                             <a  href="${ruta}"  class="btn btn-sm btn-danger">Ver video</a>
                                        </div>                                   
                                </div> `;

                    }
                } else if (categoriarecurso === "PDF")
                {
                    if (estado)
                    {
                        url = `recursos/iconos/iconos recuros/archivo.png`;
                        htmlTabla += ` 
                                    <div class="card sombras2">
                                    <img class="card-img-top" src="recursos/imagenes/PDF.png" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text">${descripcion}</p>
                                            <h6>Discapacidad: ${discapacidad}</h6>
                                            <h6>Tipo de recurso: ${categoriarecurso}</h6>                                           
                                            <a  href="${ruta}"  class="btn btn-sm btn-warning">Visualizar PDF</a>
                                        </div>
                                   
                                </div>
                                   `;
                    }
                } else if (categoriarecurso === "Imagenes")
                {
                    if (estado == "true") //archivo de la pc
                    {
                        url = `recursos/iconos/iconos recuros/imagen.png`;
                        var ruta = jsonRecursos.Recurso[i].ruta.replace("file;///", "");
                        var rutaVector = ruta.split("/");
                        var nombre = rutaVector[rutaVector.length - 1];

                        htmlTabla += `  
                                            <div class="card sombras2">
                                                <img class="card-img-top" src="http://localhost:8090/yuyapuy/recursosDiscapacidades/${nombre}" alt="Card image cap">
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
                                    <div class="card sombras2">
                                    <img class="card-img-top" src="${ruta}" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text text-justify">${descripcion}</p>
                                            <div><b>Discapacidad:</b> ${discapacidad}</div>
                                            <div><b>Tipo de recurso:</b> ${categoriarecurso}</div>                                           
                                            <a  href="${ruta}"  class="btn btn-sm btn-info  mt-5">Abri enlace de jugar</a>
                                        </div>
                                </div> `;
                    }



                } else if (categoriarecurso === "Audio")
                {
                    url = `recursos/iconos/iconos recuros/audio.png`;

                    if (estado == "true") //archivo de la pc
                    {
                        url = `recursos/iconos/iconos recuros/imagen.png`;
                        var ruta = jsonRecursos.Recurso[i].ruta.replace("file;///", "");
                        var rutaVector = ruta.split("/");
                        var nombre = rutaVector[rutaVector.length - 1];

                        htmlTabla += `  
                                            <div class="card sombras2">
                                                <img class="card-img-top" src="http://localhost:8090/yuyapuy/recursosDiscapacidades/${nombre}" alt="Card image cap">
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
                                    <div class="card sombras2">
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



                } else
                {
                    url = `recursos/iconos/iconos recuros/todo.png`;
                }


            }
            var tbl_recursos = document.getElementById("tbl_recursos");
            tbl_recursos.innerHTML = htmlTabla;

        },
        error: function (error) {


            console.log(error)

        }
    });
}
function Open(ruta) {
    var ruta = jsonRecursos.Recurso[ruta].ruta.replace("file;///", "");
    var rutaVector = ruta.split("/");
    var nombre = rutaVector[rutaVector.length - 1];
    var rutaOficial = "http://localhost:8090/yuyapuy/recursosDiscapacidades/" + nombre;
    window.open(rutaOficial, null);
}
function tbl_recursos_parametros()
{
    var cmbCategoria = document.getElementById("cmb-categoria").value;
    var txtDiscapacidad = document.getElementById("txtDiscapacidad").value;
    $.ajax({
        method: "GET",
        url: "RecursoSrv",
        data: {"accion": 2, "cmbCategoria": cmbCategoria, "txtDiscapacidad": txtDiscapacidad},
        success: function (data) {
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
                                    <div class="card sombras2">
                                    <img class="card-img-top" src="recursos/imagenes/Juegos.png" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text text-justify">${descripcion}</p>
                                            <div><b>Discapacidad:</b> ${discapacidad}</div>
                                            <div><b>Tipo de recurso:</b> ${categoriarecurso}</div>                                           
                                            <a  href="${ruta}"  class="btn btn-sm btn-info  mt-5">Abri enlace de jugar</a>
                                        </div>
                                </div> `;

                } else if (categoriarecurso === "Videos")
                {
                    url = `recursos/iconos/iconos recuros/video.png`;
                    if (estado == "true") //archivo de la pc
                    {
                        htmlTabla += `  
                                    <div class="card sombras2">
                                         <img class="card-img-top" src="recursos/imagenes/Videos.png" alt="Card image cap"/>     
                                        <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text">${descripcion}</p>
                                            <h6>Discapacidad: ${discapacidad}</h6>
                                            <h6>Tipo de recurso: ${categoriarecurso}</h6>                                           
                                            <button onclick="Open(${i})" class="btn btn-sm btn-success">Ver imagen</button>
                                        </div>
                                  
                                </div> `;
                    } else if (estado == "false") //enlace externo
                    {
                        var rutaVector = ruta.split("/");
                        var nombreVideo = rutaVector[rutaVector.length - 1];
                        htmlTabla += `  
                                    <div class="card sombras2">
                                     <iframe class="card-img-top"  style="width=100%;" src="https://www.youtube.com/embed/${nombreVideo}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                                      
                                    <div class="card-body">
                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text">${descripcion}</p>
                                            <h6>Discapacidad: ${discapacidad}</h6>
                                            <h6>Tipo de recurso: ${categoriarecurso}</h6>                                           
                                             <a  href="${ruta}"  class="btn btn-sm btn-danger">Ver video</a>
                                        </div>                                   
                                </div> `;

                    }
                } else if (categoriarecurso === "PDF")
                {
                    if (estado)
                    {
                        url = `recursos/iconos/iconos recuros/archivo.png`;
                        htmlTabla += ` 
                                    <div class="card sombras2">
                                    <img class="card-img-top" src="recursos/imagenes/PDF.png" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text">${descripcion}</p>
                                            <h6>Discapacidad: ${discapacidad}</h6>
                                            <h6>Tipo de recurso: ${categoriarecurso}</h6>                                           
                                            <a  href="${ruta}"  class="btn btn-sm btn-warning">Visualizar PDF</a>
                                        </div>
                                   
                                </div>
                                   `;
                    }
                } else if (categoriarecurso === "Imagenes")
                {
                    if (estado == "true") //archivo de la pc
                    {
                        url = `recursos/iconos/iconos recuros/imagen.png`;
                        var ruta = jsonRecursos.Recurso[i].ruta.replace("file;///", "");
                        var rutaVector = ruta.split("/");
                        var nombre = rutaVector[rutaVector.length - 1];

                        htmlTabla += `  
                                            <div class="card sombras2">
                                                <img class="card-img-top" src="http://localhost:8090/yuyapuy/recursosDiscapacidades/${nombre}" alt="Card image cap">
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
                                    <div class="card sombras2">
                                    <img class="card-img-top" src="${ruta}" alt="Card image cap"/>                                                             
                                    <div class="card-body">                                            
                                            <h5 class="card-title">${recurso} <img class="float-right " src="${url}" width="35"/></h5>
                                            <p class="card-text text-justify">${descripcion}</p>
                                            <div><b>Discapacidad:</b> ${discapacidad}</div>
                                            <div><b>Tipo de recurso:</b> ${categoriarecurso}</div>                                           
                                            <a  href="${ruta}"  class="btn btn-sm btn-info  mt-5">Abri enlace de jugar</a>
                                        </div>
                                </div> `;
                    }



                } else if (categoriarecurso === "Audio")
                {
                    url = `recursos/iconos/iconos recuros/audio.png`;

                    if (estado == "true") //archivo de la pc
                    {
                        url = `recursos/iconos/iconos recuros/imagen.png`;
                        var ruta = jsonRecursos.Recurso[i].ruta.replace("file;///", "");
                        var rutaVector = ruta.split("/");
                        var nombre = rutaVector[rutaVector.length - 1];

                        htmlTabla += `  
                                            <div class="card sombras2">
                                                <img class="card-img-top" src="http://localhost:8090/yuyapuy/recursosDiscapacidades/${nombre}" alt="Card image cap">
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
                                    <div class="card sombras2">
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



                } else
                {
                    url = `recursos/iconos/iconos recuros/todo.png`;
                }


            }
            var tbl_recursos = document.getElementById("tbl_recursos");
            tbl_recursos.innerHTML = htmlTabla;

        },
        error: function (error) {


            console.log(error)

        }
    });

}