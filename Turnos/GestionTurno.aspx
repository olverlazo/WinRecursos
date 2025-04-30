<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="GestionTurno.aspx.vb" Inherits="Turnos_GestionTurno" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content-header">
      <h1>
        Asignacion de Turnos
      </h1>
  
    </section>

     <div class="pad margin no-print" id="cabezal">

         <div class="callout callout-info" style="margin-bottom: 0!important;">
             <div class="row">
                 <div class="col-md-3 col-sm-6 col-xs-12">
                      <div class="box-body">
                         <ul class="nav nav-pills nav-stacked">
                             <li>
                                 <div class="input-group input-group-sm">
                                     <%--<input type="text" class="form-control" placeholder="Nombre/Apellido" id="Text1" />--%>
                                     <span class="input-group-btn">
                                         <%--<button type="button" class="btn btn-block btn-primary" data-toggle="modal" data-target="#modal-NuevoKardex" id="Nuevo"><i class="fa fa-plus-circle"></i> Nuevo Registro</button>--%>
                                          <button type="button" class="btn btn-block btn-primary" id="Nuevo">
                                              <span class="fa fa-plus-circle"></span>      Nuevo Registro
                                          </button>
                                     </span>
                                 </div>
                             </li>
                            Nuevo registro de personal
                         </ul> 
                     </div>
                     </div>
                 <!-- /.col -->
                 <div class="col-md-3 col-sm-6 col-xs-12">
                     <div class="box-body">
                         <ul class="nav nav-pills nav-stacked">
                             <li>
                                 <div class="input-group input-group-sm">
                                     
                                     <span class="input-group-btn">
                                         <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                     </span><input type="text" class="form-control" placeholder="Nombre/Apellido" id="txtvalor" />
                                 </div>
                             </li>
                             Ingrese Nombre / Apellidos / C.I.
                         </ul>
                     </div>
                 </div>
               
             </div>
         </div>
    </div>
    <div id="Tabla">
        <section class="invoice">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Lista de Personal</h3>
                        </div>

                        <div class="box-body table-responsive no-padding">
                            <table id="TablePersona" class="table table-bordered table-hover cell-border">
                                <thead>
                                    <tr>
                                        <th>Nombre y Apellidos</th>
                                        <th>C.I.</th>
                                        <th>Categoria</th>
                                        <th>Tipo Contrato</th>
                                        <th>F. Financiamiento</th>
                                        <th>Cargo</th>
                                        <th>Bloque</th>
                                        <th>Servicio</th>
                                        <th></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    


    <div id="formpie" class="pad margin no-print" style="display: none">
        <%--<div class="modal fade"  data-keyboard="false">--%>
     <%--       <div class="modal-dialog modal-lg">--%>
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Nuevo Personal</h4>
                    </div>
                    <div class="modal-body">
                         <label class="inputin" id="idpersonal">0</label>
                        <div class="row">
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <%--<input class="inputin__fieldin" id="txtnombres" data-validate="required" data-validate-message="Ingrese nombre" type="text" maxlength="200" placeholder=" "  />--%>
                                        <input class="inputin__fieldin" type="text" id="txtnombres" data-validate="required" placeholder=" " maxlength="200" data-validate-message="Ingrese Nombres" autocomplete="off" />
                                        <span class="inputin__labelin">Nombres</span>
                                    </label>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="txtapaterno" type="text" maxlength="200" data-validate="required" data-validate-message="Ingrese Primer Apellido" placeholder=" " autocomplete="off" />
                                        <span class="inputin__labelin">Apellido Paterno</span>
                                    </label>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="txtamaterno" type="text" maxlength="200" data-validate="required" data-validate-message="Ingrese Segundo Apellido" placeholder=" " autocomplete="off" />
                                        <span class="inputin__labelin">Apellido Materno</span>
                                    </label>
                                </article>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="ci" name="texto" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese Numero de Documento" maxlength="9" autocomplete="off" />
                                        <span class="inputin__labelin">Número de documento</span>
                                    </label>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="complemento" type="text" maxlength="3" placeholder=" " autocomplete="off" />
                                        <span class="inputin__labelin">Complemento</span>
                                    </label>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <%--<input class="inputin__fieldin" id="Text3" type="text" placeholder=" " required />--%>
                                        <select id="ciudad" name="ciudad" class="inputin__fieldin" data-validate="required" data-validate-message="Elija una ciudad">
                                            <option value="">--Seleccionar--</option>
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
                                        <span class="inputin__labelin">Expedido en</span>
                                    </label>
                                </article>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="nacimiento" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="date" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de nacimiento" autocomplete="off" />
                                        <span class="inputin__labelin">Fecha de nacimiento</span>
                                    </label>

                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <div class="form-group">
                                        <label style="color: #3f4040">Genero&nbsp;  &nbsp; </label>
                                        <label style="color: #3f4040">
                                            <input type="radio" name="genero" id="hombre" class="flat-red" value="HOMBRE" data-validate="required" data-validate-message="Elija genero" />
                                            Hombre &nbsp;  &nbsp;             
                                        </label>
                                        <label style="color: #3f4040">
                                            <input type="radio" name="genero" id="mujer" class="flat-red" value="MUJER" data-validate="required" data-validate-message="Elija genero" />
                                            Mujer               
                                        </label>
                                    </div>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="direccion" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese Dirección" autocomplete="off" />
                                        <span class="inputin__labelin">Dirección</span>
                                    </label>
                                </article>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <%--<input class="inputin__fieldin" id="telefono" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese Numero de cel y/o telefono" autocomplete="off" />--%>
                                        <input class="inputin__fieldin" id="telefono" name="texto" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese Numero de cel y/o telefono" maxlength="8" autocomplete="off" />
                                        <span class="inputin__labelin">Telefono</span>
                                    </label>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="email" type="email" placeholder=" " data-validate="required" data-validate-message="Ingrese correo electronico" autocomplete="off" />
                                        <span class="inputin__labelin">Correo electronico</span>
                                    </label>
                                </article>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <%--<input class="inputin__fieldin" id="Text3" type="text"  placeholder=" " required />--%>
                                        <select id="seguros" name="seguros" class="inputin__fieldin">
                                            <option></option>
                                        </select>
                                        <span class="inputin__labelin">Caja de seguro</span>
                                    </label>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="matriculas" type="text" placeholder=" " autocomplete="off" />
                                        <span class="inputin__labelin">Matricula</span>
                                    </label>
                                </article>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <%--<input class="inputin__fieldin" id="AFP" type="text"  placeholder=" " required />--%>
                                        <select id="afp" name="afp" class="inputin__fieldin">
                                            <option value="">--Seleccionar--</option>
                                            <option>PREVISION BOLIVIA</option>
                                            <option>FUTURO BOLIVIA</option>
                                        </select>
                                        <span class="inputin__labelin">A.F.P.</span>
                                    </label>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="NUA" type="text" placeholder=" " autocomplete="off" />
                                        <span class="inputin__labelin">NUA/CUA</span>
                                    </label>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="CAS" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask1 placeholder=" " autocomplete="off" />

                                        <span class="inputin__labelin">C.A.S.</span>
                                    </label>
                                </article>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <select id="estudio" name="estudio" class="inputin__fieldin" data-validate="required" data-validate-message="Elija nivel de estudio">
                                            <option></option>
                                        </select>
                                        <span class="inputin__labelin">Nivel de estudio</span>
                                    </label>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="profesion" type="text" placeholder=" " autocomplete="off" />
                                        <span class="inputin__labelin">Profecion</span>
                                    </label>
                                </article>
                            </div>
                            <div class="col-md-4">
                                <article class="l-design-widhtin">
                                    <label class="inputin">
                                        <input class="inputin__fieldin" id="matricula" type="text" data-mask placeholder=" " autocomplete="off" />
                                        <span class="inputin__labelin">Matricula Profecional</span>
                                    </label>
                                </article>
                            </div>
                        </div>

                    </div>

                    <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                        <button class="btn btn-primary example-the-1" id="btnGuardar" type="button">Guardar</button>
                        <button type="button" id="cerrar" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            <%--</div>--%>
        <%--</div>--%>
    </div>


        <script src="/bower_components/jquery/dist/jquery.min.js"></script>
        <!-- Select2 -->
        <script src="/bower_components/select2/dist/js/select2.full.min.js"></script>
        <!-- InputMask -->
        <script src="/plugins/input-mask/jquery.inputmask.js"></script>
        <script src="/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="/plugins/input-mask/jquery.inputmask.extensions.js"></script>
        <!-- date-range-picker -->
        <script src="/bower_components/moment/min/moment.min.js"></script>
        <script src="/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap datepicker -->
        <script src="/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
        <!-- bootstrap time picker -->
        <script src="/plugins/timepicker/bootstrap-timepicker.min.js"></script>
        <!-- SlimScroll -->
        <script src="/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- SlimScroll -->
        <script src="/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- iCheck 1.0.1 -->
        <script src="/plugins/iCheck/icheck.min.js"></script>
   
        <script src="/SimpleAjaxUploader.js"></script>
         <!-- Script Personalizado -->
     <script src="js/JSTurnos.js"></script>



      <script>

          var usuariopersonal
          $(document).ready(function () {

              idusuariopersonal = '<%= Session("idusuario").ToString%>';

          });


          $(function () {
              $("#datepicker1").datepicker({
                  autoclose: true,
                  todayHighlight: true,
                  todayBtn: "linked",
              }).datepicker('update', new Date());

              //$("#datepicker2").datepicker({
              //    autoclose: true,
              //    todayHighlight: true,
              //    todayBtn: "linked",
              //    //title: "Geeksforgeeks datepicker"
              //}).datepicker('update', new Date());
          });

          //Timepicker
          $('.timepicker').timepicker({
              showMeridian: false,
              showInputs: false,
              use24hours: true,
              format: 'HH:mm'
          })
    </script>
</asp:Content>

