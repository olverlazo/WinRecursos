

$(document).ready(function () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "VoletaLicencia.aspx/CargarLicencia",
        data: '{"id_licencia": "' + idlicencia + '"}',
        dataType: "json",
        success: function (result) {
            $('#numero').text(idlicencia);
            $('#nombre').text(result.d[2] + " " + result.d[1] + " " + result.d[0]);
            $('#ci').text(result.d[3] + " " + result.d[4] + " " + result.d[5]);
            $('#bloque').text(result.d[6]);
            $('#categoria').text(result.d[7]);
            $('#tpersonal').text(result.d[8]);
            $('#unidad').text(result.d[9]);
            $('#cargo').text(result.d[10]);
            $('#tlicencia').text(result.d[13]);
            $('#motivo').text(result.d[12]);
            $('#fecha1').text(result.d[15]);
            $('#fecha2').text(result.d[16]);
            $('#resumen').text(result.d[14]);
        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });
});