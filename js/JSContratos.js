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
                        url: "Contratos.aspx/CargarLista",
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
                       { "defaultContent": "<button type='button' id='VerContratos' class='VerContratos btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-user'></i></button>" },
                    ]
                });
            }; //obtener_data_editar("#TablePersona tbody", $("#TablePersona").DataTable());
        });
//VARIABLES DE INICIO
var carnet=0
var idContrato =0

//obtiene los valores de la fila seleccionada
  $(document).on('click', '#VerContratos', function () {
      var citotal = "";
      var nombre = "";
      document.getElementById("mdatos").style.display = 'inline';
      $(this).parents("tr").find("td").each(function () {
          carnet = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["ci"];
          nombre = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["nombres"];
      });
      $('#nombres').text(nombre);
      $.ajax({
          type: 'POST',
          url: "Permisos.aspx/BuscarDatos",
          data: '{"v1": "' + carnet + '"}',
          contentType: "application/json; charset=utf-8",
          dataType: "json",
          success: function (response) {
              if (response.d[0] == 'error') {
                  $.alert('- Surgio un arror intente mas tarde')
              }
              else {
                  var campo = document.getElementById('contrato');
                  var campo1 = document.getElementById('bloque1');
                  if ((response.d[8] == 'error') || (response.d[10] == 'error')) {
                      campo.style.color = "red";
                      campo1.style.color = "red";
                      $('#idpersona').text(response.d[0]);
                      //document.getElementById('ci').style.color = 'red';
                      $('#ci').text(response.d[1] + '-' + response.d[2] + '-' + response.d[3]);
                      $('#contrato').text('SIN CONTRATO VIGENTE');
                      $('#categoria').text('');
                      $('#ff').text('');
                      $('#bloque1').text('SIN CARGO VIGENTE');
                      $('#cargo1').text('');
                  }
                  else {
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
                      $('#bloque1').text(response.d[10]);
                      //document.getElementById('cargo').style.color = 'blue';
                      $('#cargo1').text(response.d[11] + " - " + response.d[12]);
                  }
                  get_contratos(0, carnet, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
              }
          },
          error: function (XMLHttpRequest, textStatus, errorThrown) {
              var err = eval("(" + XMLHttpRequest.responseText + ")");
              $.alert("Error!: " + err.Message)
          }
      });
  });


//LLAMA A FUNCION GET_CONTRATOS DEPENDIENDO DE LA ACCION EN EL @SW
var totalfilas 
function get_contratos(id, carnet, id_categoria, id_tipocontrato, item, id_ffinanciamiento, ch, f_inicio, f_retiro, mot_retiro, estado, usuario, fecha, sw) {
    $.ajax({
        type: 'POST',
        url: "Contratos.aspx/CargarContratos",
        data: '{"id": "' + id + '","id_personal": "' + carnet + '","id_categoria": "' + id_categoria + '","id_tipocontrato": "' + id_tipocontrato + '","item": "' + item + '","id_FFinanciamiento": "' + id_ffinanciamiento + '","ch": "' + ch + '","f_inicio": "' + f_inicio + '","f_retiro": "' + f_retiro + '","mot_retiro": "' + mot_retiro + '","estado": "' + estado + '","usuario": "' + usuario + '","fecha": "' + fecha + '","sw": "' + sw + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
            totalfilas = json.d.data.length
            var table1 = $("#TableContratosPersona").DataTable({
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
                    "emptyTable": "Ningún contrato encontrado",
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
                   { "data": "FFinanciamiento" },
                   { "data": "categoria"  },
                   { "data": "tipoContrato" },
                   { "data": "item" },
                   { "data": "fe_ingreso", type: 'date' },
                   { "data": "fe_retiro", type: 'date' },
                   {
                       //"data": "estado",
                       //render: function (data, type) {
                       //    if (type === 'display') {
                       //        var color = 'black';
                       //        switch (data) {
                       //            case 'true':
                       //                color = 'green'
                       //                break;
                       //            case 'false':
                       //                color = 'red'
                       //                break;
                       //        }
                       //        return '<span style="color:' + color + '">' + data + '</span>';
                       //    }
                       //    return data;
                       //},
                       "data": "documento",
                       render: function (data, type) {
                           var cadena
                           //cadena = data + carnet + '.pdf'
                           cadena = carnet+'/'+data
                           data = '<a style="text-decoration: underline" target="_blank" href="temp/' + escapeTags(cadena) + '"> ' + escapeTags(carnet+'.pdf') + '</a>';
                           return data;
                       },

                   },
                   {
                       "data": "estado",
                       render: function (data, type) {
                           if (type === 'display') {
                               var imagen = 'imagenes/icon-valid.png';
                               var color = 'green'
                               switch (data) {
                                   case 'ACTIVO':
                                       imagen = '../imagenes/icon-valid.png'
                                       color= 'green'
                                       break;
                                   case 'FINALIZADO':
                                       imagen = '../imagenes/icon-error.png'
                                       color = 'red'
                                       break;
                               }
                               //alert(imagen)
                               //return '<span style="background-image: url(imagenes/icon-valid.png)">' + data + '</span>';
                              // return '<span style="background-image: url('+imagen+')">' + data + '</span>';
                               return '<span style="color:'+ color +'">' + data + '</span>';
                           }
                           return data;
                       },
                   },
                   //{ "defaultContent": "<button type='button' id='EContrato' class='editar btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-user bg-aqua'></i></button>" },
                   { "defaultContent": "<button type='button' title='FINALIZAR CONTRATO' id='anular' class='btn btn-warning btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-times'></i></button> <button type='button' id='Editar' title='EDITAR CONTRATO' class='btn btn-primary btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-edit'></i></button> <button type='button' id='Cargo' title='CREAR CARGO' class='btn btn-success btn-xs checkbox-toggle' data-target='#modal-lista-cargo'><i class='glyphicon glyphicon-list-alt'></i></button>" },
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


//precionar el boton nuevo contratto
$('#NuevoContrato').click(function () {
    idContrato = 0
    if (carnet == 0) {
        Swal.fire({
            icon: "error",
            title: "Error",
            text: 'Debe selecionar un personal',
        });
    }
    else {

        var resume_table = document.getElementById("TableContratosPersona");
        var paso = 0
       
        if (totalfilas > 0)
        {
          for (var i = 0, row; row = resume_table.rows[i]; i++) {
                if (resume_table.rows[i].cells[8].innerText == 'ACTIVO') {
                    paso=1
                            Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: "Existe un Contrato/Item/Memo Activo",                        
                        });
                }
            }
        }

        if (paso==0){
                    $("#modal-nuevo").modal("show");
                    $('#categoria1').val('');
                    $('#fuente').val('');
                    $('#tpersonal').val('');
                    $('#ch').val("");
                    $('#item').val('');
                    $('#inicontrato').val('');
                    $('#fincontrato').val('');
                    document.getElementById("archivo1").value = "";
                    document.getElementById('visorArchivo').innerHTML = '';
        }
    }
});


var validar = 1
function validacion(v1, v2, v3, v4) {
    $.ajax({
        type: 'POST',
        url: "Contratos.aspx/valida_contrato",
        data: '{"v1": "' + v1 + '","v2": "' + v2 + '","v3": "' + v3 + '","v4": "' + v4 + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
             //console.log(response.d)
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
                                if (v1 == 0) {
                                    get_contratos(idContrato, carnet, $('select[name=categoria1]').val(), $('select[name=tpersonal]').val(), $('#item').val(), $('select[name=fuente]').val(), $('select[name=ch]').val(), $('#inicontrato').val(), $('#fincontrato').val(), '', 'ACTIVO', usuariopersonal, '01/01/2000', 2);
                                }
                                else {                                    
                                    get_contratos(idContrato, carnet, $('select[name=categoria1]').val(), $('select[name=tpersonal]').val(), $('#item').val(), $('select[name=fuente]').val(), $('select[name=ch]').val(), $('#inicontrato').val(), $('#fincontrato').val(), '', 'ACTIVO', usuariopersonal, '01/01/2000', 3);
                                }


                                /////////////////////////////////////////////////
                                //CARGA LA IMAGEN 
                                var f = $(this);
                                var formData = new FormData(document.getElementById("formuploadajax"));
                               formData.append("dato", carnet);
                                 $.ajax({
                                     url: "WebService.asmx/GuardarArchivoPRUEBA",
                                    type: "post",
                                    dataType: "html",
                                    data: formData,
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    multipart: true,
                                    focusClass: 'focus',
                                    responseType: 'json',
                                    success: function (response) {
                                        if (response.length === 2) {
                                            msgBox.style.display = 'block';
                                            msgBox.innerHTML = 'La imagen debe ser menor a 10000 Byte';
                                        } else {
                                            msgBox.style.display = 'block';
                                            msgBox.innerHTML = '<strong><a style="text-decoration: underline" href="temp/' + escapeTags(response) + '"> ' + escapeTags(response) + '</a></strong> ' + 'Archivo cargado.';
                                        }
                                    },
                                })
                                    .done(function (res) {                              
                                        $("#mensaje").html("Respuesta: " + res);
                                    });
                                //////////////////////////////////////////////

                                //$.alert('Los datos se guardaron correctamente');
                                 Swal.fire({
                                     position: "center",
                                     icon: "success",
                                     title: "Los datos se guardaron correctamente",
                                     showConfirmButton: false,
                                     timer: 1500
                                 });
                                
                                $("#modal-nuevo").modal("hide");
                            }
                        },
                        cancelar: function () {
                        },
                    }
                });
                validar = 0
            }
            else {
                validar = 1
                $.alert(response.d[0])                
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }
    });
}


