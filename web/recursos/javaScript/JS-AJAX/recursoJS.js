$("#frmRecurso").on("submit", function (e) {
    e.preventDefault();
    var formData = new FormData(document.getElementById("frmRecurso"));
    /*formData.append("idcategoriarecurso", "valor");
     formData.append("iddiscapacidad", "valor");
     formData.append("recurso", "valor");
     formData.append("descripcion", "valor");
     formData.append("etiquetas", "valor");*/

    $.ajax({
        url: "RecursoSrv",
        type: "put",
        dataType: "html",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
            alerta("OK" + data);
        },
        error: function (error) {
            console.log(error);
            alerta("No OK: " + error, "error");
        }
    });
});