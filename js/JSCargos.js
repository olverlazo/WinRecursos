$(function () {
    $('#TablePersona').DataTable({
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
        }
    })
});


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
                url: "Cargos.aspx/CargarLista",
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
               { "defaultContent": "<button type='button' id='VerContratos' class='VerContratos btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-user bg-aqua'></i></button>" },
            ]
        });

    } obtener_data_editar("#TablePersona tbody", $("#TablePersona").DataTable());
});



//OBTERNER LOS CONTRATOS
var obtener_data_editar = function (tbody, table) {
    $(tbody).on("click", "button.VerContratos", function () {
        var tabla_carnet = table.row($(this).parents("tr")).data();
        if (typeof tabla_carnet != 'undefined') {
            carnet = table.row($(this).parents("tr")).data()["ci"];
            var nombre = table.row($(this).parents("tr")).data()["nombres"];
            //****************************************
            $('#nombres').text("NOMBRE:  " + nombre);
            $('#ci').text("C.I.: " + carnet);
            get_cargos(0, 0, carnet, 0, 0, 0, 0, 0, 1);
        }
    });

}

//LLAMA A FUNCION GET_CONTRATOS DEPENDIENDO DE LA ACCION EN EL @SW

function get_cargos(id, id_contrato, id_personal, id_bloque, id_servicio, cargo, fecha_ini, fecha_fin, sw) {
    //console.log(id_personal)
    //console.log(sw)
    $.ajax({
        type: 'POST',
        url: "Cargos.aspx/CargarCargos",
        data: '{"id": "' + id + '","id_contrato": "' + id_contrato + '","id_personal": "' + id_personal + '","id_bloque": "' + id_bloque + '","id_servicio": "' + id_servicio + '","cargo": "' + cargo + '","fecha_ini": "' + fecha_ini + '","fecha_fin": "' + fecha_fin + '","sw": "' + sw + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
            $("#TableContratosPersona").DataTable({
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
                    "emptyTable": "Ningún cargo encontrado",
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
                   { "data": "id" },
                   { "data": "id_contrato" },
                   { "data": "id_bloque" },
                   { "data": "id_servicio" },
                   { "data": "cargo" },
                   { "data": "fecha_ini", type: 'date' },
                   { "data": "fecha_fin", type: 'date' },
                   { "defaultContent": "<button type='button' id='EContrato' class='EContrato btn-primary btn-sm checkbox-toggle' data-target='#modal-nuevo' id='EContrato'><i class='fa fa-user bg-aqua'></i></button> <button type='button' id='EEContrato' class='EContrato btn-primary btn-sm checkbox-toggle' data-target='#modal-nuevo' id='EContrato'><i class='fa fa-user bg-aqua'></i></button>" },
                   { "defaultContent": "<tbody class='table-body'> <tr class='cell-1' data-toggle='collapse' data-target='#demo'> </tr></tbody>" },
                  // console.log(json.d.data)
                ]
            });
        },
        //****************************************
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }
    });
}

