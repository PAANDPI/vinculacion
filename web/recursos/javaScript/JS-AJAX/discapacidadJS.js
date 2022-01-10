
$(document).ready(function () {

    $('#btnGuardarDiscapacidad').on('click', function () {
        var nombreDiscapacidad = document.getElementById("cmbCategoriDiscapacidad").value;
        var categoriaDiscapacidad = document.getElementById("txtNombreDiscapacidad").value;
        
        if ((nombreDiscapacidad.length * categoriaDiscapacidad.length) > 0)
        {
            $.ajax({
                method: "POST",
                url: "",
                data:{"nombreDiscapacidad":nombreDiscapacidad,"categoriaDiscapacidad": categoriaDiscapacidad} ,
                success: function (data) {
                    
                   document.getElementById("btnClickCerrar").click();
                    alerta("Discapacidad Añadida", "success");
                    
                },
                error: function (data) {
                    
                    alerta("Algo salio mal", "error");
                }
            });


        } else
        {
            alerta("Complete todo el formulario", "error");

        }


    });
    
    
      $('#btnGuardarConcepto').on('click', function () {
        var nombreDiscapacidad = document.getElementById("cmbCategoriDiscapacidad").value;
        var categoriaDiscapacidad = document.getElementById("txtNombreDiscapacidad").value;
        
        if ((nombreDiscapacidad.length * categoriaDiscapacidad.length) > 0)
        {
            $.ajax({
                method: "POST",
                url: "",
                data:{"nombreDiscapacidad":nombreDiscapacidad,"categoriaDiscapacidad": categoriaDiscapacidad} ,
                success: function (data) {
                    
                   document.getElementById("btnClickCerrar").click();
                    alerta("Discapacidad Añadida", "success");
                    
                },
                error: function (data) {
                    
                    alerta("Algo salio mal", "error");
                }
            });


        } else
        {
            alerta("Complete todo el formulario", "error");

        }


    });
    
    function alerta(texto, icono)
    {
        swal({text: texto, icon:icono}); 
    }

});