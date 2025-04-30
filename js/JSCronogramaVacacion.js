//INACTIVA EL IDSERVICIO
document.getElementById("mdatos").style.display = 'none';
document.getElementById("idpersona").style.display = 'none';

// MUESTRA LA TABLA DE PERSONAL
$("#txtvalor").on("input", function (e) {
    var input = $(this);
    var val = input.val();
    if (val.length > 1) {
        $("#TablePersona").DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': false,
            'ordering': false,
            'info': true,
            'autoWidth': false,
            language: {
                "processing": "Procesando...",
                "lengthMenu": "Mostrar _MENU_ registros",
                "zeroRecords": "No se encontraron resultados",
                "emptyTable": "Ningún dato disponible en esta tabla",
                "info": "Registros del _START_ al _END_ de un total de _TOTAL_",
                "infoEmpty": "Registros del 0 al 0 de un total de 0",
                "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                "search": "Buscar:",
                "infoThousands": ",",
                "loadingRecords": "Cargando...",
                "paginate": {
                    "first": "Primero",
                    "last": "Último",
                    "next": "Siguiente",
                    "previous": "Anterior"
                },
                "aria": {
                    "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sortDescending": ": Activar para ordenar la columna de manera descendente"
                },
            },
            destroy: true,
            responsive: true,
            ajax: {
                method: "POST",
                url: "Permisos.aspx/CargarLista",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: function (d) {
                    d.v1 = val;
                    return JSON.stringify(d);
                },
                dataSrc: "d.data"
            },
            "columns": [
               { "data": "nombres" },
               { "data": "ci" },
               { "defaultContent": "<button type='button' id='VerCronograma' class='VerContratos btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-user'></i></button>" },
            ]
        });
    }; 
});
//VARIABLES DE INICIO
var carnet = 0

//obtiene los valores de la fila seleccionada
$(document).on('click', '#VerCronograma', function () {
    document.getElementById("mdatos").style.display = 'inline';
    carnet = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["ci"];
    nombre = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["nombres"];
    $('#nombres').text(nombre);
    $.ajax({
        type: 'POST',
        url: "CronogramaVacacion.aspx/BuscarDatos",
        data: '{"v1": "' + carnet + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d[0] == 'error') {
                //$.alert('- Surgio un arror intente mas tarde')
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: 'Se produjo un arror intente mas tarde',
                });
            }
            else {
                var campo = document.getElementById('contrato');
                var campo1 = document.getElementById('bloque');
                if ((response.d[8] == 'error') || (response.d[10] == 'error')) {
                    campo.style.color = "red";
                    campo1.style.color = "red";
                    $('#idpersona').text(response.d[0]);
                    $('#ci').text(response.d[1] + '-' + response.d[2] + '-' + response.d[3]);
                    $('#contrato').text('SIN CONTRATO VIGENTE');
                    $('#categoria').text('');
                    $('#ff').text('');
                    $('#bloque').text('SIN CARGO VIGENTE');
                    $('#cargo').text('');
                }
                else {
                    campo.style.color = "WHITE";
                    campo1.style.color = "WHITE";
                    $('#idpersona').text(response.d[0]);
                    $('#ci').text(response.d[1] + '-' + response.d[2] + '-' + response.d[3]);
                    $('#contrato').text(response.d[8]);
                    $('#categoria').text(response.d[7]);
                    $('#ff').text(response.d[9]);
                    $('#bloque').text(response.d[10]);
                    $('#cargo').text(response.d[11] + " - " + response.d[12]);
                }
                get_CronogramaV($('#idpersona').text());
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            //$.alert("Error!: " + err.Message)
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "Error!: " + err.Message,
            });
        }
    });

});