function validarExt() {
    var archivocar = document.getElementById('archivo1');
    var archivoRuta = archivocar.value;
    //var extPermitidas = /(.jpeg|.jpg|.png|.gif)$/i;
    var extPermitidas = /(.pdf)$/i;
    var tam = document.getElementById("archivo1").files[0].size;
    //console.log(tam)
    if (tam > 1000000) {
        $.alert('EL ARCHIVO NO PUEDE PESAR MAS DE 1MB');
        document.getElementById("archivo1").value = "";
        archivocar.value = '';
        return false;
    } else {
        if (!extPermitidas.exec(archivoRuta)) {
            $.alert('DEBE DE SELECIONAR UNA IMAGEN');
            archivocar.value = '';
            return false;
        }
        else {
            //PRevio del PDF
            if (archivocar.files && archivocar.files[0]) {
                var visor = new FileReader();
                visor.onload = function (e) {
                    document.getElementById('visorArchivo').innerHTML =
					'<embed src="' + e.target.result + '" width="100" height="150" />';
                };
                visor.readAsDataURL(archivocar.files[0]);
            }
        }
    }
}


function escapeTags(str) {
    return String(str)
    .replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')
    .replace(/</g, '&lt;').replace(/>/g, '&gt;');
}

//precionar el boton GUARDAR CONTRATO
$(document).on('click', '#btnGuardar1', function (e) {
    e.preventDefault();
    var validation = $("#form").validate();
    if (validation.isValid() == true) {
        validacion(idContrato, carnet, $('#inicontrato').val(), $('#fincontrato').val());
    }
});




