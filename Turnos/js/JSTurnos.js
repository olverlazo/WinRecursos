

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
                url: "GestionTurno.aspx/CargarLista",
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
               { "data": "categoria" },
               { "data": "contrato" },
               { "data": "fuente" },
               { "data": "cargo" },
               { "data": "bloque" },
               { "data": "servicio" },
               { "defaultContent": "<button type='button' id='VerTurnos' class='VerTurnos btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-user bg-aqua'></i></button>" },
            ]
        });
    } 
});

var carnet = 0
var nombre

//OBTERNER DATOS DE PERSONAL
$(document).on('click', '#VerTurnos', function () {
    document.getElementById("formpie").style.display = 'block';
    document.getElementById("cabezal").style.display = 'none';
    document.getElementById("Tabla").style.display = 'none';
    $(this).parents("tr").find("td").each(function () {
        carnet = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["ci"];
        nombre = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["nombres"];
    });
});

$(document).on('click', '#cerrar', function () {
    document.getElementById("formpie").style.display = 'none';
    document.getElementById("cabezal").style.display = 'inherit';
    document.getElementById("Tabla").style.display = 'inherit';
});



//////////////////////
//////////////////////
//////////////////////
//////////////////////
//////////////////////

//FUNCOINES  PARA GestionTurno.ASPX

//////////////////////
//////////////////////
//////////////////////
//////////////////////
//////////////////////



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