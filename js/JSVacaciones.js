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
                    text: "Se produjo un arror intente mas tarde",
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
                    //campo.style.color = "WHITE";
                    //campo1.style.color = "WHITE";
                    $('#idpersona').text(response.d[0]);
                    $('#ci').text(response.d[1] + '-' + response.d[2] + '-' + response.d[3]);
                    $('#contrato').text(response.d[8]);
                    $('#categoria').text(response.d[7]);
                    $('#ff').text(response.d[9]);
                    $('#bloque').text(response.d[10]);
                    $('#cargo').text(response.d[11] + " - " + response.d[12]);


                    VIbloque = response.d[11]
                    VIcategoria = response.d[7]
                    VItpersonal = response.d[8]
                    VIunidad = response.d[12]
                    VIcargo = response.d[10]


                    $('#Label2').text(response.d[11])

                    $('#Label3').text(response.d[7])

                    $('#tpersonal').text(response.d[8])

                    $('#unidad').text(response.d[12])

                    $('#Label4').text(response.d[10])
                }
                get_Vacaciones($('#idpersona').text());
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

$(document).on('click', '#NuevaVacacion', function () {
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

                $.ajax({
                    async: false,
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Vacaciones.aspx/funcion_cronograma",
                    data: '{"v1": "' +  $('#idpersona').text() + '"}',
                    dataType: "json",
                    success: function (result) {
                        console.log(result)
                        $('#listagestion').empty();
                        $('#listagestion').append("<option value=''>-- Seleccionar --</option>");
                        $.each(result.d, function (key, value) {
                            $("#listagestion").append($("<option></option>").val(value.idregistro).html(value.gestion));
                        });
                        // $("#ddlDepartments").select2();
                    },
                    error: function ajaxError(result) {
                        //alert(result.status + ' : ' + result.statusText);
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: result.status + ' : ' + result.statusText,
                        });
                    }
                });
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


function opcion() {
    var idcronograma
    idcronograma = document.getElementById('listagestion').value
    var dias
    dias = $('#listagestion').find('option:selected').text()
    if (dias.length == 15)
    {
        //$('#dias').val(dias.substring(8, 11))
        return dias.substring(8,11)
        
    } else {
        if (dias.length < 15) {
            //$('#dias').val(dias.substring(8, 9))
            return dias.substring(8, 9)
        } else {
            $('#dias').val('')
        }
    } 

}




//SOLO NUMEROS EN TELEFONO
jQuery("#dias").on('input', function (evt) {
    // Allow only numbers.
    jQuery(this).val(jQuery(this).val().replace(/[^0-9]/g, ''));
});

function createDate(dateString) {
    var dateParts = dateString.split("/");
    return new Date(Date.UTC(+dateParts[2], dateParts[1] - 1, +dateParts[0]));
}

//precionar el boton GUARDAR DATOS
$(document).on('click', '#GuardarDatos', function (e) {
    var tipo = document.getElementById('tipo').value
    var idgronograma = document.getElementById('listagestion').value

    var dias = $('#dias').val()
    var resumen = $('#resumen').val()
    var fecha1 = $('#indate1').val()
    var fecha2 = $('#indate2').val()
    var fecha3 = $('#indate3').val()

    var fechaInicio = new Date(fecha1).getTime();
    var fechaFin = new Date(fecha2).getTime();

    var diastotal = opcion()

    if (createDate(fecha2).getTime() >= createDate(fecha1).getTime()) {
        e.preventDefault();
        if (parseInt(dias) > parseInt(diastotal)) {
            //console.log(dias)
            //console.log(diastotal)
            //$.alert("- No puede exeder los " + diastotal + " dias de vacacion")
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "No puede exeder los " + diastotal + " dias de vacacion",
            });
        } else {
            if (tipo == 0 && dias > parseInt(dias)) {
                //$.alert("- Segun ley solo se puede sacar 4 dias permiso cuenta vacacion")
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: "Segun ley solo se puede sacar 4 dias permiso cuenta vacacion",
                });
            } else {

                if (createDate(fecha2).getTime() >= createDate(fecha3).getTime()) {
                    //$.alert("- La fecha de incorporacion debe ser mayor que la fecha " + fecha2)
                    Swal.fire({
                        icon: "error",
                        title: "Error",
                        text: "La fecha de incorporacion debe ser mayor que la fecha " + fecha2,
                    });
                } else {
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
                                                url: 'Vacaciones.aspx/funcion_GrabaVacacion',
                                                data: '{"v0aux": "0", "v0": "' + $('#idpersona').text() + '","v1": "' + idgronograma + '", "v2": "' + dias + '",  "v3": "' + tipo + '","v4": "' + fecha1 + '", "v5": "' + fecha2 + '",  "v6": "' + fecha3 + '","v7": "' + resumen + '","v8": "' + idusuariopersonal + '","v9": "1"}',
                                                contentType: "application/json; charset=utf-8",
                                                dataType: "json",
                                                success: function (response) {
                                                    if (response.d == "OK") {
                                                        //$.alert('Los datos se guardaron correctamente');


                                                       get_Vacaciones($('#idpersona').text());
                                                       $("#modal-nuevo").modal("hide");
                                                       get_muestravoleta($('#idpersona').text());
                                                       $("#modal-PDF").modal("show");
                                                       generarPDF();



                                                        $('#tipo').val('--Seleccionar--')
                                                        $('#listagestion').val("-- Seleccionar --")
                                                        $('#dias').val("")
                                                        $('#resumen').val("")
                                                        
                                                      
                                                    } else { alert(response.d); }
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
            }
            }
        }
    } else {
        //$.alert("- La fecha final debe ser mayor o igual a la fecha inicial")
        Swal.fire({
            icon: "error",
            title: "Error",
            text: 'La fecha final debe ser mayor o igual a la fecha inicial',
        });
    }
});