var fecha_ingreso_fin
//precionar el boton FINALIZAR CONTRATO
$(document).on('click', '#anular', function () {
   
    idContrato = $(this).closest('tr').children()[0].textContent
    var est_Contrato = $(this).closest('tr').children()[8].textContent
    fecha_ingreso_fin = $(this).closest('tr').children()[5].textContent
    var valor = 0

    if (est_Contrato == 'FINALIZADO') {
        //$.alert('- EL CONTRATO YA ESTA FINALIZADO')
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "EL CONTRATO ESTA FINALIZADO",
        });
        valor = 1
    }
    if (valor==0)
    {
        $("#modal-anular").modal("show");

    }
});

$(document).on('click', '#GuardaFin', function (e) {
    e.preventDefault();
    var validation = $("#formAnular").validate();
    if (validation.isValid() == true) {
        if (new Date($('#FechaFin').val()) <= new Date(fecha_ingreso_fin)) {
            //$.alert('- LA FECHA RETIRO DEBE SER MAYOR A LA FECHA DE INICIO DE CONTRATO')
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "LA FECHA RETIRO DEBE SER MAYOR A LA FECHA DE INICIO DE CONTRATO",
            });
        }
        else {
                $.confirm({
                    title: 'Guardar?',
                    content: 'Desea Guardar los datos!',
                    buttons: {
                        guardar: {
                            btnClass: 'btn-green',
                            keys: ['enter', 'shift'],
                            action: function () {
                                //get_contratos(idContrato, carnet, '', '', '', '', '', $('#FechaFin').val(), $('#FechaFin').val(), $('#motivo').val(), 'FINALIZADO', '<%= Session("idusuario").ToString%>', '01/01/2000', 4);
                                get_contratos(idContrato, carnet, '', '', '', '', '', $('#FechaFin').val(), $('#FechaFin').val(), $('#motivo').val(), 'FINALIZADO', usuariopersonal, '01/01/2000', 4);
                                //$.alert('Los datos se guardaron correctamente');
                                Swal.fire({
                                    position: "center",
                                    icon: "success",
                                    title: "Los datos se guardaron correctamente",
                                    showConfirmButton: false,
                                    timer: 1500
                                });
                                $("#modal-anular").modal("hide");
                            }
                        },
                        cancelar: function () {
                        },
                    }
                });
        }
    }
});




