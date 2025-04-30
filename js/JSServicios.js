
var nomservicio;
var idservcio1=0;
var tipo=-1;

    //NUEVO SERVICIO
$('#Nuevo').click(function () {
    if (idservcio1 == 0) {
        $.alert('- DEBE ELEGIR UN SERVICIO')
    }
    else {
        $("#modal-nuevo").modal("show");        
        $('#mensaje').text(nomservicio);
        $('#txtservicio').val("");
        tipo = 0;
    }
});


//EDITAR SERVICIO
$('#Editar').click(function (e) {

    if (idservcio1 == 0) {
        $.alert('- DEBE ELEGIR UN SERVICIO')
    }
    else {
        $("#modal-nuevo").modal("show");
        $('#mensaje').text(nomservicio);
        $('#txtservicio').val(nomservicio);
        tipo = 1;
    }
});


$(function () {
    $(".example-the-1").click(validateForm);
})

//VALIDA EL FORM 
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
                        guardar(tipo)
                    }
                },
                cancelar: function () {
                },
            }
        });
    }
}

//FUNCION PARA GUARDAR 
function guardar(tipo) {
    //var idservicio = $('#idservicio').text();//v1
    var servicio = $('#txtservicio').val(); //v2
    $.ajax({
        type: 'POST',
        url: 'Servicios.aspx/funcion_ingresar',
        data: '{"v1": "' + idservcio1 + '", "v2": "' + servicio + '",  "v3": "' + tipo + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            if (response.d == "OK") {
                $.alert('Los datos se guardaron correctamente');
                $('#modal-nuevo').on('show.bs.modal', function (event) {
                    $("#modal-nuevo input").val("");                           
                });
                $("#modal-nuevo").modal("hide");
            } else { alert(response.d); }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }
    });
};


$(document).ready(function () {
    var nodeData = [];
    $.ajax({
        url: 'Handler.ashx',
        type: 'post',
        dataType: 'json',
        async: false,
        success: function (data) {
            nodeData = data;
        }
    })

    var initSelectableTree = function() {
        return $('#treeview-selectable').treeview({
            data: nodeData,
            //multiSelect: $('#chk-select-multi').is(':checked'),
            onNodeSelected: function (event, node) {
                //alert(node.text);
                //console.log(node.id)
                //$('#idservicio').text(node.id);
                //$('#servicio').text(node.text);
                nomservicio = node.text;
                idservcio1 = node.id;
                //console.log($('#indate1').val())
                get_lista(idservcio1, $('#indate1').val(), $('#indate2').val())
          
               // $('#selectable-output').prepend('<p>' + node.text + ' was selected</p>');

            },
            onNodeUnselected: function (event, node) {
                $('#selectable-output').prepend('<p>' + node.text + ' was unselected</p>');               
            }
        });
    };
    var $selectableTree = initSelectableTree();

    var findSelectableNodes = function() {
        return $selectableTree.treeview('search', [ $('#input-select-node').val(), { ignoreCase: false, exactMatch: false } ]);
    };
    var selectableNodes = findSelectableNodes();
          
    // Select/unselect/toggle nodes
    $('#input-select-node').on('keyup', function (e) {
        selectableNodes = findSelectableNodes();
        $('.select-node').prop('disabled', !(selectableNodes.length >= 1));
    });
});


//INACTIVA EL IDSERVICIO
document.getElementById("idservicio").style.display = 'none';







function get_lista(v1, v2, v3) {
    $.ajax({
        type: 'POST',
        url: "Servicios.aspx/CargarLista",
        data: '{"v1": "' + v1 + '","v2": "' + v2 + '","v3": "' + v3 + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (json) {
            //console.log(json)
            var table1 = $("#TablePersona").DataTable({
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
                   { "data": "documento" },
                   { "data": "nombre" },
                   { "data": "ap" },
                   { "data": "am" },                  
                   //{ "defaultContent": "<button type='button' title='FINALIZAR CONTRATO' id='anular' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-user'></i></button> <button type='button' id='Editar' title='EDITAR CONTRATO' class='btn btn-primary btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-user-circle'></i></button> <button type='button' id='Cargo' title='CREAR CARGO' class='btn btn-success btn-xs checkbox-toggle' data-target='#modal-lista-cargo'><i class='glyphicon glyphicon-list-alt'></i></button>" },
                ],
            });
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }
    });
}
