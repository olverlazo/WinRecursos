<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Servicios.aspx.vb" Inherits="Servicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <section class="content-header">
      <h1>
          SERVICIOS           
      </h1>

    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-4">
                <div class="box box-success">
                    <div class="box-header with-border">
                        <a class="btn btn-primary margin-bottom " data-toggle="modal" id="Nuevo">Nuevo Servicio</a>
                        <a class="btn btn-success margin-bottom " data-toggle="modal" id="Editar">Editar Servicio</a>
                        <a class="btn btn-danger margin-bottom " data-toggle="modal" id="Eliminar">Eliminar Servicio</a>
                        <input type="input" onkeyup="javascript:this.value=this.value.toUpperCase();" class="form-control" id="input-select-node" placeholder="Buscar Servicio..." value="" />
                    </div>
                    <div class="box-body" style="overflow: auto; max-height: 700px">
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <div id="treeview-selectable"></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /.col -->
            <div class="col-md-8">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <%--<h3 class="box-title">Personal</h3>--%>
                        <label id="idservicio" class="box-title">0</label>
                        <label id="servicio" class="box-title"></label>                       
                            <div class="row">
                                <div class="col-md-4">
                                    <article class="l-design-widhtin">
                                        <label class="inputin">
                                            <label id="Label6" class="box-title">Desde el</label>
                                            <div id="datepicker1" class="input-group date" data-date-format="dd/mm/yyyy">
                                                <input id="indate1" class="form-control" type="text" readonly />
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i>
                                                </span>
                                            </div>
                                        </label>
                                    </article>
                                </div>
                                <div class="col-md-4">
                                    <article class="l-design-widhtin">
                                        <label class="inputin">
                                            <label id="Label1" class="box-title">Hasta el</label>
                                            <div id="datepicker2" class="input-group date" data-date-format="dd/mm/yyyy">
                                                <input id="indate2" class="form-control" type="text" readonly />
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i>
                                                </span>
                                            </div>
                                        </label>
                                    </article>
                                </div>
                            </div>                     
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="TablePersona" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>C.I.</th>
                                    <th>Nombres</th>
                                    <th>Apellido Paterno</th>
                                    <th>Apellido Paterno</th>                                    
                                    <th></th>
                                </tr>
                            </thead>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->


        <%--MODAL NUEVO--%>
        <div id="form">
            <div class="modal fade" id="modal-nuevo" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-mg">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Crear Nuevo Servicio</h4>
                        </div>
                        <div class="modal-body">
                            <label id="mensaje" class="box-title"></label>
                            <br />
                            <label id="serviciomodal" class="box-title"></label>
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <input class="inputin__fieldin" type="text" id="txtservicio" data-validate="required" placeholder=" " maxlength="245" data-validate-message="Ingrese Servicio" />
                                    <span class="inputin__labelin">Servicio...</span>
                                </label>
                            </article>
                        </div>
                        <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                            <button class="btn btn-primary example-the-1" id="btnGuardar" type="button">Guardar</button>
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </div>
    </section>

     <!-- treeview -->
    <script src="bower_components/jquery/dist/jquery.js"></script>
    <%--<script src="js/bootstrap-treeview.js"></script>--%>


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


    <!-- InputMask -->
        <script src="plugins/input-mask/jquery.inputmask.js"></script>
        <script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>

    
    <script>
        $(function () {
            $("#datepicker1").datepicker({
                autoclose: true,
                todayHighlight: true,
                todayBtn: "linked",  
            }).datepicker('update', new Date());

            $("#datepicker2").datepicker({
                autoclose: true,
                todayHighlight: true,
                todayBtn: "linked",                
                //title: "Geeksforgeeks datepicker"
            }).datepicker('update', new Date());
        });
    </script>


    
    <script src="js/JSServicios.js"></script>
    <script>
       //Date picker
    //$('#datepicker').datepicker({
    //  autoclose: true
    //})
    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
        </script>

 <%--    <script>
         $(function () {

         });
    </script>--%>
  <%--  <script  type="text/javascript">
        var nomservicio;
        var idservcio1;
        var tipo=-1;
        //EDITAR 
    
        $('#Nuevo').click(function (e) {
            $('#mensaje').text('INGRESE NOMBRE DEL SERVICIO QUE SERA DEPENDIENTE DE');
            $('#serviciomodal').text(nomservicio);
            $('#txtservicio').val('');
            tipo = 0;
        });

        $('#Editar').click(function (e) {
            $('#mensaje').text('SERVICIO SELECCIONADO: ' );
            $('#serviciomodal').text(nomservicio);
            $('#txtservicio').val(nomservicio);
            tipo = 1;
        });


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
            var idservicio = $('#idservicio').text();//v1
            var servicio = $('#txtservicio').val(); //v2
              $.ajax({
                  type: 'POST',
                  url: 'Servicios.aspx/funcion_ingresar',
                  data: '{"v1": "' + idservicio + '", "v2": "' + servicio + '",  "v3": "' + tipo + '"}',
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
                    multiSelect: $('#chk-select-multi').is(':checked'),
                    onNodeSelected: function (event, node) {
                        //alert(node.text);
                        //console.log(node.id)
                        $('#idservicio').text(node.id);
                        $('#servicio').text(node.text);
                        nomservicio = node.text;
                        idservcio1 = node.text;
                        //$('#serviciomodal').text(node.text);
                        $('#selectable-output').prepend('<p>' + node.text + ' was selected</p>');
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
        </script>--%>
</asp:Content>