//precionar el boton editar
$(document).on('click', '#Editar', function () {
    idContrato = $(this).closest('tr').children()[0].textContent
    var est_Contrato = $(this).closest('tr').children()[8].textContent
    var valor =0

    if (est_Contrato == 'ANULADO'){
        //$.alert('- NO SE PUEDE EDITAR POR QUE EL CONTRATO FUE ANULADO')
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "NO SE PUEDE EDITAR POR QUE EL CONTRATO FUE ANULADO",
        });
        valor=1
    }

    if (est_Contrato == 'FINALIZADO') {
        //$.alert('- El contrato debe estar ACTIVO para editar')
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "El contrato debe estar ACTIVO para editar",
        });
        valor = 1
    }

    if (valor==0)
    {
    $.ajax({
        type: 'POST',
        url: "Contratos.aspx/ver_datos",
        data: '{"v1": "' + idContrato + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d[10] == 'ANULADO') {
                //$.alert('NO SE PUEDE MODIFICAR POR QUE EL CONTRATO FUE ANULADO')
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: "NO SE PUEDE MODIFICAR POR QUE EL CONTRATO FUE ANULADO",
                });
            } else {
            $("#modal-nuevo").modal("show");
            $('#categoria1').val(response.d[2]);
            $('#fuente').val(response.d[5]);
            $('#tpersonal').val(response.d[3]);
            $('#item').val(response.d[4]);
            if (response.d[6] == 2) {
                $('#ch').val(2);
            }
            else {
                $('#ch').val(1);
            }
            
            const date = new Date(response.d[7])
            var year = date.getFullYear();
            var mes= date.getMonth()+1;
            var dia = date.getDate();
            var nuevafecha=dia +'/'+ mes +'/'+year
   


            $('#inicontrato').val(nuevafecha);
                const date1 = new Date(response.d[8])
            var year1 = date1.getFullYear();
            var mes1= date1.getMonth()+1;
            var dia1 = date1.getDate();
            var nuevafecha1=dia1 +'/'+ mes1 +'/'+year1
       
            $('#fincontrato').val(nuevafecha1);
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
});








