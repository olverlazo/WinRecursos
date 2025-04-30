
//document.getElementById("HTMLPdf").style.display = 'none';
//INACTIVA EL IDSERVICIO
document.getElementById("mdatos").style.display = 'none';
document.getElementById("idpersona").style.display = 'none';


document.getElementById("hora1").style.display = 'none';
document.getElementById("hora2").style.display = 'none';
document.getElementById("hora3").style.display = 'none';
document.getElementById("hora4").style.display = 'none';



document.getElementById("gm").style.display = 'none';




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
                url: "AdicionarTurnos.aspx/CargarLista",
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
var idpersona1=0

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
        url: "AdicionarTurnos.aspx/CargarDatos",
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

               
                    $('#ciPDF').text(response.d[2]);
                    $('#contratoPDF').text('SIN CONTRATO VIGENTE');
                    $('#categoriaPDF').text('');
                    $('#ffPDF').text('');
                    $('#bloquePDF').text('SIN CARGO VIGENTE');
                    $('#cargoPDF').text('');
                    


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
                    $('#contratoPDF').text(response.d[3]);
                    $('#categoriaPDF').text(response.d[4]);
                    $('#ffPDF').text(response.d[5]);
                    $('#bloquePDF').text(response.d[6]);
                    $('#cargoPDF').text(response.d[7] + " - " + response.d[8]);
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
        url: "AdicionarTurnos.aspx/funcion_tipoturno",
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




