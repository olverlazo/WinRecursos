<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="KardexPersonal.aspx.vb" Inherits="KardexPersonal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        LISTA DE PERSONAL
      </h1>

    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          <a class="btn btn-primary btn-block margin-bottom "   data-toggle="modal" data-target="#modal-warning" id="Nuevo" ></i>Nuevo Personal</a>

          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Buscar</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body">
              <ul class="nav nav-pills nav-stacked">
                <li>
                    <div class="input-group input-group-sm">
                     <input type="text" class="form-control" placeholder="Nombre/Apellido" id="txtvalor"/>
                        <span class="input-group-btn">
                    <button type="button" class="btn btn-info btn-flat">Buscar</button>
                    </span>
                     </div>
                 </li>
       
              
        
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
       
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Personal</h3>
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
                    </table>

            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  

     <!-- /.MODAL DATOS PACINTE-->
       
           <div class="modal modal-warning fade" id="modal-warning">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Datos del Paciente</h4>
              </div>
              <div class="modal-body">

                   <div class="row">
                       <div class="col-sm-4 col-xs-6">
                           <div class="description-block border-right">
                               <div class="form-group">
                                   <h5 class="modal-title">Apellido Paterno</h5>
                                   <input id="paternom" type="text" class="form-control" placeholder="Apellido Paterno.." value=""/>
                               </div>
                           </div>
                       </div>
                       <!-- /.col -->
                       <div class="col-sm-4 col-xs-6">
                           <div class="description-block border-right">
                               <div class="form-group">
                                   <h5 class="modal-title">Apellido Materno</h5>
                                   <input id="maternom" type="text" class="form-control" placeholder="Apellido Materno.." value ="" />
                               </div>
                           </div>
                       </div>
                       <!-- /.col -->
                       <div class="col-sm-4 col-xs-6">
                           <div class="description-block border-right">
                               <div class="form-group">
                                   <h5 class="modal-title">Nombres</h5>
                                   <input id="nombrem" type="text" class="form-control" placeholder="Nombres.." value =""/>
                               </div>
                           </div>
                       </div>
                       <!-- /.col -->

                   </div>

                   <div class="row">
                       <div class="col-sm-6 col-xs-6">
                           <div class="description-block border-right">
                               <div class="form-group">
                                   <label>Elegir Genero</label>
                                   <h5 class="modal-title"></h5>
                                   <label>
                                       <input type="radio" name="genero" id="hombre" value="HOMBRE"  />
                                       Hombre &nbsp;  &nbsp;             
                                   </label>
                                   <label>
                                       <input type="radio" name="genero" id="mujer" value="MUJER"  />
                                       Mujer               
                                   </label>
                               </div>
                           </div>
                       </div>
                       <!-- /.col -->
                       <div class="col-sm-6 col-xs-6">
                           <div class="description-block border-right">
                               <label>Fecha de Nacimiento</label>
                               <div class="input-group">
                                   <div class="input-group-addon">
                                       <i class="fa fa-calendar"></i>
                                   </div>
                                   <input id="fnacimientom" type="text" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask />
                               </div>
                           </div>
                       </div>
                   </div>

                   <div class="row">
                      <div class="col-sm-6 col-xs-6">
                          <div class="description-block border-right">
                              <label>C.I.</label>
                              <div class="form-group">
                                  <input id="cim"  type="number" class="form-control" placeholder="C.I." />
                              </div>
                          </div>
                      </div>
                      <!-- /.col -->
                      <div class="col-sm-6 col-xs-6">
                          <div class="description-block border-right">
                              <label>Expedido</label>
                              <select id="ciudad" class="form-control">
                                  <option>--Seleccionar--</option>
                                  <option>BENI</option>
                                  <option>COCHABAMBA</option>
                                  <option>LA PAZ</option>
                                  <option>ORURO</option>
                                  <option>PANDO</option>
                                  <option>POTOSI</option>
                                  <option>SANTA CRUZ</option>
                                  <option>SUCRE</option>
                                  <option>TARIJA</option>
                              </select>
                          </div>
                      </div>
                  </div>

                   <div class="row">
                      <div class="col-sm-6 col-xs-6">
                          <div class="description-block border-right">
                              <label>Telefeno</label>
                              <div class="form-group">
                                  <input id="fonom" type="number" class="form-control" placeholder="Telefono"/>
                              </div>
                          </div>
                      </div>
                      <!-- /.col -->
                      <div class="col-sm-6 col-xs-6">
                          <div class="description-block border-right">
                              <label>Direccion</label>
                              <input id="direccionm" type="text" class="form-control" placeholder="Direccion" />
                          </div>
                      </div>
                  </div>
               </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Cerrar</button>
                <button id="btnGuardar" type="button" class="btn btn-outline">Guardar</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>

        <!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>       
<!-- Select2 -->
<script src="bower_components/select2/dist/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="plugins/iCheck/icheck.min.js"></script>

       <script  type="text/javascript">

           $("#txtvalor").on("input", function (e) {
               var input = $(this);
               var val = input.val();
               // console.log(val);
               //if (input.data("lastval") != val) {
               //    input.data("lastval", val);
               //your change action goes here 
               // console.log(val);
               if (val.length > 1) {
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
                           url: "KardexPersonal.aspx/CargarLista",
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
               });

           $(function () {
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
                       url: "KardexPersonal.aspx/CargarLista",
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

