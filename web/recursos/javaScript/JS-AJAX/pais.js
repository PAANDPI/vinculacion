$(document).ready(function () {
    cmbPais();
    cmbCantones();
    function cmbPais(){
     $.ajax({
            method: "GET",
            url: "PaisSrv",
            success: function (data) {
                paisJSON = data;
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
     function cmbCantones(){
         var datos = {"opcion": "1"};
     $.ajax({
            method: "GET",
            url: "CiudadSrv",
            data: datos,
            success: function (data) {
                cantonesJSON = data;    
                var html = `<option value="" selected disabled hidden>-- Seleccione Cantón --</option>`;
                for (var i = 0; i < cantonesJSON.Ciudad.length; i++)
                {
                    var idCiudad = cantonesJSON.Ciudad[i].idciudad;
                    var nombreCiudad = cantonesJSON.Ciudad[i].ciudad;
                    html += `<option value="${idCiudad}">${nombreCiudad}</option>`;

                }
                var cmbCantones = document.getElementById("cmbCantones");
                cmbCantones.innerHTML = html;
                
            },
            error: function (error) {
                console.log(error);
            }
        });
    }     
  });