$(document).ready(function () {
    //CARGA CATEGORIA
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Contratos.aspx/funcion_Categoria",
        data: '{"v1": "0", "v2": "0", "v3": "4"}',
        dataType: "json",
        success: function (result) {
            $('#categoria1').empty();
            $('#categoria1').append("<option value=''>--Seleccionar--</option>");
            $.each(result.d, function (key, value) {
                $("#categoria1").append($("<option></option>").val(value.categoria_id).html(value.categoria_descripcion));
                //$("#categoria1").append($("<option></option>").val(value.categoria_descripcion).html(value.categoria_descripcion));
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
        url: "Contratos.aspx/fuente_financiamiento",
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
        url: "Contratos.aspx/tipo_personal",
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
    //jQuery("#item").on('input', function (evt) {
    //    // Allow only numbers.
    //    jQuery(this).val(jQuery(this).val().replace(/[^0-9]/g, ''));
    //});


});


$(function () {
    //$("#formuploadajax").on("submit", function (e) {
    
    //});
    
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









//FUNCIONES DE CARGOS
//'''''''''''''''''''''
//'''''''''''


//precionar cargar  CARGOS
var estadocontrato
var finicioContrato
var ffinContrato
$(document).on('click', '#Cargo', function () {

    idContrato = $(this).closest('tr').children()[0].textContent
    var ffinan = $(this).closest('tr').children()[1].textContent
    var categoria = $(this).closest('tr').children()[2].textContent
    var tipocontra = $(this).closest('tr').children()[3].textContent
    finicioContrato = $(this).closest('tr').children()[5].textContent
    ffinContrato = $(this).closest('tr').children()[6].textContent
    estadocontrato = $(this).closest('tr').children()[8].textContent

    $('#Label1').text(ffinan);
    $('#Label2').text(categoria);
    $('#Label3').text(tipocontra);
    $('#Label4').text(finicioContrato);
    $('#Label5').text(ffinContrato);
    $("#modal-cargo").modal("show");

    $('#cargo').val('');
    $('#finicargo').val('');
    $('#ffincargo').val('');




    //CARGA BLOQUE
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Contratos.aspx/fun_bloque",
        //data: '{"v1": "0", "v2": "0", "v3": "4"}',
        dataType: "json",
        success: function (result) {
            $('#bloque').empty();
            $('#bloque').append("<option value=''>--Seleccionar--</option>");
            $.each(result.d, function (key, value) {
                $("#bloque").append($("<option></option>").val(value.bloque_id).html(value.bloque_descripcion));
            });
            // $("#ddlDepartments").select2();
        },
        error: function ajaxError(result) {
            //alert(result.status + ' : ' + result.statusText);
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "Error!: " + result.status + ' : ' + result.statusText,
            });
        }
    });


    //CARGA UNIDAD/SERVICIO
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Contratos.aspx/fun_unidad",
        //data: '{"v1": "0", "v2": "0", "v3": "4"}',
        dataType: "json",
        success: function (result) {
            $('#unidad').empty();
            $('#unidad').append("<option value=''>--Seleccionar Unidad/Servicio--</option>");
            $.each(result.d, function (key, value) {
                $("#unidad").append($("<option></option>").val(value.unidad_id).html(value.unidad_descripcion));
            });
            $("#unidad").select2();
        },
        error: function ajaxError(result) {
            //alert(result.status + ' : ' + result.statusText);
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "Error!: " + result.status + ' : ' + result.statusText,
            });
        }
    });
    get_cargos(0, idContrato, carnet, 0, 0, 0, 0, 0, 0, 0, 1);    
});


var totalfilasCARGOS