function get_ListaTurnoPDF() {
    var combo = document.getElementById("meano");
    var mes = combo.options[combo.selectedIndex].text;

    $.ajax({
        type: 'POST',
        url: "AdicionarTurnos.aspx/ListarTurnos",
        data: '{"v1": "' + idpersona1 + '","v2": "' + mes + '"}',
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
                   { "data": "id_turno" },
                   { "data": "aux" },
                   { "data": "horario" },
                   { "data": "fecha", type: 'date' },
                   { "data": "hora1" },
                   { "data": "hora2" },
                   { "data": "hora3" },
                   { "data": "hora4" },

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
$('#meano').on('change', function (evt, params) {
    get_ListaTurnoPDF();
    get_ListaTurno();
});




//ACTIVAR MODAL PARA NUEVO TURNO
$(document).on('click', '#NuevoTurno', function () {
    if (idservcio == 1) {
        $.alert("- El personal no tiene contrato vigente")
    } else {
        if ($('#idpersona').text() == 0) {
            $.alert("- Debe elegir un personal")
        } else {

            if ($('#meano').val() == 0) {
                $.alert("- Debe elegir un mes")
            } else {
                $("#modal-nuevo").modal("show");
            }
        }
    }
});



$('#horario').on('change', function (evt, params) {
    if ($('#horario').val() == 0) {
        document.getElementById("hora1").style.display = 'inherit';
        document.getElementById("hora2").style.display = 'inherit';
        document.getElementById("hora3").style.display = 'none';
        document.getElementById("hora4").style.display = 'none';
    } 
    if ($('#horario').val() == 1) {
        document.getElementById("hora1").style.display = 'inherit';
        document.getElementById("hora2").style.display = 'inherit';
        document.getElementById("hora3").style.display = 'inherit';
        document.getElementById("hora4").style.display = 'inherit';
    }
    if ($('#horario').val() == '') {
        document.getElementById("hora1").style.display = 'none';
        document.getElementById("hora2").style.display = 'none';
        document.getElementById("hora3").style.display = 'none';
        document.getElementById("hora4").style.display = 'none';    
    }
});



$('#tipoturno').on('change', function (evt, params) {
    var arr = ['Continuo', 'Discontinuo'];
    document.getElementById("hora1").style.display = 'none';
    document.getElementById("hora2").style.display = 'none';
    document.getElementById("hora3").style.display = 'none';
    document.getElementById("hora4").style.display = 'none';
    if ($('#tipoturno').val() <= 2) {
        document.getElementById("gm").style.display = 'inherit';        
        sale = '<select name="horario">';
        sale += '<option value="">--Seleccionar--</option>';
        sale += '<option value="0">Continuo</option>';
        sale += '<option value="1">Discontinuo</option>';
        sale += '</select>';
        $("#horario").html(sale);
    }    
    if ($('#tipoturno').val() >= 3) {
        document.getElementById("gm").style.display = 'inherit';
        sale = '<select name="">';
        sale += '<option value="">--Seleccionar--</option>';
        sale += '<option value="0">Continuo</option>';        
        sale += '</select>';
        $("#horario").html(sale);
    }
});




//GUARDAR DATOS TURNO

$(document).on('click', '#GuardarDatos', function (e) {
    var tipoturno = $('#tipoturno').val()


    var combo = document.getElementById("horario");
    var horario = combo.options[combo.selectedIndex].text;
   
    var gm

    //verifica que el checked este clicleado
    var isChecked = document.getElementById('gmes').checked;
    if (isChecked) {
        gm = 1
    } else {
        gm = 0
    }

    var timpo1 = calcular_horas($('#ihora1').val(), $('#ihora2').val())
    var timpo2 = calcular_horas($('#ihora3').val(), $('#ihora4').val())

    var combo = document.getElementById("meano");
    mes = combo.options[combo.selectedIndex].text;  

    var validation = $("#form").validate();
    if (validation.isValid() == true) {     
        if (funcion_validar(timpo1, timpo2) == true) {      
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
                                    url: 'AdicionarTurnos.aspx/guardar_turno',
                                    data: '{"v0": "' + 0 + '","v1": "' + idpersona1 + '", "v2": "' + tipoturno + '",  "v3": "' + horario + '","v4": "' + $('#ihora1').val() + '", "v5": "' + $('#ihora2').val() + '",  "v6": "' + $('#ihora3').val() + '","v7": "' + $('#ihora4').val() + '", "v8": "' + $('#indate1').val() + '",  "v9": "' + mes + '","v10": "' + idusuariopersonal + '","v11": "' + gm + '","v12": "' + 1 + '"}',
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (response) {
                                        if (response.d == "OK") {
                                            $.alert('Los datos se guardaron correctamente');
                                            //$('#motivo').val('')
                                            //$('#tipo').val("")
                                            //$('#marcado').val("")
                                            //get_salidas($('#idpersona').text());
                                            //$("#modal-nuevo").modal("hide");
                                        } else { alert(response.d); }
                                    },
                                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                                        var err = eval("(" + XMLHttpRequest.responseText + ")");
                                        alert("Error!: " + err.Message)

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
       
    
});




function calcular_horas(hora1,hora2) {
    if (hora1.length < 5) {
        var hora11 = '0' + hora1
    } else {
        var hora11 = hora1
    }

    if (hora2.length < 5) {
       var hora22 = '0' + hora2
    } else {
        var hora22 = hora2
    }

    var hi = '2024-05-06 ' + hora11
    var hf = '2024-05-06 ' + hora22
    var momentHi = moment(hi)
    var momentHf = moment(hf)

    var diferenciaEnMinutos = momentHf.diff(momentHi, "minutes")

    var tiempoAtencion = moment()
       .set("Hours", 0)
       .set("Minutes", diferenciaEnMinutos)
       .set("Seconds", 0)
       .format("HH:mm:ss")
  
    return diferenciaEnMinutos
}



//ihora1.oninput = function () {

//    var tiempo = calcular_horas(hora1, hora2)
//    var tiempoAtencion = moment()
//      .set("Hours", 0)
//      .set("Minutes", tiempo)
//      .set("Seconds", 0)
//      .format("HH:mm:ss")
//    //ihora2.innerHTML = tiempoAtencion + 8000;
//    console.log(tiempo)
//};


function funcion_validar(tiempo1,tiempo2) {
    var sw = 0
    var mensaje = ""

    //console.log($('#tipoturno').val())
    //console.log($('#horario').val())
    //console.log(tiempo1)
    //console.log(tiempo2)


    if ($('#tipoturno').val() == 1)  //turno 6 horas 
    {
        if ($('#horario').val() == 0)  // 6 horas continuas
        {
            if (tiempo1 == 360)  // 360 minutos
            {
                return true
            }else{
                $.alert("- La cantidad de horas trabajadas debe ser 6Hrs. continuas")
                return false
            }
        }
        else  // 6 horas dis continuas
        {
            if (tiempo1 == 180 && tiempo2 == 180)  // 360 minutos discontinuo
            {
                return true
            } else {
                $.alert("- La cantidad de horas trabajadas debe ser 6Hrs. dis continuas")
                return false
            }
        }
    }



    if ($('#tipoturno').val() == 2)  //turno 8 horas 
    {
        if ($('#horario').val() == 0)  // 8 horas continuas
        {
            if (tiempo1 == 480)  // 480 minutos
            {
                return true
            } else {
                $.alert("- La cantidad de horas trabajadas debe ser 8Hrs. continuas")
                return false
            }
        }
        else  // 8 horas dis continuas
        {
            if (tiempo1 == 240 && tiempo2 == 240)  // 480 horas discontinuo
            {
                return true
            } else {
                $.alert("- La cantidad de horas trabajadas debe ser 8Hrs.      dis continuas")
                return false
            }
        }
    }




    if ($('#tipoturno').val() == 3)  //turno 10 horas 
    {
        if ($('#horario').val() == 0)  // 10 horas continuas
        {
            if (tiempo1 == 600 || tiempo1==-840)  // 600 minutos
            {
                return true
            } else {
                $.alert("- La cantidad de horas trabajadas debe ser 10Hrs. continuas")
                return false
            }
        }
        //else  // 8 horas dis continuas
        //{
        //    if (tiempo1 == 240 && tiempo2 == 240)  // 480 horas discontinuo
        //    {
        //        return true
        //    } else {
        //        $.alert("- La cantidad de horas trabajadas debe ser 8Hrs. dis continuas")
        //        return false
        //    }
        //}
    }



    if ($('#tipoturno').val() == 4)  //turno 12 horas 
    {
        if ($('#horario').val() == 0)  // 12 horas continuas
        {            
            if (tiempo1 == 720 || tiempo1 == -720)  // 720 minutos
            {
                return true
            } else {
                $.alert("- La cantidad de horas trabajadas debe ser 12Hrs. continuas")
                return false
            }
        }
        //else  // 8 horas dis continuas
        //{
        //    if (tiempo1 == 240 && tiempo2 == 240)  // 480 horas discontinuo
        //    {
        //        return true
        //    } else {
        //        $.alert("- La cantidad de horas trabajadas debe ser 8Hrs. dis continuas")
        //        return false
        //    }
        //}
    }




    if ($('#tipoturno').val() == 5)  //turno 24 horas 
    {
        if ($('#horario').val() == 0)  // 24 horas continuas
        {
            if (tiempo1 == 0)  // 1440 minutos
            {
                return true
            } else {
                $.alert("- La cantidad de horas trabajadas debe ser 24Hrs. continuas")
                return false
            }
        }
        //else  // 8 horas dis continuas
        //{
        //    if (tiempo1 == 240 && tiempo2 == 240)  // 480 horas discontinuo
        //    {
        //        return true
        //    } else {
        //        $.alert("- La cantidad de horas trabajadas debe ser 8Hrs. dis continuas")
        //        return false
        //    }
        //}
    }


  
}




//LISTAR TURNOS
function get_ListaTurno() {
    var combo = document.getElementById("meano");
    var mes = combo.options[combo.selectedIndex].text;
    $.ajax({
        type: 'POST',
        url: "AdicionarTurnos.aspx/ListarTurnos",
        data: '{"v1": "' + idpersona1 + '","v2": "' + mes + '"}',
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
                   { "data": "id_turno" },
                   { "data": "aux" },
                   { "data": "horario" },
                   { "data": "fecha", type: 'date' },
                   { "data": "hora1" },
                   { "data": "hora2" },
                   { "data": "hora3" },
                   { "data": "hora4" },                   
                   { "defaultContent": "<button type='button' title='ELIMINAR' id='anular' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-times'></i>" },
                ],
            });
        },        
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }
        
    });
}