var validar = 0
function validacion(v1, v2, v3, v4) {
    $.ajax({
        type: 'POST',
        url: "Cargos.aspx/valida_contrato",
        data: '{"v1": "' + v1 + '","v2": "' + v2 + '","v3": "' + v3 + '","v4": "' + v4 + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            // console.log(response.d)
            if (response.d == '') {
                $.confirm({
                    title: 'Guardar?',
                    content: 'Desea Guardar los datos!',
                    buttons: {
                        guardar: {
                            btnClass: 'btn-green',
                            keys: ['enter', 'shift'],
                            action: function () {
                                //$.alert('Los datos se guardaron correctamente');
                                // get_contratos(idContrato, carnet, $('select[name=categoria1]').val(), $('#item').val(), $('select[name=fuente]').val(), $('select[name=ch]').val(), $('#inicontrato').val(), $('#fincontrato').val(), '', 'ACTIVO', 1, '01/01/2000', 2);
                                if (v1 == 0) {

                                    get_contratos(idContrato, carnet, $('select[name=categoria1]').val(), $('select[name=tpersonal]').val(), $('#item').val(), $('select[name=fuente]').val(), $('select[name=ch]').val(), $('#inicontrato').val(), $('#fincontrato').val(), '', 'ACTIVO', '<%= Session("idusuario").ToString%>', '01/01/2000', 2);
                                }
                                else {
                                    get_contratos(idContrato, carnet, $('select[name=categoria1]').val(), $('select[name=tpersonal]').val(), $('#item').val(), $('select[name=fuente]').val(), $('select[name=ch]').val(), $('#inicontrato').val(), $('#fincontrato').val(), '', 'ACTIVO', '<%= Session("idusuario").ToString%>', '01/01/2000', 3);
                                }

                                $.alert('Los datos se guardaron correctamente');
                                $("#modal-nuevo").modal("hide");
                                // alert($('select[name=categoria1]').val());
                            }
                        },
                        cancelar: function () {
                        },
                    }
                });
            }
            else {
                // alert( response.d[0] + '\n' +  response.d[1] + '\n' +  response.d[2])
                $.alert(response.d[0])
            }

            //if (response.d[0] == '' && response.d[1] == '' && response.d[2] == '') {
            //    validar = 1
            //    return 1
            //}
            //else {
            //    validacion(idContrato, carnet, $('#inicontrato').val(), $('#fincontrato').val())
            //    return 0
            //     alert('-' + response.d[0] + '\n' + '-' + response.d[1] + '\n' + '-' + response.d[2])
            //}
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }
    });
}

//precionar el boton GUARDAR
$('#btnGuardar').click(function () {
    var validation = $("#form").validate();
    //console.log(carnet)
    //console.log(idContrato)
    if (validation.isValid() == true) {
        validacion(idContrato, carnet, $('#inicontrato').val(), $('#fincontrato').val());

    }
});


//SE EJECUTA CUANDO SE PRECIONA EL BOTON btnGuardar
//$(function () {
//    $(".example-the-1").click(validateForm);
//});
function validateForm() {
    //alert('ingresa a la funcion');


    // var validation = $("#form").validate();




    //if (validation.isValid() === true) {
    //    $.confirm({
    //        title: 'Guardar?',
    //        content: 'Desea Guardar los datos!',
    //        buttons: {
    //            guardar: {
    //                btnClass: 'btn-green',
    //                keys: ['enter', 'shift'],
    //                action: function () {
    //                    //$.alert('Los datos se guardaron correctamente');
    //                    validacion(idContrato, carnet, $('#inicontrato').val(), $('#fincontrato').val())
    //                    if (validar = 1) {
    //                        // get_contratos(idContrato, carnet, $('select[name=categoria1]').val(), $('#item').val(), $('select[name=fuente]').val(), $('select[name=ch]').val(), $('#inicontrato').val(), $('#fincontrato').val(), '', 'ACTIVO', 1, '01/01/2000', 2);
    //                        get_contratos(idContrato, carnet, $('select[name=categoria1]').val(), $('#item').val(), $('select[name=fuente]').val(), $('select[name=ch]').val(), $('#inicontrato').val(), $('#fincontrato').val(), '', 'ACTIVO', 1, '01/01/2000', 2);

    //                        $.alert('Los datos se guardaron correctamente');
    //                        $("#modal-nuevo").modal("hide");
    //                        // alert($('select[name=categoria1]').val());

    //                    }
    //                   // get_contratos(0, carnet, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);

    //                }
    //            },
    //            cancelar: function () {
    //            },
    //        }
    //    });
    //}





    //else {
    //    alert("boo :(");
    //}
}

//VARIABLES DE INICIO
var carnet = 0
var idContrato = 0