function get_cargos(id_cargo, idContrato, carnet, id_bloque, id_servicio, cargo, fecha_ini, fecha_fin, estado, usuario, sw) {
 $.ajax({
     type: 'POST',
            url: "Contratos.aspx/CargarCargos",
            data: '{"id_cargo": "' + id_cargo + '","id_contrato": "' + idContrato + '","id_personal": "' + carnet + '","id_bloque": "' + id_bloque + '","id_servicio": "' + id_servicio + '","cargo": "' + cargo + '","fecha_ini": "' + fecha_ini + '","fecha_fin": "' + fecha_fin + '","estado": "' + estado + '","usuario": "' + usuario + '","sw": "' + sw + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (json) {
                //console.log(fecha_fin)
                totalfilasCARGOS = json.d.data.length
                var table1 = $("#TableCargo").DataTable({
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
                       { "data": "id_cargo" },
                       { "data": "bloque" },
                       { "data": "servicio" },
                       { "data": "cargo" },
                       { "data": "fe_ini", type: 'date' },
                       { "data": "fe_fin", type: 'date' },
                       {
                           "data": "documento",
                            render: function (data, type) {
                            var cadena
                                //cadena = data + carnet + '.pdf'                                
                                cadena = carnet +'/'+data                      
                            data = '<a style="text-decoration: underline" target="_blank" href="temp/' + escapeTags(cadena) + '"> ' + escapeTags(carnet+'.pdf') + '</a>';
                            return data;
                            },

                       },
                       {
                           "data": "estado",
                           render: function (data, type) {
                               if (type === 'display') {
                                   var color = 'green'
                                   switch (data) {
                                       case 'ACTIVO':
                                           color = 'green'
                                           break;
                                       case 'FINALIZADO':
                                           color = 'red'
                                           break;
                                       case 'ANULADO':
                                           color = 'blue'
                                           break;
                                   }
                                   return '<span style="color:' + color + '">' + data + '</span>';
                               }
                               return data;
                           },
                       },
                       //{ "defaultContent": "<button type='button' id='EContrato' class='editar btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-user bg-aqua'></i></button>" },
                       //{ "defaultContent": "<button type='button' title='ANULAR CARGO' id='anularCargo' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-user'></i></button> <button type='button' id='finCargo1' onclick='PromptDemo()' title='FINALIZAR CARGO' class='btn btn-primary btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-user-circle'></i></button>" }, 
                       { "defaultContent": "<button type='button' title='ANULAR CARGO' id='anularCargo' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-user'></i></button> <button type='button' id='finCargo' title='FINALIZAR CARGO' class='btn btn-primary btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-user-circle'></i></button>" },
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



  //precionar el boton GUARDAR CARGO
$(document).on('click', '#GuardaCargo', function (e) {
    e.preventDefault();

    var resume_table = document.getElementById("TableCargo");
    var paso = 0

    if (totalfilasCARGOS > 0) {
        for (var i = 0, row; row = resume_table.rows[i]; i++) {
            if (resume_table.rows[i].cells[6].innerText == 'ACTIVO') {
                paso = 1
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: "Existe Cargo Activo",
                });
            }
        }
    }

    if (paso==0) {
    var validation = $("#formCargo").validate();
    if (validation.isValid() == true) {
        
             validacionCargo(finicioContrato, ffinContrato, $('#finicargo').val(), $('#ffincargo').val(), estadocontrato,idContrato);
        }  
    }
});




function validacionCargo(v1, v2, v3, v4, v5, v6) {
    $.ajax({
        type: 'POST',
        url: "Contratos.aspx/valida_cargo",
        data: '{"v1": "' + v1 + '","v2": "' + v2 + '","v3": "' + v3 + '","v4": "' + v4 + '","v5": "' + v5 + '","v6": "' + v6 + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            console.log(response.d[0])
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
                                if (v5 == 'FINALIZADO') {
                                    get_cargos(0, idContrato, carnet, $('#bloque').val(), $('#unidad').val(), $('#cargo').val(), $('#finicargo').val(), $('#ffincargo').val(), 'FINALIZADO', usuariopersonal,  2);
                                } else {
                                    get_cargos(0, idContrato, carnet, $('#bloque').val(), $('#unidad').val(), $('#cargo').val(), $('#finicargo').val(), $('#ffincargo').val(), 'ACTIVO', usuariopersonal, 2);
                                }

                                /////////////////////////////////////////////////
                                //CARGA LA IMAGEN 
                                var f = $(this);
                                var formData = new FormData(document.getElementById("formuploadajax"));
                                formData.append("dato", carnet);
                                $.ajax({
                                    url: "WebService.asmx/GuardarArchivoPRUEBAcargo",
                                    type: "post",
                                    dataType: "html",
                                    data: formData,
                                    cache: false,
                                    contentType: false,
                                    processData: false,
                                    multipart: true,
                                    focusClass: 'focus',
                                    responseType: 'json',
                                    success: function (response) {
                                        if (response.length === 2) {
                                            msgBox.style.display = 'block';
                                            msgBox.innerHTML = 'La imagen debe ser menor a 10000 Byte';
                                        } else {
                                            msgBox.style.display = 'block';
                                            msgBox.innerHTML = '<strong><a style="text-decoration: underline" href="temp/' + escapeTags(response) + '"> ' + escapeTags(response) + '</a></strong> ' + 'Archivo cargado.';
                                        }
                                    },
                                })
                                   .done(function (res) {                                       
                                       $("#mensaje").html("Respuesta: " + res);
                                   });
                                //////////////////////////////////////////////


                                //$.alert('Los datos se guardaron correctamente');
                                Swal.fire({
                                    position: "center",
                                    icon: "success",
                                    title: "Los datos se guardaron correctamente",
                                    showConfirmButton: false,
                                    timer: 1500
                                });
                                $("#modal-nuevo").modal("hide");
                            }
                        },
                        cancelar: function () {
                        },
                    }
                });
             }
            else {
                //$.alert(response.d[0])
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: response.d[0],
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



$(document).on('click', '#anularCargo', function () {
    var idc = $(this).closest('tr').children()[0].textContent
    var estadoc = $(this).closest('tr').children()[6].textContent

    if (estadoc == 'ANULADO') {
        //$.alert('- El Cargo ya esta Anulado');
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "El Cargo ya esta Anulado ",
        });
    } else{

    $.confirm({
        title: 'Guardar?',
        content: 'Desea Anular el cargo!',
        buttons: {
            guardar: {
                btnClass: 'btn-green',
                keys: ['enter', 'shift'],
                action: function () {
                    get_cargos(idc, idContrato, '', '', '', '', '01/01/1900', '01/01/1900', 'ANULADO', usuariopersonal, 3);
                    //$.alert('Los datos se guardaron correctamente');
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Los datos se guardaron correctamente",
                        showConfirmButton: false,
                        timer: 1500
                    });
                }
            },
            cancelar: function () {
            },
        }
    });

    }
});

