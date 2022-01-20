$(document).ready(function () {
    cmbPais();
    cmbCantones();
    function cmbPais(){
     $.ajax({
            method: "GET",
            url: "PaisSrv",
            success: function (data) {
                paisJSON = data;
                console.log(paisJSON);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
     function cmbCantones(){
     $.ajax({
            method: "GET",
            url: "CiudadSrv",
            success: function (data) {
                cantonesJSON = data;    
                console.log(cantonesJSON);
                var html = `<option value="" selected disabled hidden></option>`;
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
