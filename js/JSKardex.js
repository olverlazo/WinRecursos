$(document).ready(function () {
    //CARGA SEGUROS
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "KardexPersonal3.aspx/funcion_Seguros",
        data: '{"v1": "0", "v2": "0", "v3": "0","v4": "4"}',
        dataType: "json",
        success: function (result) {

            document.getElementById("idpersonal").style.display = 'none';
            $('#seguros').empty();
            $('#seguros').append("<option value=''>--Seleccionar--</option>");
            $.each(result.d, function (key, value) {
                $("#seguros").append($("<option></option>").val(value.seguros_descripcion).html(value.seguros_descripcion));
            });
            // $("#ddlDepartments").select2();
        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });
    //CARGA NIVEL DE ESTUDIO
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "KardexPersonal3.aspx/funcion_estudio",
        data: '{"v1": "0", "v2": "0", "v3": "0","v4": "4"}',
        dataType: "json",
        success: function (result) {
            $('#estudio').empty();
            $('#estudio').append("<option value=''>--Seleccionar--</option>");
            $.each(result.d, function (key, value) {
                $("#estudio").append($("<option></option>").val(value.estudio_descripcion).html(value.estudio_descripcion));
            });
            // $("#ddlDepartments").select2();
        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });

    //SOLO NUMEROS EN CI
    jQuery("#ci").on('input', function (evt) {
        // Allow only numbers.
        jQuery(this).val(jQuery(this).val().replace(/[^0-9]/g, ''));
    });

});



//GUARDAR ORDEN
function guardar() {
    var idpersonal = $('#idpersonal').text();                                                //v1
    var documento = $('#ci').val();                                       //v2
    var complemento = $('#complemento').val();                               //v3
    var expedido = $('select[name=ciudad]').val();
    var nombre = $('#txtnombres').val();
    var ap_paterno = $('#txtapaterno').val();
    var ap_materno = $('#txtamaterno').val();
    var sexo = $('input:radio[name=genero]:checked').val()
    var f_nacimiento = $('#nacimiento').val();
    var direccion = $('#direccion').val();
    var telefono = $('#telefono').val();
    var correo = $('#email').val();
    var c_seguro = $('select[name=seguros]').val();
    var m_seguro = $('#matriculas').val();
    var e_afiliado = $('select[name=afp]').val();
    var c_afiliado = $('#NUA').val();
    var f_ing_sis_salud = "01/01/2000"; //no esta en el modal HTML
    var d_contraloria = 0;//no esta en el modal HTML
    var d_risaj = "";//no esta en el modal HTML
    var f_risaj = "";//no esta en el modal HTML
    var d_sipasse = "";//no esta en el modal HTML
    var f_sipasse = "";//no esta en el modal HTML
    var d_libreta = "";//no esta en el modal HTML
    var f_asig_vacacion = $('#CAS').val(); //no esta en el modal HTML
    var fuente_verif_vacacion = 0; //no esta en el modal HTML
    var n_estudio = $('select[name=estudio]').val();
    var profesion = $('#profesion').val();
    var mat_profesion = $('#matricula').val();
    var mat_especialidad = 0;//no esta en el modal HTML
    var foto = 0;//cargar la foto al jscript   
    var estado = 'true';//no esta en el modal HTML
    var id_biometrico = "";//no esta en el modal HTML
    var file = "";//no esta en el modal HTML
    var r1 = "";//no esta en el modal HTML
    var r2 = "";//no esta en el modal HTML
    var r3 = "";//no esta en el modal HTML
    var r4 = "";//no esta en el modal HTML
    var f_registro_personal = "01/01/2000"; //no esta en el modal HTML esta variable se asigna en el procedimiento del SQL
    var usuario_r_personal = '<%= Session("idusuario").ToString%>';
    $.ajax({
        type: 'POST',
        url: 'KardexPersonal3.aspx/funcion_ingresar',
        data: '{"v1": "' + idpersonal + '", "v2": "' + documento + '", "v3": "' + complemento + '", "v4": "' + expedido + '", "v5": "' + nombre + '", "v6": "' + ap_paterno + '", "v7": "' + ap_materno + '", "v8": "' + sexo + '","v9": "' + f_nacimiento + '", "v10": "' + direccion + '", "v11": "' + telefono + '", "v12": "' + correo + '", "v13": "' + c_seguro + '", "v14": "' + m_seguro + '", "v15": "' + e_afiliado + '", "v16": "' + c_afiliado + '", "v17": "' + f_ing_sis_salud + '", "v18": "' + d_contraloria + '", "v19": "' + d_risaj + '", "v20": "' + f_risaj + '", "v21": "' + d_sipasse + '", "v22": "' + f_sipasse + '", "v23": "' + d_libreta + '", "v24": "' + f_asig_vacacion + '", "v25": "' + fuente_verif_vacacion + '", "v26": "' + n_estudio + '", "v27": "' + profesion + '", "v28": "' + mat_profesion + '", "v29": "' + mat_especialidad + '", "v30": "' + foto + '", "v31": "' + estado + '", "v32": "' + id_biometrico + '", "v33": "' + file + '","v34": "' + r1 + '", "v35": "' + r2 + '", "v36": "' + r3 + '", "v37": "' + r4 + '", "v38": "' + f_registro_personal + '", "v39": "' + usuario_r_personal + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d == "OK") {
                $.alert('Los datos se guardaron correctamente');
                $('#modal-NuevoKardex').on('show.bs.modal', function (event) {
                    $("#modal-NuevoKardex input").val("");
                    $("#modal-NuevoKardex textarea").val("");
                    $("#modal-NuevoKardex select").val("");
                    $("#modal-NuevoKardex input[type='checkbox']").prop('checked', false).change();
                    $("#modal-NuevoKardex input[type='radio']").prop('checked', false).change();
                });
                $("#modal-NuevoKardex").modal("hide");
            } else { alert(response.d); }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
            //console.log("Error!");
        }
    });
};


