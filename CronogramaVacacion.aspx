<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="CronogramaVacacion.aspx.vb" Inherits="CronogramaVacacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <section class="content-header">
        <h1>GESTION DE VACACIONES         
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-4">
                <div class="box box-success">
                    <div class="box-header with-border">
                        <h3 class="box-title">&nbsp;Buscar</h3>
                        <input type="text" class="form-control" placeholder="Nombre/Apellido/C.I." id="txtvalor" autocomplete="off" />
                    </div>
                    <div class="box-body">
                        <table id="TablePersona" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Nombre y Apellidos</th>
                                    <th>C.I.</th>
                                    <th></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.col -->
            <div class="col-md-8">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <div class="box-body info-box bg-teal">
                            <label id="idpersona" class="box-title">0</label>
                            <dl id="mdatos" class="dl-horizontal">
                                <dt class="box-title">NOMBRE:</dt>
                                <dd>
                                    <label id="nombres" class="box-title"></label>
                                </dd>
                                <dt class="box-title">C.I.:</dt>
                                <dd>
                                    <label id="ci" class="box-title"></label>
                                </dd>
                                <dt class="box-title">CONTRATO:</dt>
                                <dd>
                                    <label id="contrato" class="box-title"></label>
                                </dd>
                                <dd>
                                    <label id="categoria" class="box-title"></label>
                                </dd>
                                <dd>
                                    <label id="ff" class="box-title"></label>
                                </dd>
                                <dt class="box-title">CARGO:</dt>
                                <dd>
                                    <label id="bloque" class="box-title"></label>
                                </dd>
                                <dd>
                                    <label id="cargo" class="box-title"></label>
                                </dd>
                            </dl>
                        </div>
                        <a class="btn btn-primary margin-bottom " id="NuevoCronograma"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Nuevo Registro</a>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="TableCronograma" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Nro</th>
                                    <th>Desde</th>
                                    <th>Hasta</th>
                                    <th>Dias de vacacion</th>
                                    <th>Cas</th>                              
                                    <th></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.col -->
        </div>

     
         <%--MODAL  --%>
            <div id="form">
                <div class="modal fade" id="modal-nuevo" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-mg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Registro de Vacaciones</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Desde:</label>
                                                <div id="datepicker" class="input-group date" data-date-format="dd/mm/yyyy">
                                                    <input id="indate1" class="form-control" type="text" readonly />
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Hasta:</label>
                                                 <div id="datepicker1" class="input-group date" data-date-format="dd/mm/yyyy">
                                                    <input id="indate2" class="form-control" type="text" readonly />
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                             <label class="inputin">
                                                <input class="inputin__fieldin" id="dia" name="dia" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese Dias" maxlength="2" autocomplete="off" />
                                                <span class="inputin__labelin">Dias</span>
                                            </label>
                                        </article>
                                    </div>
                                  <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="cas" name="cas" type="text" placeholder=" " data-validate="required" data-validate-message="C.A.S." maxlength="200" autocomplete="off" />
                                                <span class="inputin__labelin">C.A.S.</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                            <input type="submit" value="Guardar" id="GuardarCV" class="btn btn-primary example-the-1" />
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
            </div>



          <%--MODAL  ANULAR SALIDA--%>
        <div id="Div1">
            <div class="modal fade" id="modal-anular" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-mg">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Anular Permiso/Salida</h4>
                        </div>
                        <div class="modal-body">
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Nombre y Apellido:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="nombrea"></label>
                            </p>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Fecha Salida:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="fsalidaa"></label>
                            </p>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Motivo:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="motivoa"></label>
                            </p>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Marcacion:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="marcaciona"></label>
                            </p>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Hora Salida:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="salidaa"></label>
                            </p>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Hora Retorno:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="retornoa"></label>
                            </p>
                        </div>
                    </div>
                    <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                        <input type="submit" value="Anular" id="GuardaAnular" class="btn btn-primary example-the-1" />
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
        </div>
    </section>
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
   
        <script src="SimpleAjaxUploader.js"></script>
        <!-- Script Personalizado -->
        <script src="js/JSCronogramaVacacion.js"></script>
      <script>
          var idusuariopersonal
          $(document).ready(function () {
              idusuariopersonal = '<%= Session("idusuario").ToString%>';
          });

          $(function () {
              $("#datepicker").datepicker({
                  autoclose: true,
                  todayHighlight: true,
                  todayBtn: "linked",
              }).datepicker('update', new Date());

              $("#datepicker1").datepicker({
                  autoclose: true,
                  todayHighlight: true,
                  todayBtn: "linked",                  
              }).datepicker('update', new Date());
          });        
    </script>
</asp:Content>