//precionar el boton editar contratos
$(document).on('click', '.EContrato', function () {
    $("#modal-nuevo").modal("show");

    idContrato = $(this).closest('tr').children()[0].textContent
    $.ajax({
        type: 'POST',
        url: "Contratos.aspx/ver_datos",
        data: '{"v1": "' + idContrato + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //alert(response.d[0]);
            $('#categoria1').val(response.d[0]);
            $('#fuente').val(response.d[1]);

            $('#tpersonal').val(response.d[2]);

            $('#item').val(response.d[3]);

            if (response.d[4] == 'T/C') {
                $('#ch').val(2);
            }
            else {
                $('#ch').val(1);
            }
            $('#inicontrato').val(response.d[5]);
            $('#fincontrato').val(response.d[6]);

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }
    });


    //idContrato = $(this).closest('tr').children()[0].textContent
    //var categoria = $(this).closest('tr').children()[2].textContent
    //var financiamiento = $(this).closest('tr').children()[1].textContent
    //var item = $(this).closest('tr').children()[3].textContent
    //var fingreso = $(this).closest('tr').children()[4].textContent
    //var fretiro = $(this).closest('tr').children()[5].textContent
    //var estado = $(this).closest('tr').children()[6].textContent


    //$('#msn').text(categoria);


    //$('#fuente').val($(this).closest('tr').children()[1].textContent);
    //$('#categoria1').val($(this).closest('tr').children()[2].textContent);    
    //$('#item').val($(this).closest('tr').children()[3].textContent);
    //$('#ch').val($(this).closest('tr').children()[3].textContent);
    //$('#item').val($(this).closest('tr').children()[3].textContent);

    //console.log($(this).closest('tr').children()[2].textContent)
    //console.log(carnet)
});

//precionar el boton nuevo contratto
$('#NuevoContrato').click(function () {
    idContrato = 0
    if (carnet == 0) {
        alert('Debe selecionar un personal')
    }
    else {
        $("#modal-nuevo").modal("show");
        $('#categoria1').val('');
        $('#fuente').val('');
        $('#tpersonal').val('');
        $('#ch').val("");
        $('#item').val('');
        $('#inicontrato').val('');
        $('#fincontrato').val('');
    }
});


$(document).ready(function () {
    //CARGA CATEGORIA
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Cargos.aspx/funcion_Categoria",
        data: '{"v1": "0", "v2": "0", "v3": "4"}',
        dataType: "json",
        success: function (result) {
            $('#categoria1').empty();
            $('#categoria1').append("<option value=''>--Seleccionar--</option>");
            $.each(result.d, function (key, value) {
                $("#categoria1").append($("<option></option>").val(value.categoria_id).html(value.categoria_descripcion));
            });
            // $("#ddlDepartments").select2();
        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });



    //CARGA FUENTE DE FINANCIAMINETO
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Cargos.aspx/fuente_financiamiento",
        data: '{"v1": "0", "v2": "0", "v3": "4"}',
        dataType: "json",
        success: function (result) {
            $('#fuente').empty();
            $('#fuente').append("<option value=''>--Seleccionar--</option>");
            $.each(result.d, function (key, value) {
                $("#fuente").append($("<option></option>").val(value.fuente_id).html(value.fuente_descripcion));
            });
            // $("#ddlDepartments").select2();
        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });


    //CARGA TIPO CONTRATO
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Cargos.aspx/tipo_personal",
        data: '{"v1": "0", "v2": "0", "v3": "4"}',
        dataType: "json",
        success: function (result) {
            $('#tpersonal').empty();
            $('#tpersonal').append("<option value=''>--Seleccionar--</option>");
            $.each(result.d, function (key, value) {
                $("#tpersonal").append($("<option></option>").val(value.tpersponal_id).html(value.tpersponal_tipo));
            });
            // $("#ddlDepartments").select2();
        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });


    //SOLO NUMEROS EN ITEM
    jQuery("#item").on('input', function (evt) {
        // Allow only numbers.
        jQuery(this).val(jQuery(this).val().replace(/[^0-9]/g, ''));
    });


});


$(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //$('#datemask1').inputmask('*', { 'placeholder': '*' })
    $('#datemask1').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })

    //MASCARA PARA LA FECHA
    $('[data-mask]').inputmask()
    $('[data-mask1]').inputmask()

    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
        checkboxClass: 'icheckbox_flat-green',
        radioClass: 'iradio_flat-green'
    })
});