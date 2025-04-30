

$(document).ready(function () {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "VoletaVacacion.aspx/CargarVacacion",
        data: '{"id_Vacacion": "' + idVacacion + '"}',
        dataType: "json",
        success: function (result) {
            console.log(result)
            $('#numero').text(idVacacion);
            $('#nombre').text(result.d[2] + " " + result.d[1] + " " + result.d[0]);
            $('#ci').text(result.d[3] + " " + result.d[4] + " " + result.d[5]);
            $('#bloque').text(result.d[6]);
            $('#categoria').text(result.d[7]);
            $('#tpersonal').text(result.d[8]);
            $('#unidad').text(result.d[9]);
            $('#cargo').text(result.d[10]);
            if (result.d[11] == 0)
            {
                $('#tvacacion').text("Dias cuenta vacacion");
            } else {
                $('#tvacacion').text("Vacacion");
            }
            $('#gestion').text(result.d[12]);
            $('#fecha1').text(result.d[13]);
            $('#fecha2').text(result.d[14]);
            $('#Fincorporacion').text(result.d[15]);
            $('#dias').text(result.d[16]);
            $('#observacion').text(result.d[17]);
            $('#FechaRec').text(result.d[18]);

        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });
});
