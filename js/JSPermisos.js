//INACTIVA EL IDSERVICIO
document.getElementById("mdatos").style.display = 'none';
document.getElementById("idpersona").style.display = 'none';


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
               { "defaultContent": "<button type='button' id='VerSalidas' class='VerContratos btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-user'></i></button>" },
            ]
        });
    }; //obtener_data_editar("#TablePersona tbody", $("#TablePersona").DataTable());
});
//VARIABLES DE INICIO
var carnet = 0;


var VIbloque;
var VIcategoria;
var VItpersonal;
var VIunidad;
var VIcargo;
var VIidpersona;
//obtiene los valores de la fila seleccionada
$(document).on('click', '#VerSalidas', function () {

    document.getElementById("mdatos").style.display = 'inline';

  $(this).parents("tr").find("td").each(function () {
        carnet = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["ci"];
        nombre = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["nombres"];
  });
  //document.getElementById('nombres').style.color = 'blue';
    $('#nombres').text(nombre);    
    $.ajax({
        type: 'POST',
        url: "Permisos.aspx/BuscarDatos",
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
                    text: "- Surgio un arror intente mas tarde",
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
                else{
                    campo.style.color = "white";
                    campo1.style.color = "white";
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
                    $('#bloque1').text(response.d[11])
                    $('#Label3').text(response.d[7])
                    $('#categoria1').text(response.d[7])
                    $('#tpersonal').text(response.d[8])
                    $('#tpersonal1').text(response.d[8])                
                    $('#unidad1').text(response.d[12])
                    $('#unidad').text(response.d[12])
                    $('#cargo1').text(response.d[10])
                    $('#Label4').text(response.d[10])
                }
                get_salidas($('#idpersona').text());
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






$(document).on('click', '#NuevaSalida', function () {

    if ($('#contrato').text() == 'SIN CONTRATO VIGENTE') {
        //$.alert("- El personnal no tiene contrato vigente")
        Swal.fire({
            icon: "error",
            title: "Error",
            text: 'El personal no tiene contrato vigente',
        });
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


//precionar el boton GUARDAR SALIDA
$(document).on('click', '#GuardarSalida', function (e) {
    var hora1 = moment($('#desde').val(), 'HH:mm')
    var hora2 = moment($('#hasta').val(), 'HH:mm')
    var v1 = 0
    var combo = document.getElementById("marcado");
    var v5 = combo.options[combo.selectedIndex].text;

    var v8 = 'SOLICITADO'
    var v9 = new Date()
    var v11 = 0
    var v13 =1

    //console.log(idusuariopersonal)
    var combo1 = document.getElementById("tipo");
    var v12 = combo1.options[combo1.selectedIndex].text;
   
    if (hora1 < hora2) {
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
                                    url: 'Permisos.aspx/funcion_ingresar_salida',
                                    data: '{"v1": "' + v1 + '", "v2": "' + $('#idpersona').text() + '",  "v3": "' + $('#indate1').val() + '","v4": "' + $('#motivo').val() + '", "v5": "' + v5 + '",  "v6": "' + $('#desde').val() + '","v7": "' + $('#hasta').val() + '", "v8": "' + v8 + '",  "v9": "' + $('#indate1').val() + '","v10": "' + idusuariopersonal + '", "v11": "' + v11 + '", "v12": "' + v12 + '" ,"v13": "' + v13 + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response) {
                                        if (response.d == "OK") {
                                            //$.alert('Los datos se guardaron correctamente');
                                           
                                            get_salidas($('#idpersona').text());
                                            //$('#modal-nuevo').on('show.bs.modal', function (event) {
                                            //    $("#modal-nuevo input").val("");
                                            //});
                                            $("#modal-nuevo").modal("hide");
                                            get_muestravoleta($('#idpersona').text())                                            
                                            Swal.fire({
                                                position: "center",
                                                icon: "success",
                                                title: "Los datos se guardaron correctamente",
                                                showConfirmButton: false,
                                                timer: 1000
                                            });
                                            $("#modal-PDF").modal("show");
                                            generarPDF();
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
    }else{
        //$.alert("- La hora final debe ser mayor")

        Swal.fire({
            icon: "error",
            title: "Error",
            text: " La hora final debe ser mayor",
        });
    }
});



function get_muestravoleta(idper) {

    $.ajax({
        async: false,
        type: 'POST',
        url: "Permisos.aspx/Maxsalida",
        data: '{"v1": "' + idper + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#numero').html(result.d);
            $('#numero1').text(result.d);
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
    $('#nombre1').text(nombres.textContent);
    $('#cipdf').text(ci.textContent);
    $('#cipdf1').text(ci.textContent);

    $('#Label2').text(VIbloque)
    $('#bloque1').text(VIbloque)
    $('#Label3').text(VIcategoria)
    $('#categoria1').text(VIcategoria)
    $('#tpersonal').text(VItpersonal)
    $('#tpersonal1').text(VItpersonal)
    $('#unidad1').text(VIunidad)
    $('#unidad').text(VIunidad)
    $('#cargo1').text(VIcargo)
    $('#Label4').text(VIcargo)

    $('#fpermiso').text($('#indate1').val())
    $('#fpermiso1').text($('#indate1').val())

    var vcombo = document.getElementById("tipo");
    var vtipo = vcombo.options[vcombo.selectedIndex].text;
    $('#tpermiso').text(vtipo)
    $('#tpermiso1').text(vtipo)

    var vhora1 = $('#desde').val()
    var vhora2 = $('#hasta').val()
    
    $('#hora1').text(vhora1)
    $('#hora2').text(vhora2)
    $('#hora11').text(vhora1)
    $('#hora22').text(vhora2)

    $('#Label5').text($('#motivo').val())
    $('#motivo1').text($('#motivo').val())   
}


//LLAMA A FUNCION LISTA DE PERMISOS

function get_salidas(idpersona) {
   // console.log(idpersona)
    $.ajax({
        type: 'POST',
        url: "Permisos.aspx/ListaDePermisos",
        data: '{"v1": "' + idpersona + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
           // console.log(json)
            var table1 = $("#TableSalidas").DataTable({
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
                   { "data": "idSalida" },
                   { "data": "fechasalida", type: 'date' },
                   { "data": "motivo" },
                   { "data": "marcacion" },
                   { "data": "h_salida" },
                   { "data": "h_regreso" },
                   { "data": "tiposalida" },
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
                   //{ "defaultContent": "<button type='button' id='EContrato' class='editar btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-user bg-aqua'></i></button>" },
                   { "defaultContent": "<button type='button' title='ANULAR PERMISO' id='anular' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-user'></i></button> <button type='button' id='imprimir' title='IMPRIMIR' class='btn btn-success  btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-print'></i></button> " },
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



//MOSTRAR DATOS DE ANULAR SALIDA
var idsalida1
$(document).on('click', '#anular', function () {

    if ($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["estado"] == 'ANULADO') {
        //$.alert("- La orden ya fue anulada")
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "La orden ya fue anulada",
        });
    } else {
        $("#modal-anular").modal("show");
        $('#nombrea').text($('#nombres').text());
        $('#fsalidaa').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["fechasalida"]);
        $('#motivoa').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["motivo"]);
        $('#marcaciona').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["marcacion"]);
        $('#salidaa').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["h_salida"]);
        $('#retornoa').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["h_regreso"]);
        idsalida1 = $("#TableSalidas").DataTable().row($(this).parents("tr")).data()["idSalida"];
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
                    AnularPermisos(idsalida1)
                    $("#modal-anular").modal("hide");
                    get_salidas($('#idpersona').text())
                }
            },
            cancelar: function () {
            },
        }
    });



 
});


//ANULAR LA SALIDA

function AnularPermisos(v1) {
    $.ajax({
        type: 'POST',
        url: "Permisos.aspx/AnularPermisos",
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