$(document).ready(function () {
    var id = 0
    var desconexion = document.getElementById('desconexion');
    desconexion.disabled = true
    //console.log('entra')
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "CargarPersonal.aspx/Lista_Dispositivo",
        data: '{"v1": "' + id + '"}',
        dataType: "json",
        success: function (result) {
            $('#dispositivo').empty();
            $('#dispositivo').append("<option value=''>--Seleccionar--</option>");
            $.each(result.d, function (key, value) {
                $("#dispositivo").append($("<option></option>").val(value.id_dispositivo).html(value.nombre));
            });
        },
        error: function ajaxError(result) {
            alert(result.status + ' : ' + result.statusText);
        }
    });
});

function ver_datos(valor) {
    var campo = document.getElementById('dispoconect');
    if (valor > 0 ) { 
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "CargarPersonal.aspx/VerDatos",
                data: '{"v1": "' + valor + '"}',
                dataType: "json",
                success: function (response) {                  
                     $('#dispoconect').text("Dispositivo Conectado");
                     campo.style.color = "green";
                     $('#nombredispo').text("Dispositivo: "+response.d[1]);                 
                },
                error: function ajaxError(result) {
                    alert(result.status + ' : ' + result.statusText);
                }
            });
    } else {
        $('#dispoconect').text("Dispositivo Desconectado");
        campo.style.color = "red";
        //$('#nombredispo').text("Nombre del dispositivo: ");
    }
}


var datos_biometrico

function listar(){
    var id = $('select[name=dispositivo]').val()
    var conexion = document.getElementById('conexion');
    var desconexion = document.getElementById('desconexion');
    //conexion.disabled = true
    //desconexion.disabled = false
    
    if (id == '') {
        ver_datos(0)
        //$.alert("Seleccione un dispositivo ")
        Swal.fire({
            icon: "error",
            title: "Error",
            text: "Seleccione un dispositivo!",
        });
    } else {
    
    $.ajax({
        type: 'POST',
        url: "CargarPersonal.aspx/Lista_Personal",
        data: '{"v1": "' + id + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        beforeSend: function () {
            document.body.appendChild(fgp_loader);
        },

        success: function (json) {
            fgp_loader.remove();
            if (json.d.data.length == 1) {
                ver_datos(0)
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: "Se produjo un Error no se puede conectar al dispositivo verifique la red!",
                });

            } else {
                
                datos_biometrico = JSON.stringify(json)
                conexion.disabled = true
                desconexion.disabled = false
                    var table1 = $("#TableListaPersonal").DataTable({
                        'paging': true,
                        'lengthChange': false,
                        dom:'Bfrtip',
                        'buttons': ['pdf'],
                        'searching': true,
                        'ordering': true,
                        'info': true,
                        'autoWidth': false,
                        language: {
                            "processing": "Procesando...",
                            "lengthMenu": "Mostrar _MENU_ registros",
                            "zeroRecords": "No se encontraron resultados",
                            "emptyTable": "Ningún resultado encontrado",
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
                           { "data": "nombre" },
                           { "data": "password" },
                           { "data": "privilegio" },
                           { "data": "statu" },                                     
                           { "defaultContent": "<button type='button' title='ELIMINAR HUELLAS' id='borrar_huella' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-user'></i></button> <button type='button' id='borrar_personal' title='ELIMINAR PERSONA' class='btn btn-primary btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-user-circle'></i></button>" },
                        ],
                    });
                    ver_datos(id)
                    Swal.fire({
                        icon: "success",
                        title: "Se conecto al dispositivo",
                        showConfirmButton: false,
                        timer: 1500
                    });

            }
            },            
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            alert("Error!: " + err.Message)
        }
    });
    }
    
}

//precionar el boton nuevo contratto
$('#conexion').click(function () {  
    listar();    
});



