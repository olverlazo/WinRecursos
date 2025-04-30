<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Contratos.aspx.vb" Inherits="Contratos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form enctype="multipart/form-data" id="formuploadajax" method="post" Runat="Server">

        <section class="content-header">
            <h1>REGISTRO DE CONTRATOS Y CARGOS      
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

                            <div class="box-body info-box bg-aqua">
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
                                    <label id="bloque1" class="box-title"></label>
                                </dd>
                                <dd>
                                    <label id="cargo1" class="box-title"></label>
                                </dd>
                            </dl>
                        </div>
                            <a class="btn btn-primary margin-bottom " id="NuevoContrato"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Nuevo Contrato</a>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="TableContratosPersona" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>F. Financiamiento</th>
                                        <th>Categoria</th>
                                        <th>Tipo Contrato</th>
                                        <th>Item / Memo / Contrato</th>
                                        <th>Fecha Ingreso</th>
                                        <th>Fecha Retiro</th>
                                        <th>Contrato</th>
                                        <th>Estado</th>
                                        <th></th>
                                      </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.col -->
            </div>

            <%--MODAL  CONTRATO--%>



            <div id="form">
                <div class="modal fade" id="modal-nuevo" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-mg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Contratos de Personal</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="categoria1" name="categoria1" class="inputin__fieldin" data-validate="required" data-validate-message="Elegir Categoria">
                                                    <option></option>
                                                </select>
                                                <span class="inputin__labelin">Categoria</span>
                                            </label>
                                        </article>
                                    </div>
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="fuente" name="fuente" class="inputin__fieldin" data-validate="required" data-validate-message="Elegir Fuente de Financiamiento">
                                                    <option></option>
                                                </select>
                                                <span class="inputin__labelin">Fuente de Financiamiento</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="tpersonal" name="tpersonal" class="inputin__fieldin" data-validate="required" data-validate-message="Elegir Tipo de Contrato">
                                                    <option></option>
                                                </select>
                                                <span class="inputin__labelin">Tipo de Contrato</span>
                                            </label>
                                        </article>
                                    </div>
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="item" name="item" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese informacion" maxlength="12" autocomplete="off" />
                                                <span class="inputin__labelin">Item/Memorandum/Contrato</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="ch" name="ch" class="inputin__fieldin" data-validate="required" data-validate-message="Elija carga horaria">
                                                    <option value="">--Seleccionar--</option>
                                                    <option value="1">Medio Tiempo</option>
                                                    <option value="2">Tiempo completo</option>

                                                </select>
                                                <span class="inputin__labelin">Carga Horaria</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="inicontrato" type="text" data-validate="required" data-validate-message="Ingrese Fecha de Inicio de contrato" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="date" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de nacimiento" autocomplete="off" />
                                                <span class="inputin__labelin">Inicio de Contrato</span>
                                            </label>
                                        </article>
                                    </div>
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="fincontrato" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask1 placeholder=" " data-validate="date" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de nacimiento" autocomplete="off" />
                                                <span class="inputin__labelin">Fin de Contrato</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <div class="form-group">
                                                <label for="exampleInputFile">Cargar Archivo en formato .Pdf</label>
                                                <br />
                                                <input type="file" id="archivo1" name="archivo1" data-validate="required" data-validate-message="Elija Archivo" accept="application/pdf" onchange="return validarExt0()" />
                                              <%--  <div class="timeline-footer">
                                                    <input type="file" name="archivo1" id="archivo1" class="inputfile inputfile-1" data-validate="required" data-validate-message="Elija archivo" onchange="return validarExt0();" />
                                                    <label for="file0">
                                                        <svg xmlns="http://www.w3.org/2000/svg" class="iborrainputfile" width="20" height="17" viewBox="0 0 20 17">
                                                            <path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
                                                        <span class="iborrainputfile">Seleccionar archivo</span>
                                                    </label>
                                                </div>--%>
                                                <br />
                                                <div id="visorArchivo">
                                                    <!--Aqui se desplegará el fichero-->
                                                </div>
                                            </div>
                                        </article>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                            <%--  <button class="btn btn-primary example-the-1" id="btnGuardar" type="button">Guardar</button>--%>
                            <input type="submit" value="Guardar" id="btnGuardar1" class="btn btn-primary example-the-1" />
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                         <asp:Button ID="Button1" runat="server" Text="Button" Visible="False" />
                        </div>
                       
                    </div>
                    <!-- /.modal-content -->
                </div>
            </div>


            <%--MODAL  FINALIZAR CONTRATO--%>
            <div id="formAnular">
                <div class="modal fade" id="modal-anular" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-mg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Finalizar Contrato</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="motivo" name="motivo" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese motivo de retiro" maxlength="240" autocomplete="off" />
                                                <span class="inputin__labelin">Motivo de anulacion</span>
                                            </label>
                                        </article>
                                    </div>
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="FechaFin" type="text" data-validate="required" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="date" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de retiro" autocomplete="off" />
                                                <span class="inputin__labelin">Fin de Contrato</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                            <%--  <button class="btn btn-primary example-the-1" id="btnGuardar" type="button">Guardar</button>--%>
                            <input type="submit" value="Guardar" id="GuardaFin" class="btn btn-primary example-the-1" />
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
            </div>


            <%--MODAL  CARGOS--%>
            <div id="formCargo">

                <div class="modal fade" id="modal-cargo" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00A65A; font-weight: bold;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Cargos de Personal</h4>
                            </div>

                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <article class="l-design-widhtin">
                                            <dl id="Dl1" class="dl-horizontal">
                                                <dt class="box-title">Fuente Financiamiento:</dt>
                                                <dd>
                                                    <label id="Label1" class="box-title"></label>
                                                </dd>
                                                <dt class="box-title">Categoria:</dt>
                                                <dd>
                                                    <label id="Label2" class="box-title"></label>
                                                </dd>
                                                <dt class="box-title">Tipo Contrato:</dt>
                                                <dd>
                                                    <label id="Label3" class="box-title"></label>
                                                </dd>
                                                <dt class="box-title">Inicio de contrato:</dt>
                                                <dd>
                                                    <label id="Label4" class="box-title"></label>
                                                </dd>
                                                <dt class="box-title">Fin de Contrato:</dt>
                                                <dd>
                                                    <label id="Label5" class="box-title"></label>
                                                </dd>
                                            </dl>
                                        </article>
                                    </div>
                                </div>
                      
                                <div class="box box-success">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <article class="l-design-widhtin">
                                                <label class="inputin">
                                                    <select id="bloque" name="bloque" class="inputin__fieldin" data-validate="required" data-validate-message="Elija bloque">
                                                    </select>
                                                    <span class="inputin__labelin">Bloque</span>
                                                </label>
                                            </article>
                                        </div>
                                        <div class="col-md-6">
                                            <article class="l-design-widhtin">
                                                <label class="inputin">
                                                    <select id="unidad" name="unidad" class="inputin__fieldin" data-validate="required" data-validate-message="Elija Unidad/Servicio">
                                                    </select>
                                                    <%--<span class="inputin__labelin">Unidad/Servicio</span>--%>
                                                </label>
                                            </article>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <article class="l-design-widhtin">
                                                <label class="inputin">
                                                    <input class="inputin__fieldin" id="cargo" name="cargo" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese cargo" maxlength="150" autocomplete="off" />
                                                    <span class="inputin__labelin">Cargo</span>
                                                </label>
                                            </article>
                                        </div>

                                         <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <div class="form-group">
                                                <%--<label for="exampleInputFile">Cargar Archivo en formato .Pdf</label>--%>
                                                <input type="file" id="archivo2" name="archivo2" data-validate="required" data-validate-message="Elija Archivo" accept="application/pdf" onchange="return validarExt1()" />
                                            </div>
                                        </article>
                                    </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <article class="l-design-widhtin">
                                                <label class="inputin">
                                                    <input class="inputin__fieldin" id="finicargo" type="text" data-validate="required" data-validate-message="Ingrese Fecha de Inicio de contrato" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="date" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de nacimiento" autocomplete="off" />
                                                    <span class="inputin__labelin">Inicio de Cargo </span>
                                                </label>
                                            </article>
                                        </div>
                                        <div class="col-md-6">
                                            <article class="l-design-widhtin">
                                                <label class="inputin">
                                                    <input class="inputin__fieldin" id="ffincargo" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="date" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de nacimiento" autocomplete="off" />
                                                    <span class="inputin__labelin">Fin de Cargo </span>
                                                </label>
                                            </article>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <article class="l-design-widhtin">
                                                <a class="btn btn-primary margin-bottom " id="GuardaCargo"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Agregar Cargo</a>
                                                <%--<input type="submit" value="GuardaCargo" id="Submit2" class="btn btn-primary example-the-1" />--%>
                                            </article>
                                        </div>
                                    </div>
                                </div>
                                <table id="TableCargo" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>Bloque</th>
                                            <th>Servicio</th>
                                            <th>Cargo</th>
                                            <th>Fecha Inicio</th>
                                            <th>Fecha Final</th>
                                            <th>Documento</th>
                                            <th>Estado</th> 
                                            <th></th>                                            
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <div class="modal-footer" style="background-color: #00A65A; font-weight: bold;">
                                <%--   <input type="submit" value="GCargo" id="Submit1" class="btn btn-primary example-the-1" />--%>
                                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                </div>
            </div>



            <%--MODAL  FINALIZAR CARGO--%>
            <div id="formFinCargo">
                <div class="modal fade" id="modal-fin-cargo" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-mg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Finalizar Cargo</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="fechafincargo" type="text" data-validate="required" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de fin de cargo" autocomplete="off" />
                                                <span class="inputin__labelin">Fin de Cargo</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                            <button class="btn btn-primary example-the-1" id="GuardarFinCargo" type="button">Guardar</button>
                            <%--<input type="submit" value="Guardar" id="GuardarFinCargo" class="btn btn-primary example-the-1" />--%>

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
        <script src="js/JSContratos.js"></script>
    </form>
    <div id="mensaje"></div>
    <div class="row" style="padding-top: 10px;">
        <div class="col-xs-12">
            <div id="msgBox" style="display: none;" class="alert alert-success"></div>
        </div>
    </div>
      <script type="text/javascript">


          'use strict';

          ; (function (document, window, index) {
              var inputs = document.querySelectorAll('.inputfile');
              Array.prototype.forEach.call(inputs, function (input) {
                  var label = input.nextElementSibling,
                      labelVal = label.innerHTML;

                  input.addEventListener('change', function (e) {
                      var fileName = '';
                      if (this.files && this.files.length > 1)
                          fileName = (this.getAttribute('data-multiple-caption') || '').replace('{count}', this.files.length);
                      else
                          fileName = e.target.value.split('\\').pop();

                      if (fileName)
                          label.querySelector('span').innerHTML = fileName;
                      else
                          label.innerHTML = labelVal;
                  });
              });
          }(document, window, 0));



          var usuariopersonal
          $(document).ready(function () {          
              usuariopersonal = '<%= Session("idusuario").ToString%>';
          });


          



          function validarExt0() {
              var archivocar = document.getElementById('archivo1');
              var archivoRuta = archivocar.value;
              //var extPermitidas = /(.jpeg|.jpg|.png|.gif)$/i;
              var extPermitidas = /(.pdf)$/i;
              var tam = document.getElementById("archivo1").files[0].size;
              //console.log(tam)
              if (tam > 1000000) {
                  //$.alert("- SU ARCHIVO PESA " + tam / 1024 + "KB." + "\n" + '- EL ARCHIVO NO PUEDE PESAR MAS DE 1 Mb');
                  Swal.fire({
                      icon: "error",
                      title: "Error",
                      text: "- SU ARCHIVO PESA " + (Math.round(tam * 100 / 1048576) / 100).toString() + "Mb." + "\n" + '- EL ARCHIVO NO PUEDE PESAR MAS DE 1 Mb',
                  });
                  document.getElementById("archivo1").value = "";
                  archivocar.value = '';
                  return false;
              } else {
                  if (!extPermitidas.exec(archivoRuta)) {
                      //$.alert('- DEBE SELECIONAR UN ARCHIVO CON EXTENCION .Pdf');
                      Swal.fire({
                          icon: "error",
                          title: "Error",
                          text: "SELECIONE UN DOCUMENTO CON EXTENCION .Pdf",
                      });
                      archivocar.value = '';
                      return false;
                  } else {
                      //PRevio del PDF
                      if (archivocar.files && archivocar.files[0]) {
                          var visor = new FileReader();
                          visor.onload = function (e) {
                              document.getElementById('visorArchivo').innerHTML =
                              '<embed src="' + e.target.result + '" width="100" height="150" />';
                          };
                          visor.readAsDataURL(archivocar.files[0]);
                      }
                  }
              }
          }


          function validarExt1() {
              var archivocar = document.getElementById('archivo2');
              var archivoRuta = archivocar.value;
              //var extPermitidas = /(.jpeg|.jpg|.png|.gif)$/i;
              var extPermitidas = /(.pdf)$/i;
              var tam = document.getElementById("archivo2").files[0].size;
              //console.log(tam)
              if (tam > 1000000) {
                  //$.alert("- SU ARCHIVO PESA " + tam / 1024 + "KB." + "\n" + '- EL ARCHIVO NO PUEDE PESAR MAS DE 1 Mb');
                  Swal.fire({
                      icon: "error",
                      title: "Error",
                      text: "- SU ARCHIVO PESA " + (Math.round(tam * 100 / 1048576) / 100).toString() + "KB." + "\n" + '- EL ARCHIVO NO PUEDE PESAR MAS DE 1 Mb',
                  });
                  document.getElementById("archivo2").value = "";
                  archivocar.value = '';
                  return false;
              } else {
                  if (!extPermitidas.exec(archivoRuta)) {
                      //$.alert('- DEBE SELECIONAR UN ARCHIVO CON EXTENCION .Pdf');
                      Swal.fire({
                          icon: "error",
                          title: "Error",
                          text: "SELECIONE UN DOCUMENTO CON EXTENCION .Pdf",
                      });
                      archivocar.value = '';
                      return false;
                  } 
              }
          }
    </script>

     

</asp:Content>

