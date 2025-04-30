<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="KardexPersonal2.aspx.vb" Inherits="KardexPersonal2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"/>
    <section class="content-header">
      <h1>
        LISTA DE PERSONAL
      </h1>
<button type="button" class="btn btn-success" id="ButtonBuscar">
        <i class="glyphicon glyphicon-search">&nbsp;Buscar</i>
    </button>

    <div class="form-group" id="user-group">
        <input type="text" class="col-xs-5" placeholder="Nombre de usuario" name="usuario" id="txtvalor" />
    </div>
    </section>

    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Lista de Personal</h3>
                </div>
                 
                <div class="box-body">
                    <table id="TablePersona" class="table table-bordered table-hover">
                        <thead>
                            <th>Nombre y Apellidos</th>
                            <th>C.I.</th>
                            <th>Fecha de Nacimiento</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>Profecion</th>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>

     <script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

     <script  type="text/javascript">

         $("#txtvalor").on("input", function (e) {
             var input = $(this);
             var val = input.val();
            // console.log(val);
             //if (input.data("lastval") != val) {
             //    input.data("lastval", val);
                 //your change action goes here 
                 // console.log(val);
             if (val.length >1) {
                 $("#TablePersona").DataTable({
                     'paging': true,
                     'lengthChange': false,
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
                         url: "KardexPersonal2.aspx/CargarLista",
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
                     ]
                 });
             }
             //}
         });
     
         //$('#ButtonBuscar').on("click", function () {
         //     $("#TablePersona").DataTable({
         //        destroy: true,
         //        responsive: true,
         //        ajax: {
         //            method: "POST",
         //            url: "KardexPersonal2.aspx/CargarLista",
         //            contentType: "application/json; charset=utf-8",
         //            dataType: "json",
         //            data: function (d) {
         //                      d.v1 = $('#txtvalor').val();
         //                return JSON.stringify(d);
         //            },
         //            dataSrc: "d.data"
         //        },
         //        "columns": [
         //           { "data": "nombres" },
         //           { "data": "ci" },
         //           { "data": "f_nacimiento" },
         //           { "data": "direccion" },
         //           { "data": "telefono" },
         //           { "data": "profesion" },
         //        ]
         //    });

         //});



         $(function () {
             //$('#TablePersona').DataTable()
             $('#TablePersona').DataTable({
                 'paging': true,
                 'lengthChange': false,
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







             //_showUsers();
         });

         function _showUsers() {
             $('#ButtonBuscar').on("click", function () {
                 //  test();
                 dtUsers();
             });
         }


         function dtUsers() {
             var table = $("#TablePersona").DataTable({
                 destroy: true,
                 responsive: true,
                 ajax: {
                     method: "POST",
                     url: "KardexPersonal2.aspx/CargarLista",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     data: function (d) {
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
                 ]
             });
         }

         

</script>
</asp:Content>