$(document).on('click', '#desconexion', function (e) {
    //ver_datos(0)

    
    Swal.fire({
        icon: "success",
        title: "Se desconecto al dispositivo",
        showConfirmButton: false,
        timer: 1500
    });
    window.location = "../Dispositivos/CargarPersonal.aspx"
});


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
    var id = $('select[name=dispositivo]').val()
    //if ((val.length > 1) && (id>0) && ($('#dispoconect').val()=="Dispositivo Conectado")) {
    if ((val.length > 1) && (id > 0)) {
        $("#TablePersona").DataTable({
            
            'paging': true,
            'lengthChange': false,
            'searching': false,
            'ordering': false,
            'info': true,
            'autoWidth': false,
            dom:'Bfrtip',
            'buttons': ['pdfHtml5'],
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
                url: "CargarPersonal.aspx/CargarLista",
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
               { "defaultContent": "<button type='button' id='VerDetalle' class='VerContratos btn btn-primary btn-sm checkbox-toggle'><i class='fa fa-user'></i></button>" },
            ]
        });
    };
});



// BORRA HUELLA DE BIOMETRICO

$(document).on('click', '#borrar_huella', function () {    
    var carnet_BIO = $("#TableListaPersonal").DataTable().row($(this).parents("tr")).data()["id"];
    var nombre_BIO = $("#TableListaPersonal").DataTable().row($(this).parents("tr")).data()["nombre"];

    $.ajax({
        type: 'POST',
        url: "CargarPersonal.aspx/borrahuella",
        data: '{"v1": "' + carnet_BIO + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        beforeSend: function () {
            document.body.appendChild(fgp_loader);
        },

        success: function (response) {
            fgp_loader.remove();
            if (response.d == 'OK') {
                Swal.fire({
                    title: "Correcto!",
                    text: "Se elimino las huellas del CI:" + carnet_BIO +" correctamente",
                    icon: "success"
                }); 
            }
            else {
                Swal.fire({
                    title: "Error!",
                    text: "Existe un error intente mas tarde",
                    icon: "error"
                }); 
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            //alert("Error!: " + err.Message)
            Swal.fire({
                title: "Error!",
                text: "Error!: " + err.Message,
                icon: "error"
            });
        }
    });


});



$(document).on('click', '#borrar_personal', function () {    
    var carnet_BIO = $("#TableListaPersonal").DataTable().row($(this).parents("tr")).data()["id"];
    var nombre_BIO = $("#TableListaPersonal").DataTable().row($(this).parents("tr")).data()["nombre"];
    var id = $('select[name=dispositivo]').val()
    $.ajax({
        type: 'POST',
        url: "CargarPersonal.aspx/borrapersona",
        data: '{"v1": "' + carnet_BIO + '"}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        dom:'Bfrtip',
        'buttons': ['pdfHtml5'],

        success: function (response) {            
            if (response.d == 'OK') {   
                $.ajax({
                    type: 'POST',
                    url: "CargarPersonal.aspx/Lista_Personal",
                    data: '{"v1": "' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    beforeSend: function () {
                        document.body.appendChild(fgp_loader);
                    },
                    success: function (json) {          
                        var table1 = $("#TableListaPersonal").DataTable({
                            'paging': true,
                            'lengthChange': false,
                            'searching': true,
                            'ordering': true,
                            'info': true,
                            'autoWidth': false,
                            language: {
                                "processing": "Procesando...",
                                "lengthMenu": "Mostrar _MENU_ registros",
                                "zeroRecords": "No se encontraron resultados",
                                "emptyTable": "Ningún resultado encontrado",
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
                               { "data": "nombre" },
                               { "data": "password" },
                               { "data": "privilegio" },
                               { "data": "statu" },                                     
                               { "defaultContent": "<button type='button' title='ELIMINAR HUELLAS' id='borrar_huella' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-user'></i></button> <button type='button' id='borrar_personal' title='ELIMINAR PERSONA' class='btn btn-primary btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-user-circle'></i></button>" },
                            ],
                        });  
                        fgp_loader.remove();
                        Swal.fire({
                            title: "Correcto!",
                            text: "Se elimino el CI:" + carnet_BIO +" correctamente",
                            icon: "success"
                        });
                    },            
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        var err = eval("(" + XMLHttpRequest.responseText + ")");                    
                        Swal.fire({
                            title: "Error!",
                            text: "Error!: " + err.Message,
                            icon: "error"
                        });
                    }
                });
                //
                 
                
                
            }
            else {
                Swal.fire({
                    title: "Error!",
                    text: "Existe un error intente mas tarde",
                    icon: "error"
                }); 
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var err = eval("(" + XMLHttpRequest.responseText + ")");
            //alert("Error!: " + err.Message)
            Swal.fire({
                title: "Error!",
                text: "Error!: " + err.Message,
                icon: "error"
            });
        }
    });


});



//obtiene lo datos del personal
$(document).on('click', '#VerDetalle', function () {
    carnet = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["ci"];
    nombre = $("#TablePersona").DataTable().row($(this).parents("tr")).data()["nombres"];
    var nom_corto =nombre.substring(0,23)
    var id = $('select[name=dispositivo]').val()
    //console.log(datos_biometrico.search('"' + carnet + '"'))

    if (datos_biometrico.search('"' + carnet + '"') == -1) {
                    Swal.fire({
                        title: "Agragar?",
                        text: "Desea Agregar el CI:" +carnet+" Al dispositivo?",
                        icon: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#3085d6",
                        cancelButtonColor: "#d33",
                        confirmButtonText: "Si, agregar!"
                    }).then((result) => {
                        if (result.isConfirmed) {
        //function agregar1(carnet,nom_corto);
        //////////////////////////////////////


        $.ajax({
                        type: 'POST',
                    url: "CargarPersonal.aspx/DatosPersona",
                    data: '{"v1": "' + carnet + '", "v2": "' + nom_corto + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {                        
                        if (response.d == 'OK') {
                            $.ajax({
                                type: 'POST',
                                url: "CargarPersonal.aspx/Lista_Personal",
                                data: '{"v1": "' + id + '"}',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                beforeSend: function () {
                                    document.body.appendChild(fgp_loader);
                                },
                                success: function (json) {          
                                        var table1 = $("#TableListaPersonal").DataTable({
                                            'paging': true,
                                            'lengthChange': false,
                                            'searching': true,
                                            'ordering': true,
                                            'info': true,
                                            'autoWidth': false,
                                            language: {
                                                "processing": "Procesando...",
                                                "lengthMenu": "Mostrar _MENU_ registros",
                                                "zeroRecords": "No se encontraron resultados",
                                                "emptyTable": "Ningún resultado encontrado",
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
                                               { "data": "nombre" },
                                               { "data": "password" },
                                               { "data": "privilegio" },
                                               { "data": "statu" },                                     
                                               { "defaultContent": "<button type='button' title='ELIMINAR HUELLAS' id='borrar_huella' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-user'></i></button> <button type='button' id='borrar_personal' title='ELIMINAR PERSONA' class='btn btn-primary btn-xs checkbox-toggle' data-target='#modal-nuevo-cargo'><i class='fa fa-user-circle'></i></button>" },
                                            ],
                                        });  
                                        fgp_loader.remove();
                                        Swal.fire({
                                            title: "Correcto!",
                                            text: "Se agrego correctamente",
                                            icon: "success"
                                        });
                                },            
                                error: function (XMLHttpRequest, textStatus, errorThrown) {
                                    var err = eval("(" + XMLHttpRequest.responseText + ")");
                                    alert("Error!: " + err.Message)
                                }
                            });

                            


                            
                            
                            
                        }
                        else {
                            Swal.fire({
                                title: "Error!",
                                text: "Existe un error intente mas tarde",
                                icon: "error"
                            }); 
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        var err = eval("(" + XMLHttpRequest.responseText + ")");
                        $.alert("Error!: " + err.Message)
                }
});


        ///////////////////////////////////////

    
                }
                    });
                }
                else {
                    Swal.fire({
                        icon: "warning",
                        title: "Resgistro",
                        text: "El CI: " + carnet + " ya se encuentra registrado en el dispositivo",
                    });
                }

});


 


