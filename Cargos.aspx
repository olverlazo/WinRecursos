<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Cargos.aspx.vb" Inherits="Cargos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <section class="content-header">
      <h1>
          REGISTRO DE CARGOS          
      </h1>

    </section>

      <section class="content">
    <div class="row">
         <div class="col-md-4">
                 <%--<a class="btn btn-primary btn-block margin-bottom "   data-toggle="modal" data-target="#modal-warning" id="Nuevo" ></i>Nuevo Contrato</a>--%>


             <button type="button" class="btn btn-primary btn-block margin-bottom"  id="NuevoContrato">
                                              <span class="fa fa-plus-circle"></span>      Nuevo Registro
                                          </button>

              
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">&nbsp;Buscar</h3>
                         <input type="text" class="form-control" placeholder="Nombre/Apellido/C.I." id="txtvalor" autocomplete="off"/>
                    </div>
                    <div class="box-body" >
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
                    <!-- /.box-body -->
                </div>
                <!-- /. box -->

                <!-- /.box -->
            </div>
        <!-- /.col -->
         <div class="col-md-8">
             
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <%--<h3 class="box-title">Personal</h3>--%>
                        <label id="ci" class="box-title">0</label>
                        <label id="nombres" class="box-title"></label>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <table id="TableContratosPersona" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th>contrato</th>
                                    <th>Bloque</th>
                                    <th>Servicio</th>
                                    <th>Cargo</th>                                    
                                    <th>Fecha Inicio</th>
                                    <th>Fecha Fin</th>
                                    <th></th>
                                </tr>

                            </thead>
                             <tbody class="table-body">
                            <tr class="cell-1" data-toggle="collapse" data-target="#demo">
                                <td class="text-center">1</td>
                                <td>#SO-13487</td>
                                <td>Gasper Antunes</td>
                                <td><span class="badge badge-danger">Fullfilled</span></td>
                                <td>$2674.00</td>
                                <td>Today</td>
                                <td class="table-elipse" data-toggle="collapse" data-target="#demo"><i class="fa fa-ellipsis-h text-black-50"></i></td>
                            </tr>
                            <tr id="demo" class="collapse cell-1 row-child">
                                <td class="text-center" colspan="1"><i class="fa fa-angle-up"></i></td>
                                <td colspan="1">Product&nbsp;</td>
                                <td colspan="3">iphone SX with ratina display</td>
                                <td colspan="1">QTY</td>
                                <td colspan="2">2</td>
                            </tr>
</tbody>
                        </table>
                    </div>
                </div>
             </div>
        <!-- /.col -->
      </div>

       <%--MODAL  CONTRATO--%>
          
          <div id="form">

              <div class="modal modal-info fade" id="modal-nuevo" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                  <div class="modal-dialog modal-mg" role="document">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span></button>
                              <h4 class="modal-title">Cargos Asignados</h4>
                               
                          </div>
                          <div class="modal-body">

                               <div class="row">
                                        
                          <div class="box-body" >
                           <table id="Table1" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th>F. Financiamiento</th>
                                    <th>Categoria</th>
                                    <th>T Contrato</th>
                                    <th>Item</th>
                                    <th>Fecha Ingreso</th>
                                    <th>Fecha Retiro</th>
                                    <th></th>
                                </tr>
                            </thead>

                                
                        </table>
                    </div>
                    <!-- /.box-body -->
              

                              </div>

                              <div class="row">
                               
                                  <div class="col-md-6">
                                      <article class="l-design-widhtin">
                                          <label class="inputin">
                                              <%--<input class="inputin__fieldin" id="Text3" type="text"  placeholder=" " required />--%>
                                              <select id="bloque" name="bloque" class="inputin__fieldin"  data-validate="required" data-validate-message="Elegir Bloque">
                                                  <option></option>
                                              </select>
                                              <span class="inputin__labelin">Bloque</span>
                                          </label>
                                      </article>
                                  </div>
                                  <div class="col-md-6">
                                      <article class="l-design-widhtin">
                                          <label class="inputin">
                                              <%--<input class="inputin__fieldin" id="Text3" type="text"  placeholder=" " required />--%>
                                              <select id="unidad" name="unidad" class="inputin__fieldin" data-validate="required" data-validate-message="Elegir Unidad/Servicio" >
                                                  <option></option>
                                              </select>
                                              <span class="inputin__labelin">Unidad/Servicio</span>
                                          </label>
                                      </article>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-6">
                                      <article class="l-design-widhtin">
                                          <label class="inputin">
                                              <select id="cargo" name="cargo" class="inputin__fieldin" data-validate="required" data-validate-message="Ingresar Cargo" >
                                                  <option></option>
                                              </select>
                                              <span class="inputin__labelin">cargo</span>
                                          </label>
                                      </article>
                                  </div>
                              
                               </div>
                              <div class="row">
                                    

                              </div>
                              <div class="row">

                              </div>
                          </div>
                      </div>
                      <div class="modal-footer">
                          <button class="btn btn-primary example-the-1" id="btnGuardar" type="button">Guardar</button>
                          <button type="reset" class="btn btn-outline" data-dismiss="modal">Cerrar</button>
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

     <!-- Script Personalizado -->
     <script src="js/JSCargos.js"></script>
     <script>
         $(function () {

         });
    </script>
</asp:Content>