$(document).on('click', '#NuevoCronograma', function () {
    if ($('#contrato').text() == 'SIN CONTRATO VIGENTE') {
        $.alert("- El personnal no tiene contrato vigente")
    } else {
        if ($('#idpersona').text() == 0) {
            //$.alert("- Debe elegir un personal")
            Swal.fire({
                icon: "error",
                title: "Error",
                text: 'Debe elegir un personal',
            });
        } else {
            if (($('#ff').text() == 'Recursos ASSO') || ($('#ff').text() == 'Recursos Gobernacion') || ($('#ff').text() == 'Recursos HIPI') || ($('#ff').text() == 'Recursos Ministerio') || ($('#ff').text() == 'Recursos SUS') || ($('#ff').text() == 'Recursos TELESALUD') || ($('#ff').text() == 'Recursos TGN')) {

                $("#modal-nuevo").modal("show");
            } else {
                //$.alert("- La fuente de financiamiento no admite vacaciones")
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: 'La fuente de financiamiento no admite vacaciones',
                });
            }
        }
    }
});


//precionar el boton GUARDAR LICENCIA
$(document).on('click', '#GuardarCV', function (e) {
    var v1 = 0
    if ($('#indate1').val() <= $('#indate2').val()) {
        e.preventDefault();
        var validation = $("#form").validate();
        if (validation.isValid() == true) {
            $.confirm({
                title: 'Guardar?',
                content: 'Desea Guardar los datos!',
                buttons: {
                    guardar: {
                        btnClass: 'btn-green',
                        keys: ['enter', 'shift'],
                        action: function () {
                            $.ajax({
                                type: 'POST',
                                url: 'CronogramaVacacion.aspx/funcion_ingresar_CV',
                                data: '{"v1": "' + v1 + '", "v2": "' + $('#indate1').val() + '",  "v3": "' + $('#indate2').val() + '","v4": "' + $('#dia').val() + '", "v5": "' + $('#cas').val() + '",  "v6": "' + $('#idpersona').text() + '","v7": "' + idusuariopersonal + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (response) {
                                    if (response.d == "OK") {
                                        //$.alert('Los datos se guardaron correctamente');
                                        Swal.fire({
                                            position: "center",
                                            icon: "success",
                                            title: "Los datos se guardaron correctamente",
                                            showConfirmButton: false,
                                            timer: 1500
                                        });
                                        $('#dia').val('')
                                        $('#cas').val("")
                                        get_CronogramaV($('#idpersona').text());
                                        $("#modal-nuevo").modal("hide");
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
                        }
                    },
                    cancelar: function () {
                    },
                }
            });
        }
    } else {
        //$.alert("- La fecha final debe ser mayor")
        Swal.fire({
            icon: "error",
            title: "Error",
            text: 'La fecha final debe ser mayor',
        });
    }
});




function get_CronogramaV(idpersona) {

    $.ajax({
        type: 'POST',
        url: "CronogramaVacacion.aspx/ListaCronogramaV",        
        data: '{"v1": "' + idpersona + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
            //console.log(json)
            var table1 = $("#TableCronograma").DataTable({
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': false,
                'info': true,
                'autoWidth': false,
                language: {
                    "processing": "Procesando...",
                    "lengthMenu": "Mostrar _MENU_ registros",
                    "zeroRecords": "No se encontraron resultados",
                    "emptyTable": "Ningún dato encontrado",
                    "info": "Registros del _START_ al _END_ de un total de _TOTAL_",
                    "infoEmpty": "Registros del 0 al 0 de un total de 0",
                    "infoFiltered": "(filtrado de un total de _MAX_ registros)",
                    "search": "Buscar:",
                    "infoThousands": ",",
                    "loadingRecords": "Cargando...",
                    "paginate": {
                        "first": "Primero",
                        "last": "Último",
                        "next": "Siguiente",
                        "previous": "Anterior"
                    },
                    "aria": {
                        "sortAscending": ": Activar para ordenar la columna de manera ascendente",
                        "sortDescending": ": Activar para ordenar la columna de manera descendente"
                    },
                },
                destroy: true,
                responsive: true,
                "data": json.d.data,
                "columns": [
                   { "data": "idregistro" },
                   { "data": "fecha1", type: 'date' },
                   { "data": "fecha2", type: 'date' },
                   { "data": "dias" },
                   { "data": "cas" },                   
                   //{ "defaultContent": "<button type='button' title='ANULAR LICENCIA' id='anular' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-user'></i></button> <button type='button' id='imprimir' title='IMPRIMIR' class='btn btn-success  btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-print'></i></button> " },
                ],
            });
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
}