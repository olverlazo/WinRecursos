<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="KardexPersonal1.aspx.vb" Inherits="KardexPersonal1" %>
  
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css"/>
      <button type="button" class="btn btn-success" id="ButtonBuscar">
                                <i class="glyphicon glyphicon-search">&nbsp;Buscar</i>
                            </button>
         <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Hover Data Table</h3>
               
            </div>
            <!-- /.box-header -->
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
                <%--<tbody >

                </tbody>
                <tfoot>
                <tr>
                  <th>Nombre y Apellidos</th>
                  <th>C.I.</th>
                  <th>Fecha de Nacimiento</th>
                  <th>Direccion</th>
                  <th>Telefono</th>
                  <th>Profecion</th>
                </tr>
                </tfoot>--%>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->


          <!-- /.box -->
        </div>
        <!-- /.col -->
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
        //$(document).ready(function () {
        //    //$('#TablePersona').DataTable({
        //    //    "ajax": {
        //    //        "url": 'WebService.asmx/CargarPaciente',
        //    //        "dataSrc": ""        
        //    //    },
        //    //    "columns":[
        //    //        { "data": "nombres" },
        //    //        { "data": "ci" },
        //    //        { "data": "f_nacimiento" },
        //    //        { "data": "direccion" },
        //    //        { "data": "telefono" },
        //    //        { "data": "profesion" },
        //    //    ]
        //    //});
        //});
         $(function () {
             $('#TablePersona').DataTable()
             _showUsers();
         });
        
         function _showUsers() {
             $('#ButtonBuscar').on("click", function () {
               //  test();
                dtUsers();
             });
         }

         //function test() {
         //    $.ajax({
         //        method: "POST",
         //        url: "KardexPersonal1.aspx/CargarLista",
         //        contentType: "application/json; charset=utf-8",
         //        dataType: "json",
         //        success: function (response) {
         //            if (response.d == "") {
         //                alert("no hay datos ")
         //            }
         //            else
         //            {   alert(response.d)
         //            }
         //             },
         //        error: function () {
         //            alert("Error ");
         //        }
         //    })
         //}

     
         function test() {
             $.ajax({
                 method: "POST",
                 url: "KardexPersonal1.aspx/CargarLista",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json"
             }).done(function (info) {
                 //console.log(info);
             });
         }




         function dtUsers() {
             var table = $("#TablePersona").DataTable({
                 destroy: true,
                 responsive: true,
                 ajax: {
                     method: "POST",
                     url: "KardexPersonal1.aspx/CargarLista",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     lengthMenu: [[2, 25, 50, 50, 60, 20], [2, 25, 50, 50, 60, 20]],
                     data: function (d) {
                         return JSON.stringify(d);
                     },
                     dataSrc: "d.data"
                 },
                 "columns":[
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

