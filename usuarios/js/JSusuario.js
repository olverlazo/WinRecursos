

$('#guardar').click(function () {
    if (clave == $('#ConAnt').val()) {
        if ($('#ConAct').val() == $('#ConAct1').val()) {
            $.ajax({
                type: 'POST',
                url: 'usuario.aspx/get_usuario',
                data: '{"v1": "' + id + '", "v2": "' + $('#ConAct').val() + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == "OK") {
                        Swal.fire({
                            icon: "success",
                            title: "Los datos se guardaron correctamente",
                            showConfirmButton: false,
                            timer: 1500
                        });                      
                    } else {
                        //alert(response.d);
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: response.d,
                        });
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    var err = eval("(" + XMLHttpRequest.responseText + ")");
                    //alert("Error!: " + err.Message)
                    Swal.fire({
                        icon: "error",
                        title: "Error",
                        text: "Error!: " + err.Message,
                    });
                }
            });


        }else {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "Debe repetir la misma contraseña",
            });
        }
    } else {
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "La contraseña es incorrecta",
        });
    }
   
});