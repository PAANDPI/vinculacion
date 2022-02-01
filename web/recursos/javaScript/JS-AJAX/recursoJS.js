var formData;
var base64;
const toBase64 = file => new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = error => reject(error);
});
async function Main() {
   const file = document.querySelector('#formFile').files[0];
     base64=await toBase64(file);
     guardarRecurso();
}
function guardarRecurso() {
    
    var ruta=base64;
    var idcategoriarecurso = document.getElementById("cmb-categoria").value;
    var iddiscapacidad = document.getElementById("cmb-discapacidad").value;
    var recurso = document.getElementById("txtRecurso").value;
    var descripcion = document.getElementById("txt-descripcionRecurso").value;
    var etiquetas = document.getElementById("txt-etiquetaa").value;
    
    var datos =
            {"idcategoriarecurso": idcategoriarecurso,
                "iddiscapacidad": iddiscapacidad,
                "recurso": recurso,
                "descripcion": descripcion,
                "etiquetas": etiquetas,
                "estado": "true",
                "ruta": ruta
            }
            
        $.ajax({
         method: "POST",
         url: "RecursoSrv",
         data: datos,
         success: function (data) {
          alerta("Archivo guardado con exito","success")

         },
         error: function (error) {
            alerta("Algo salio mal al guardar el archivo","error")
         }
     });
}

var html;
traerCategoriaRecurso();
var jsonCategoriaRecuros;
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
