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
                    var idDiscapacidad = jsonDiscapacidades.Discapacidad[i].iddiscapacidad ;
                    var nombreCategoriaDiscapacidad = jsonDiscapacidades.Discapacidad[i].categoriadiscapacidad;
                    var idCategoriaDiscapacidad = jsonDiscapacidades.Discapacidad[i].idcategoriadiscapacidad;
                    var nombreDiscapacidad = jsonDiscapacidades.Discapacidad[i].discapacidad;
                    htmlTabla += `<tr>
                                    <th>${i+1}</th>
                                    <td>${nombreDiscapacidad}</td>
                                    <td>${nombreCategoriaDiscapacidad}</td>
                                        <td>
                                            <div class="btn-group" role="group" aria-label="Basic example">
                                            <button onclick=seleccionarDiscapacidad("${idDiscapacidad}") type="button" class="btn btn-info btn-sm ">Seleccionar</button>   
                                            </div>
                                        </td>                                 
                                  </tr>`;
                    cmbDiscapacidades+=`<option value="${idDiscapacidad}">${nombreDiscapacidad}</option>`;
                }
               
                    var tbl_Discapacidad = document.getElementById("tbl_Discapacidad");
                    var cmb_Discapacidad=document.getElementById("cmb-discapacidad");
                    tbl_Discapacidad.innerHTML = htmlTabla;
                    cmb_Discapacidad.innerHTML=cmbDiscapacidades;
               

            },
            error: function (error) {

            }
        });
       

    }
    
    $('#btnGuardarDiscapacidad').on('click', function () {
        var idCategoriaDiscapacidad = document.getElementById("cmbIdCategoriDiscapacidad").value;
        var nombreDiscapacidad = document.getElementById("txtNombreDiscapacidad").value;
        var datos={"discapacidad": nombreDiscapacidad, "idCategoriaDiscapacidad": idCategoriaDiscapacidad}
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
    
});
function seleccionarDiscapacidad(idDiscapacidad)
    {
        alerta(idDiscapacidad);
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