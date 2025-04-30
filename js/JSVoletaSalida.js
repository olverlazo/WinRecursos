

$(document).ready(function () {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "VoletaSalida.aspx/CargarSalida",
        data: '{"id_salida": "' + idsalida + '"}',
        dataType: "json",
        success: function (result) {            
            $('#numero').text(idsalida);
            $('#nombre').text(result.d[2] + " " + result.d[1] + " " + result.d[0]);
            $('#ci').text(result.d[3] + " " + result.d[4] + " " + result.d[5]);
            $('#bloque').text(result.d[6]);
            $('#categoria').text(result.d[7]);
            $('#tpersonal').text(result.d[8]);
            $('#unidad').text(result.d[9]);
            $('#cargo').text(result.d[10]);
            $('#fpermiso').text(result.d[11]);
            $('#tpermiso').text(result.d[12]);
            $('#hora1').text(result.d[13]);
            $('#hora2').text(result.d[14]);
            $('#motivo').text(result.d[15]);
            
              
            
            $('#numero1').text(idsalida);
            $('#nombre1').text(result.d[2] + " " + result.d[1] + " " + result.d[0]);
            $('#ci1').text(result.d[3] + " " + result.d[4] + " " + result.d[5]);
            $('#bloque1').text(result.d[6]);
            $('#categoria1').text(result.d[7]);
            $('#tpersonal1').text(result.d[8]);
            $('#unidad1').text(result.d[9]);
            $('#cargo1').text(result.d[10]);
            $('#fpermiso1').text(result.d[11]);
            $('#tpermiso1').text(result.d[12]);
            $('#hora11').text(result.d[13]);
            $('#hora22').text(result.d[14]);
            $('#motivo1').text(result.d[15]);

        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });
});
