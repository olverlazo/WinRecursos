$(document).ready(function () {
    var id = 0
    var desconexion = document.getElementById('desconexion');
    var btnDescargar = document.getElementById('btnDescargar');
    desconexion.disabled = true
    btnDescargar.disabled = true
    var campo = document.getElementById('Label21');
    $('#Label21').text("Dispositivo DesConectado");
    campo.style.color = "Red";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "ListaDispositivos.aspx/Lista_Dispositivo",
        data: '{"v1": "' + id + '"}',
        dataType: "json",
        success: function (result) {
            $('#dispositivo').empty();
            $('#dispositivo').append("<option value=''>--Seleccionar--</option>");
            $.each(result.d, function (key, value) {
                $("#dispositivo").append($("<option></option>").val(value.id_dispositivo).html(value.nombre));
            });
        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }       
    });
});






function listar() {
    var id = $('select[name=dispositivo]').val()
    var campo = document.getElementById('Label21');
    var conexion = document.getElementById('conexion');
    var desconexion = document.getElementById('desconexion');
    var btnDescargar = document.getElementById('btnDescargar');

    if (id == '') {
        //$.alert("Seleccione un dispositivo ")
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "Seleccione un dispositivo!",
        });
    } else {


            $.ajax({
                type: 'POST',
                url: "ListaDispositivos.aspx/muestra",
                data: '{"v1": "' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                beforeSend: function () {
                    document.body.appendChild(fgp_loader);
                },

                success: function (response) {
                    if (response.d[0] == 'false') {
                        fgp_loader.remove();
                        //$.alert("Se produjo un Error no se puede conectar al dispositivo verique la red!: ")

                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: "Se produjo un Error no se puede conectar al dispositivo verifique la red!",
                        });
                    } else {
                            $('#ndisp1').text(id);
                            $('#Label11').text(response.d[0]);
                            $('#modelo1').text(response.d[1]);
                            $('#ns1').text(response.d[2]);
                            $('#dmac1').text(response.d[3]);
                            $('#Label21').text("Dispositivo Conectado");
                            campo.style.color = "Green";
                            conexion.disabled = true
                            desconexion.disabled = false
                            btnDescargar.disabled = false
                            fgp_loader.remove();
                            Swal.fire({
                                icon: "success",
                                title: "Se conecto al dispositivo",
                                showConfirmButton: false,
                                timer: 1500
                            });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    var err = eval("(" + XMLHttpRequest.responseText + ")");
                    alert("Error!: " + err.Message)
                }
            });
    }
}



$('#conexion').click(function () {
    listar();
});

$('#desconexion').click(function () {
    var campo = document.getElementById('Label21');
    var conexion = document.getElementById('conexion');
    var desconexion = document.getElementById('desconexion');
    var btnDescargar = document.getElementById('btnDescargar');
    $('#ndisp1').text("");
    $('#Label11').text("");
    $('#modelo1').text("");
    $('#ns1').text("");
    $('#dmac1').text("");
    $('#totalmar1').text('');
    $('#regdescarga1').text('');
    $('#Label21').text("Dispositivo DesConectado");
    campo.style.color = "Red";
    conexion.disabled = false
    desconexion.disabled = true
    btnDescargar.disabled = true
    Swal.fire({
        icon: "success",
        title: "Se desconecto al dispositivo",
        showConfirmButton: false,
        timer: 1500
    });
});


$('#btnDescargar').click(function () {
    var id = $('select[name=dispositivo]').val()
    var campo = document.getElementById('Label21');
    var btnDescargar = document.getElementById('btnDescargar');
    $.ajax({
        type: 'POST',
        url: "ListaDispositivos.aspx/dascarga",
        data: '{"strIDDispo": "' + id + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        beforeSend: function () {
            document.body.appendChild(fgp_loader);
        },

        success: function (response) {          
            if (response.d[0] =='error') {
                $.alert("Se produjo un Error!: ")
            } else {
                //$.alert("Existen : " + response.d[0] + " registros en el biometrico" + "\n se descargaron " + response.d[1] + " registros nuevos")

                Swal.fire({
                    icon: "success",
                    title: "Existen : " + response.d[0] + " marcaciones en el biometrico",
                    text: "Se descargaron " + response.d[1] + " nuevas marcaciones",
                });


                $('#totalmar1').text(response.d[0]);
                $('#regdescarga1').text(response.d[1]);
            }
            fgp_loader.remove();
            campo.style.color = "Green";
            conexion.disabled = true
            desconexion.disabled = false            
            fgp_loader.remove();
            btnDescargar.disabled=false
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }
    });
});