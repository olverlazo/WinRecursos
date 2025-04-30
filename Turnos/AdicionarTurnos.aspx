<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="AdicionarTurnos.aspx.vb" Inherits="Turnos_AdicionarTurnos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <section class="content-header">
        <h1>TURNOS         
        </h1>
    </section>
      <link href="/css/StyleSheetImprimir.css" rel="stylesheet" />

     <div id="Div4"  style="padding: 10px; margin: 2px 3px 2px 3px"" >
                        <div id="HTMLPdf" style="padding: 1px 50px 1px 50px; margin: 2px 3px 2px 3px"  >
                            <table style="width: 100%;">
                                <tr style="border-bottom-style: solid; border-bottom-width: 1px;">
                                    <td style="padding: 1px; width: 20%; border-bottom-style: solid; border-bottom-width: 1px;">
                                        <img src="../imagenes/hg.jpg" style="margin: 1px; width: 40%" />
                                    </td>
                                    <td style="width: 60%; border-bottom-style: solid; border-bottom-width: 1px;">
                                        <p style='margin: 1px; text-align: center;'>
                                            <b><span style='font-size: 14pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt; text-align: center;'>
                                                <br>
                                                HOSPITAL GENERAL SAN JUAN
                                                 <br>
                                                DE DIOS - ORURO</span></b>
                                        </p>
                                    </td>
                                    <td style="width: 20%; border-bottom-style: solid; border-bottom-width: 1px;">&nbsp;
                        <p style='margin: 1px; text-align: center;'>
                            <b><span style='font-size: 9pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt; text-align: center;'>Fecha: </span></b>
                            <br>
                            <b><span style='font-size: 9pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt; text-align: center;'>Hora: </span></b>
                            <br>
                            <b><span style='font-size: 9pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt; text-align: center;'>Usuario: </span></b>
                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <dl id="Dl1" class="dl-horizontalpdf">
                                            <dt>NOMBRE:</dt>
                                            <dd>
                                                <label id="nombresPDF"></label>
                                            </dd>
                                            <dt class="box-title">C.I.:</dt>
                                            <dd>
                                                <label id="ciPDF"></label>
                                            </dd>
                                            <dt class="box-title">CONTRATO:</dt>
                                            <dd>
                                                <label id="contratoPDF"></label>
                                            </dd>
                                            <dd>
                                                <label id="categoriaPDF"></label>
                                            </dd>
                                            <dd>
                                                <label id="ffPDF"></label>
                                            </dd>
                                            <dt class="box-title">CARGO:</dt>
                                            <dd>
                                                <label id="bloquePDF"></label>
                                            </dd>
                                            <dd>
                                                <label id="cargoPDF"></label>
                                            </dd>
                                        </dl>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>


        
            
            <div id="Div" class="datagrid">
                <table id="TablePDF">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Turno</th>
                            <th>Tipo</th>
                            <th>Fecha</th>
                            <th>Ingreso</th>
                            <th>Salida</th>
                            <th>Ingreso</th>
                            <th>Salida</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div> 
                    </div>


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
                        <div class="box-body info-box bg-gray">
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
 
                      <div class="col-md-4">                        
                                <select id="meano" name="Smes"  class="inputin__fieldin"  >
                                    <option value="0">--Seleccionar--</option>
                                    <option value="1">ENERO</option>
                                    <option value="2">FEBRERO</option>
                                    <option value="3">MARZO</option>
                                    <option value="4">ABRIL</option>
                                    <option value="5">MAYO</option>
                                    <option value="6">JUNIO</option>
                                    <option value="7">JULIO</option>
                                    <option value="8">AGOSTO</option>
                                    <option value="9">SEPTIEMBRE</option>
                                    <option value="10">OCTUBRE</option>
                                    <option value="11">NOVIEMBRE</option>
                                    <option value="12">DICIEMBRE</option>
                                </select>                         
                        </div>

                        <div class="col-md-4">
                            <a class="btn btn-primary margin-bottom " id="NuevoTurno" ><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Nuevo Registro</a>
                            <a class="btn btn-primary margin-bottom " id="imprimir" ><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Imprimir</a>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="TableListaTurno" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Turno</th>
                                    <th>Tipo</th>
                                    <th>Fecha</th>
                                    <th>Ingreso</th>
                                    <th>Salida</th>
                                    <th>Ingreso</th>
                                    <th>Salida</th>                                  
                                    <th></th>
                                </tr>
                            </thead>
                        </table>
                    </div>


                


                </div>
            </div>
            <!-- /.col -->
        </div>

    
         <%--MODAL  adicionar licencia--%>
        <div id="form">
            <div id="Div1">
                <div class="modal fade" id="modal-nuevo" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-mg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Turnos de Personal</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="tipoturno" name="tipoturno" class="inputin__fieldin" data-validate="required" data-validate-message="Turno">
                                                    <option></option>
                                                </select>
                                                <span class="inputin__labelin">Tipo Turno</span>
                                            </label>
                                        </article>
                                    </div>

                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="horario" name="horario" class="inputin__fieldin" data-validate="required" data-validate-message="horario">
                                                    <option></option>
                                                </select>
                                                <span class="inputin__labelin">Horario</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6" id="hora1">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Hora Ingreso:</label>
                                                <div class="input-group">
                                                    <input id="ihora1" type="text" class="form-control timepicker" data-validate="required">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-clock-o"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </article>
                                    </div>

                                    <div class="col-md-6" id="hora2">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Hora Salida:</label>
                                                <div class="input-group">
                                                    <input id="ihora2" type="text" class="form-control timepicker">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-clock-o"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6" id="hora3">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Hora Ingreso:</label>
                                                <div class="input-group">
                                                    <input id="ihora3" type="text" class="form-control timepicker">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-clock-o"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </article>
                                    </div>

                                    <div class="col-md-6" id="hora4">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Hora Salida:</label>
                                                <div class="input-group">
                                                    <input id="ihora4" type="text" class="form-control timepicker">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-clock-o"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6" id="gm">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label></label>
                                                <div id="Div2">
                                                    <label>
                                                        Generar Mes:
                                                        <input id="gmes" type="checkbox" class="minimal" />
                                                    </label>
                                                </div>
                                            </label>
                                        </article>
                                    </div>


                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Fecha:</label>
                                                <div id="datepicker1" class="input-group date" data-date-format="dd/mm/yyyy">
                                                    <input id="indate1" class="form-control" type="text">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                            <input type="submit" value="Guardar" id="GuardarDatos" class="btn btn-primary example-the-1" />
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
            </div>

        </div>

        <div id="Div3">
            <div class="modal fade" id="modal-PDF" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Rol de Turno</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                      <embed id="vistaPrevia" type="application/pdf" width="870" height="500" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
        </div>
  


    </section>
            <!-- jQuery 3 -->

         <script src="/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Select2 -->
        <script src="/bower_components/select2/dist/js/select2.full.min.js"></script>
        <!-- InputMask -->
        <script src="/plugins/input-mask/jquery.inputmask.js"></script>
        <script src="/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="/plugins/input-mask/jquery.inputmask.extensions.js"></script>
        <!-- date-range-picker -->
     <script src="/bower_components/moment/min/jmoment.js"></script>
        <script src="/bower_components/moment/min/moment.min.js"></script>
   
        <script src="/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap datepicker -->
        <script src="/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
        <!-- bootstrap time picker -->
        <script src="/plugins/timepicker/bootstrap-timepicker.min.js"></script>
        <!-- SlimScroll -->
        <script src="/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- iCheck 1.0.1 -->
        <script src="/plugins/iCheck/icheck.min.js"></script>
        <script src="/js/html2pdf.bundle.min.js"></script>​​​ 

          <script src="/SimpleAjaxUploader.js"></script>
         <!-- Script Personalizado -->
        <script src="js/JSAdTurno.js"></script>
         <script src="/pruebamenu.js"></script>

    <script >
        document.getElementById("Div4").style.display = 'none';

      
   


        function generarPDF() {
            //html2pdf().from(document.body).save('miDocumento.pdf')
            var elemento = document.getElementById('HTMLPdf');
            var opt = {
                margin: 1,
                filename: 'RolTurno.pdf',
                image: { type: 'pdf', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'mm', format: 'letter', orientation: 'portrait' }
            };
            //html2pdf().set(opt).from(elemento).save();
            html2pdf().set(opt).from(elemento).toPdf().get('pdf').then(
                function (pdf) {
                    //var newWindow = window.open(pdf.output('bloburl'), '_blank');
                    document.querySelector('#vistaPrevia').setAttribute('src', pdf.output('bloburl'));
                    //console.log(pdf.output('bloburl'))
                    //if (newWindow) {
                    //    newWindow.onload = () =>{
                    //        newWindow.print()
                    //    }
                    //}
                }
                  )
        }




        var idusuariopersonal;
        var mes;
        $(document).ready(function () {
            idusuariopersonal = '<%= Session("idusuario").ToString%>';
          });

          $(function () {
              $("#datepicker1").datepicker({
                  autoclose: true,
                  todayHighlight: true,
                  todayBtn: "linked",
              }).datepicker('update', new Date());        
          });

          //Timepicker
          $('.timepicker').timepicker({
              showMeridian: false,
              showInputs: false,
              use24hours: true,
              format: 'HH:mm:ss'
          })

          //iCheck for checkbox and radio inputs
          $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
              checkboxClass: 'icheckbox_minimal-blue',
              radioClass: 'iradio_minimal-blue'
          })

          //obtiene los valores de la fila seleccionada       
          $(document).on('click', '#imprimir', function () {           
              //var select = document.getElementById("meano");   
              //var options=document.getElementsByTagName("option");
              //window.open('/Turnos/RolTurno.aspx?ci='+carnet+'&idusuario='+idpersona1+'&mes='+options[select.value].innerHTML+'&nombre='+nombre, '_blank');  
              //get_ListaTurnoPDF()
              generarPDF();
              $("#modal-PDF").modal("show");
          });
    </script>
           
</asp:Content>

