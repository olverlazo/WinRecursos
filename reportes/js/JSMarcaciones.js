
//document.getElementById("HTMLPdf").style.display = 'none';
//INACTIVA EL IDSERVICIO
//document.getElementById("mdatos").style.display = 'none';
document.getElementById("idpersona").style.display = 'none';






var idservcio = 0;
var paseTabla;


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
                url: "Marcaciones.aspx/CargarLista",
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
var idpersona1 = 0

//obtiene los valores de la fila seleccionada
$(document).on('click', '#VerCronograma', function () {
    document.getElementById("mdatos").style.display = 'inline';
    carnet = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["ci"];
    nombre = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["nombres"];
    $('#nombres').text(nombre);

    $('#nombresPDF').text(nombre);

    
    idservcio = 0;
    $.ajax({
        type: 'POST',
        url: "Marcaciones.aspx/CargarDatos",
        data: '{"v1": "' + carnet + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var campo = document.getElementById('contrato');
            var campo1 = document.getElementById('bloque');
            if (response.d[3] == 'error') {
                campo.style.color = "red";
                campo1.style.color = "red";
                $('#idpersona').text(response.d[1]);
                $('#ci').text(response.d[2]);
                $('#contrato').text('SIN CONTRATO VIGENTE');
                $('#categoria').text('');
                $('#ff').text('');
                $('#bloque').text('SIN CARGO VIGENTE');
                $('#cargo').text('');
                idservcio = 1;

            }
            else {
                campo.style.color = "WHITE";
                campo1.style.color = "WHITE";
                idpersona1 = response.d[0]
                $('#idpersona').text(response.d[1]);
                $('#ci').text(response.d[2]);
                $('#contrato').text(response.d[3]);
                $('#categoria').text(response.d[4]);
                $('#ff').text(response.d[5]);
                $('#bloque').text(response.d[6]);
                $('#cargo').text(response.d[7] + " - " + response.d[8]);


                $('#ciPDF').text(response.d[2]);
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            $.alert("Error!: " + err.Message)
        }
    });
});



$(document).ready(function () {
    //CARGA TIPO TURNO
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Marcaciones.aspx/funcion_tipoturno",
        dataType: "json",
        success: function (result) {
            $('#tipoturno').empty();
            $('#tipoturno').append("<option value=''>--Seleccionar--</option>");
            $.each(result.d, function (key, value) {
                $("#tipoturno").append($("<option></option>").val(value.turno_id).html(value.turno_detalle));
                //$("#categoria1").append($("<option></option>").val(value.categoria_descripcion).html(value.categoria_descripcion));
            });
            // $("#ddlDepartments").select2();
        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });
});




function get_ListaMarcacionPDF(v1, v2, v3) {
    $('#fechadel').text(v1);
    $('#fechaal').text(v2);
    $.ajax({
        async: false,
        type: 'POST',
        url: "Marcaciones.aspx/ListarMarcaciones",
        data: '{"v1": "' + v1 + '","v2": "' + v2 + '","v3": "' + v3 + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
            var table1 = $("#TablePDF").DataTable({
                'paging': false,
                'lengthChange': false,
                'searching': false,
                'ordering': false,
                'info': false,
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
                   { "data": "fecha", type: 'date' },
                   { "data": "hora" },
                   { "data": "bloque" },
                   { "data": "servicio" },
                   { "data": "fuente" },
                   { "data": "cargo" },
                   { "data": "tipocontrato" },

                ],
            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }
    });
}

//LISTAR Turnos
$(document).on('click', '#imprimir', function () {
    if (idpersona1 == 0) {
       $.alert("- Debe elegir un personal")
           } else {        
        get_ListaMarcacion($('#indate11').val(), $('#indate2').val(), idpersona1);
        get_ListaMarcacionPDF($('#indate11').val(), $('#indate2').val(), idpersona1);
    }
});




//LISTAR TURNOS
function get_ListaMarcacion(v1,v2,v3) {
    $.ajax({
        type: 'POST',
        url: "Marcaciones.aspx/ListarMarcaciones",
        data: '{"v1": "' + v1 + '","v2": "' + v2 + '","v3": "' + v3 + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
            var table1 = $("#TableListaTurno").DataTable({
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
                   { "data": "fecha" },
                   { "data": "hora" },
                   { "data": "bloque" },
                   { "data": "servicio"},
                   { "data": "fuente" },
                   { "data": "cargo" },
                   { "data": "tipocontrato" },                   
                ],
            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }

    });
}





