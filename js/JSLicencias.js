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
               { "defaultContent": "<button type='button' id='VerLicencias' class='VerContratos btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-user'></i></button>" },
            ]
        });
    }; //obtener_data_editar("#TablePersona tbody", $("#TablePersona").DataTable());
});
//VARIABLES DE INICIO
var carnet = 0



var VIbloque;
var VIcategoria;
var VItpersonal;
var VIunidad;
var VIcargo;
var VIidpersona;
//obtiene los valores de la fila seleccionada
$(document).on('click', '#VerLicencias', function () {
        document.getElementById("mdatos").style.display = 'inline';
        carnet = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["ci"];
        nombre = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["nombres"];
    $('#nombres').text(nombre);
    $.ajax({
        type: 'POST',
        url: "Licencias.aspx/BuscarDatos",
        data: '{"v1": "' + carnet + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //console.log(response.d)
            if (response.d[0] == 'error') {
                //$.alert('- Surgio un arror intente mas tarde')
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: 'Surgio un arror intente mas tarde',
                });
            }
            else {
                var campo = document.getElementById('contrato');
                var campo1 = document.getElementById('bloque');
                if ((response.d[8] == 'error') || (response.d[10] == 'error')) {
                    campo.style.color = "red";
                    campo1.style.color = "red";
                    $('#idpersona').text(response.d[0]);
                    //document.getElementById('ci').style.color = 'red';
                    $('#ci').text(response.d[1] + '-' + response.d[2] + '-' + response.d[3]);
                    $('#contrato').text('SIN CONTRATO VIGENTE');
                    $('#categoria').text('');
                    $('#ff').text('');
                    $('#bloque').text('SIN CARGO VIGENTE');
                    $('#cargo').text('');
                }
                else {
                    campo.style.color = "BLACK";
                    campo1.style.color = "BLACK";
                    $('#idpersona').text(response.d[0]);
                    //document.getElementById('ci').style.color = 'blue';
                    $('#ci').text(response.d[1] + '-' + response.d[2] + '-' + response.d[3]);
                    $('#contrato').text(response.d[8]);
                    //document.getElementById('categoria').style.color = 'blue';
                    $('#categoria').text(response.d[7]);
                    //document.getElementById('ff').style.color = 'blue';
                    $('#ff').text(response.d[9]);
                    //document.getElementById('bloque').style.color = 'blue';
                    $('#bloque').text(response.d[10]);
                    //document.getElementById('cargo').style.color = 'blue';
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
                //console.log($('#idpersona').text())
                get_Licencias($('#idpersona').text());
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


$(document).on('click', '#NuevaLicencia', function () {
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
            $("#modal-nuevo").modal("show");
        }
    }
});


function get_Licencias(idpersona) {    
    $.ajax({
        type: 'POST',
        url: "Licencias.aspx/ListaDeLicencias",
        data: '{"v1": "' + idpersona + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
             //console.log(json)
             var table1 = $("#TableLicencia").DataTable({
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
                   { "data": "idlicencia" },
                   { "data": "fechalicencia", type: 'date' },
                   { "data": "motivo" },
                   { "data": "tipolicencia" },
                   { "data": "resumen" },
                   { "data": "fechaini" },
                   { "data": "fechafin" },
                   {
                       "data": "estado",
                       render: function (data, type) {
                           if (type === 'display') {
                               var color = 'green'
                               switch (data) {
                                   case 'SOLICITADO':
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
                   { "defaultContent": "<button type='button' title='ANULAR LICENCIA' id='anular' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-user'></i></button> <button type='button' id='imprimir' title='IMPRIMIR' class='btn btn-success  btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-print'></i></button> " },
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



//precionar el boton GUARDAR LICENCIA
$(document).on('click', '#GuardarLicencia', function (e) {
    var v1 = 0
    var v10s = 'SOLICITADO'
    var v11 = 1
    var combo = document.getElementById("motivo");
    var v4 = combo.options[combo.selectedIndex].text;

    var combo1 = document.getElementById("tipo");
    var v5 = combo1.options[combo1.selectedIndex].text;

    console.log(v5)
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
                                url: 'Licencias.aspx/funcion_ingresar_licencia',
                                data: '{"v1": "' + v1 + '", "v2": "' + $('#idpersona').text() + '",  "v3": "' + $('#indate1').val() + '","v4": "' + v4 + '", "v5": "' + v5 + '",  "v6": "' + $('#resumen').val() + '","v7": "' + $('#indate1').val() + '", "v8": "' + $('#indate2').val() + '","v9": "' + idusuariopersonal + '", "v10": "' + v10s + '", "v11": "' + v11 + '"}',
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
                                            timer: 1000
                                        });
                                        get_Licencias($('#idpersona').text());
                                        $("#modal-nuevo").modal("hide");
                                        get_muestravoleta($('#idpersona').text())


                                        
                                        $("#modal-PDF").modal("show");
                                        generarPDF();


                                        $('#resumen').val('')
                                        $('#motivo').val("")
                                        $('#tipo').val("")
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


function get_muestravoleta(idper) {

    $.ajax({
        async: false,
        type: 'POST',
        url: "Licencias.aspx/Maxsalida",
        data: '{"v1": "' + idper + '"}',
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
    $('#tlicencia').text(vtipo)

    vcombo = document.getElementById("motivo");
    vtipo = vcombo.options[vcombo.selectedIndex].text;
    $('#Label1').text(vtipo)


    $('#fecha1').text($('#indate1').val())
    $('#fecha2').text($('#indate2').val())
    $('#Label5').text($('#resumen').val())
}



//MOSTRAR DATOS DE ANULAR SALIDA
var idlicencia1
$(document).on('click', '#anular', function () {

    if ($("#TableLicencia").DataTable().row($(this).parents("tr")).data()["estado"] == 'ANULADO') {
        //$.alert("- La Licencia ya fue anulada")
        Swal.fire({
            icon: "error",
            title: "Error",
            text: 'La Licencia ya fue anulada',
        });
    } else {
        $("#modal-anular").modal("show");
        $('#nombrea').text($('#nombres').text());
        $('#fsalidaa').text($("#TableLicencia").DataTable().row($(this).parents("tr")).data()["fechalicencia"]);
        $('#motivoa').text($("#TableLicencia").DataTable().row($(this).parents("tr")).data()["motivo"]);
        $('#marcaciona').text($("#TableLicencia").DataTable().row($(this).parents("tr")).data()["tipolicencia"]);
        $('#salidaa').text($("#TableLicencia").DataTable().row($(this).parents("tr")).data()["fechaini"]);
        $('#retornoa').text($("#TableLicencia").DataTable().row($(this).parents("tr")).data()["fechafin"]);
        idlicencia1 = $("#TableLicencia").DataTable().row($(this).parents("tr")).data()["idlicencia"];
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
                    AnularLicencia(idlicencia1)
                    $("#modal-anular").modal("hide");
                    get_Licencias($('#idpersona').text())
                }
            },
            cancelar: function () {
            },
        }
    });
});
//ANULAR LA SALIDA

function AnularLicencia(v1) {
    $.ajax({
        type: 'POST',
        url: "Licencias.aspx/AnularLicencias",
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
                    timer: 1000
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