function get_muestravoleta(idvaca) {

    $.ajax({
        async: false,
        type: 'POST',
        url: "Vacaciones.aspx/Maxvacacion",
        data: '{"v1": "' + idvaca + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#numero').html(result.d);
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


    $('#nombre').text(nombres.textContent);
    $('#cipdf').text(ci.textContent);


    var vcombo = document.getElementById("tipo");
    var vtipo = vcombo.options[vcombo.selectedIndex].text;
    $('#tvacacion').text(vtipo)

    vcombo = document.getElementById("listagestion");
    vtipo = vcombo.options[vcombo.selectedIndex].text;
    $('#gestion').text(vtipo.substring(0,4))         
    $('#cantidaddias').text($('#dias').val())
    $('#observacion').text($('#resumen').val())

    $('#fecha1').text($('#indate1').val())
    $('#fecha2').text($('#indate2').val())
    $('#fecha3').text($('#indate3').val())
}



//MOSTRAR DATOS DE ANULAR VACACION
var idvacacion1
$(document).on('click', '#anular', function () {

    if ($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["estado"] == 'ANULADO') {
        //$.alert("- La Vacacion ya fue anulada")
        Swal.fire({
            icon: "error",
            title: "Error",
            text: 'La Vacacion ya fue anulada',
        });
    } else {
        $("#modal-anular").modal("show");
        $('#nombrea').text($('#nombres').text());
        $('#gestiona').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["gestion"]);
        $('#tipoa').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["tipovacacion"]);
        $('#fecha1a').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["fecha1"]);
        $('#fecha2a').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["fecha2"]);
        $('#diasa').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["dias"]);
        $('#observaciona').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["observacion"]);
        idvacacion1 = $("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["idVacacion"];
    }
});


$(document).on('click', '#GuardaAnular', function () {
    $.confirm({
        title: 'Guardar?',
        content: 'Desea Guardar los datos!',
        buttons: {
            guardar: {
                btnClass: 'btn-green',
                keys: ['enter', 'shift'],
                action: function () {
                    AnularVacacion(idvacacion1)
                    $("#modal-anular").modal("hide");
                    get_Vacaciones($('#idpersona').text())
                }
            },
            cancelar: function () {
            },
        }
    });
});
//ANULAR LA SALIDA

function AnularVacacion(v1) {
    $.ajax({
        type: 'POST',
        url: "Vacaciones.aspx/AnularVacacion",
        data: '{"v1": "' + v1 + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d == "ok") {
                //$.alert("SE ANULO CORRECTAMENBTE")
                Swal.fire({
                    position: "center",
                    icon: "success",
                    title: "SE ANULO CORRECTAMENBTE",
                    showConfirmButton: false,
                    timer: 1500
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




//LISTA DE VACACIONES
function get_Vacaciones(idpersona) {
    $.ajax({
        type: 'POST',
        url: "Vacaciones.aspx/ListaVacaciones",
        data: '{"v1": "' + idpersona + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
            //console.log(json)
            var table1 = $("#TableVacaciones").DataTable({
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
                   { "data": "idVacacion" },
                   { "data": "gestion" },
                   { "data": "tipovacacion" },
                   { "data": "dias" },
                   { "data": "fecha1", type: 'date' },
                   { "data": "fecha2", type: 'date' },
                   { "data": "fechaIncorporacion", type: 'date' },
                   { "data": "observacion" },
                   //{ "data": "estado" },
                   {
                         "data": "estado",
                         render: function (data, type) {
                             if (type === 'display') {
                                 var color = 'green'
                                 switch (data) {
                                     case 'ACTIVO':
                                         color = 'green'
                                         break;
                                     case 'ANULADO':
                                         color = 'red'
                                         break;
                                     case 'FINALIZADO':
                                         color = 'blue'
                                         break;
                                 }
                                 return '<span style="color:' + color + '">' + data + '</span>';
                             }
                             return data;
                         },
                     },
                   { "defaultContent": "<button type='button' title='ANULAR VACACION' id='anular' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-user'></i></button> <button type='button' id='imprimir' title='IMPRIMIR' class='btn btn-success  btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-print'></i></button> " },
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

//llama a la ventana de impresion de vaciones
//$(document).on('click', '#imprimir', function () {
//    if ($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["estado"] == 'ANULADO') {
//        $.alert("- La orden de vacion esta anulada")
//    } else {
//        var idVacacion = $("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["idVacacion"];
//        window.open("../VoletaVacacion.aspx?idVacacion=" + idVacacion, '_blank', 'width=800,height=600 top=200,left=500')
//    }
//});