//PREGUNTA SI DESEA GUARDAR   
$(function () {
    $(".example-the-1").click(validateForm);
})
function validateForm() {
    var validation = $("#form").validate();

    if (validation.isValid() === true) {
        $.confirm({
            title: 'Guardar?',
            content: 'Desea Guardar los datos!',
            buttons: {
                guardar: {
                    btnClass: 'btn-green',
                    keys: ['enter', 'shift'],
                    action: function () {
                        //$.alert('Los datos se guardaron correctamente');
                        guardar()
                    }
                },
                cancelar: function () {
                },
            }
        });
    }
    //else {
    //    alert("boo :(");
    //}
}

//OBTERNER DATOS AL EDIAT
var obtener_data_editar = function (tbody, table) {
    $(tbody).on("click", "button.editar", function () {
        //var data = table.row($(this).parents("tr")).data();
        var tabla_carnet = table.row($(this).parents("tr")).data();
        if (typeof tabla_carnet != 'undefined') {
            //alert(carnet);
            var carnet = table.row($(this).parents("tr")).data()["ci"];
            //****************************************
            $.ajax({
                type: 'POST',
                url: "KardexPersonal3.aspx/funcion_personal",
                data: '{"v1": "' + carnet + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response.d);
                    var idpersonal = '<%= Session("idpersonal").ToString%>';
                    $('#idpersonal').text(response.d[0]);
                    $('#ci').val(response.d[1]);
                    $('#txtnombres').val(response.d[4]);
                    $('#txtapaterno').val(response.d[5]);
                    $('#txtamaterno').val(response.d[6]);
                    $('#complemento').val(response.d[2]);
                    $('#ciudad').val(response.d[3]);
                    $('#nacimiento').val(response.d[8]);
                    if (response.d[7] == "MUJER") {
                        $('#mujer').prop('checked', 'checked');

                        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                            checkboxClass: 'icheckbox_flat-green',
                            radioClass: 'iradio_flat-green'
                        })

                        // $("#mujer").select2();
                    } else {
                        $('#hombre').prop('checked', 'checked');
                        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                            checkboxClass: 'icheckbox_flat-green',
                            radioClass: 'iradio_flat-green'
                        })
                        //$("#hombre").select2();
                    }
                    $('#direccion').val(response.d[9]);
                    $('#telefono').val(response.d[10]);
                    $('#email').val(response.d[11]);
                    $('#seguros').val(response.d[12]);
                    $('#matriculas').val(response.d[13]);
                    $('#afp').val(response.d[14]);
                    $('#NUA').val(response.d[15]);
                    $('#CAS').val(response.d[16]);
                    $('#estudio').val(response.d[17]);
                    $('#profesion').val(response.d[18]);
                    $('#matricula').val(response.d[19]);
                    // console.log(response.d)
                },
                error: function (result) {
                    //console.log(result.status + ' : ' + result.statusText)
                    alert("ERROR    " + result.status + ' ' + result.statusText);
                    //console.log("Error!");
                }
            });
            //****************************************
        }
    });

}


$("#txtvalor").on("keyup", function (e) {
    //var input = $(this);
    //var val = input.val();

    var input = $(this).val();
    var val = $('#txtvalor').val();
    if (val.length > 1) {
        $("#TablePersona").DataTable({
            'paging': true,
            'lengthChange': true,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            language: {
                "processing": "Procesando...",
                "lengthMenu": "Mostrar _MENU_ registros",
                "zeroRecords": "No se encontraron resultados",
                "emptyTable": "Ningún dato disponible en esta tabla",
                "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
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
                url: "KardexPersonal3.aspx/CargarLista",
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
               { "data": "f_nacimiento" },
               { "data": "direccion" },
               { "data": "telefono" },
               { "data": "profesion" },
               { "defaultContent": "<button type='button' id='Editar' class='editar btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-pencil-square-o'></i></button>       <button type='button' class='eliminar btn btn-danger btn-sm' data-toggle='modal' data-target='#modalEliminar' ><i class='fa fa-trash-o'></i></button>" },
            ]
        });
    } obtener_data_editar("#TablePersona tbody", $("#TablePersona").DataTable());
});




$(function () {
    $('#TablePersona').DataTable({
        'paging': true,
        'lengthChange': true,
        'searching': false,
        'ordering': true,
        'info': true,
        'autoWidth': false,
        language: {
            "processing": "Procesando...",
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron resultados",
            "emptyTable": "Ningún dato disponible en esta tabla",
            "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
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


$(document).on('click', '#Nuevo', function () {
    $('#modal-NuevoKardex').modal('show');
    $('#idpersonal').text(0);
});

$(document).on('click', '#Editar', function () {
    $('#modal-NuevoKardex').modal('show');
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