var estadoc 
var idc 
var fechaini 

$(document).on('click', '#finCargo', function () {
     estadoc = $(this).closest('tr').children()[6].textContent
     idc = $(this).closest('tr').children()[0].textContent
     fechaini = $(this).closest('tr').children()[4].textContent;
    if (estadoc == 'ANULADO') {
        //$.alert('- El Cargo no se puede finalizar por que esta Anulado');
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "El Cargo no se puede finalizar por que esta Anulado",
        });
    }

    if (estadoc == 'FINALIZADO') {
        //$.alert('- El Cargo esta finalizado');
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "El Cargo esta finalizado",
        });
    }

    if (estadoc == 'ACTIVO') {
        $("#modal-fin-cargo").modal("show");
 
    }
});


function existeFecha(fecha) {
    var fechaf = fecha.split("/");
    var d = fechaf[0];
    var m = fechaf[1];
    var y = fechaf[2];
    return m > 0 && m < 13 && y > 0 && y < 32768 && d > 0 && d <= (new Date(y, m, 0)).getDate();
}

////precionar el boton GuardarFinCargo
$(document).on('click', '#GuardarFinCargo', function () {
    var paso = 0
    if (existeFecha($('#fechafincargo').val()) == true) {
            if (ffinContrato != "")
            {
                console.log(ffinContrato)
                console.log($('#fechafincargo').val())
                if (new Date($('#fechafincargo').val()) > new Date(ffinContrato)) {
                        //$.alert('- La fecha debe ser menor o igual a la fecha de contrato');
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: "La fecha debe ser menor o igual a la fecha de contrato",
                        });
                        paso=1
                    }
            }

            if (new Date($('#fechafincargo').val()) <= new Date(fechaini))
            {
                //$.alert('- La fecha debe ser mayor a la fecha de inicio de cargo');
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: "La fecha debe ser mayor a la fecha de inicio de cargo",
                });
                paso=1
            }     
          
            if (paso == 0)
            {
                     $.confirm({
                          title: 'Guardar?',
                          content: 'Desea Finalizar el cargo!',
                          buttons: {
                              guardar: {
                                  btnClass: 'btn-green',
                                  keys: ['enter', 'shift'],
                                  action: function () {                                      
                                      get_cargos(idc, idContrato, '', '', '', '', '01/01/1900', $('#fechafincargo').val(), '', usuariopersonal, 4);
                                      //$.alert('Los datos se guardaron correctamente');
                                      Swal.fire({
                                          position: "center",
                                          icon: "success",
                                          title: "Los datos se guardaron correctamente",
                                          showConfirmButton: false,
                                          timer: 1500
                                      });
                                      $('#fechafincargo').val('')
                                      $("#modal-fin-cargo").modal("hide");
                                  }
                              },
                              cancelar: function () {
                              },
                          }
                     });
              }
    }else{
        //$.alert('- La fecha es incorrecta');
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "La fecha es incorrecta",
        });
    }
});