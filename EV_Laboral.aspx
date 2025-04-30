<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage3.master" AutoEventWireup="false" CodeFile="EV_Laboral.aspx.vb" Inherits="EV_Laboral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form enctype="multipart/form-data" id="formuploadajax" method="post" runat="server">

     <section class="content-header">
        <h1>Item/Memorandum/Contrato        
        </h1>
    </section>

             


    <div id="form">
        <div class="pad margin no-print">
            <div class="modal-body" style="background-color: #FFFFFF">
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <select id="contrato" name="contrato" class="inputin__fieldin" data-validate="required" data-validate-message="Elija tipo contrato">                                    
                                    <option value="1">PERSONAL PERMANENTE</option>
                                    <option value="2">PERSONAL EVENTUAL</option>
                                    <option value="3">CONSULTOR EN LINEA</option>
                                    <option value="4">CONSULTOR POR PRODUCTO</option>                                    
                                </select>
                                <span class="inputin__labelin">Tipo de contrato</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                      <article class="l-design-widhtin">
                            <label class="inputin">
                                <select id="categoria" name="ciudad" class="inputin__fieldin" data-validate="required" data-validate-message="Elija categoria">
                                    <option value="5">ADMINISTRATIVO</option>
                                    <option value="4">AUX. ENFERMERIA</option>
                                    <option value="7">CONDUCTOR DE VEHICULO</option>
                                    <option value="3">LIC. ENFERMERIA</option>
                                    <option value="1">MEDICO</option>
                                    <option value="8">MEDICO ASSO</option>
                                    <option value="2">MEDICO COMPLEMENTARIO</option>                                    
                                    <option value="9">MEDICO RESIDENTE</option>
                                    <option value="6">TRABAJADOR MANUAL</option>
                                </select>
                                <span class="inputin__labelin">Categoria</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <select id="ffinanciamiento" name="ciudad" class="inputin__fieldin" data-validate="required" data-validate-message="Elija F. Financimiento">
                                    <option value="1">Consultor Individual: 25220</option>
                                    <option value="2">Personal Eventual: 12100</option>
                                    <option value="3">Personal Eventual: 26990</option>
                                    <option value="4">Recursos ASSO</option>
                                    <option value="13">Recursos CRIDAI</option>
                                    <option value="5">Recursos Gobernacion</option>
                                    <option value="6">Recursos HIPIC</option>                                    
                                    <option value="7">Recursos MINEDU</option>
                                    <option value="8">Recursos Ministerio</option>
                                    <option value="10">Recursos Municipio</option>
                                    <option value="11">Recursos ONG</option>
                                    <option value="12">Recursos SERECI</option>
                                    <option value="9">Recursos SUS</option>
                                    <option value="14">Recursos TELESALUD</option>
                                    <option value="15">Recursos TGN</option>
                                </select>
                                <span class="inputin__labelin">F. Financiamiento</span>
                            </label>
                        </article>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <select id="horario" name="horario" class="inputin__fieldin" data-validate="required" data-validate-message="Elija carga horaria">
                                    <option value="1">Medio Tiempo</option>
                                    <option value="2">Tiempo completo</option>                          
                                </select>
                                <span class="inputin__labelin">Carga Horaria</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="item" type="text" maxlength="8" placeholder=" " data-validate="required" data-validate-message="Ingrese dato" />
                                <span class="inputin__labelin">Nro de (Item/Memorandum/Contrato)</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <%--<input class="inputin__fieldin" id="Text3" type="text" placeholder=" " required />--%>
                               
                            </label>
                        </article>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="finicio" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="required" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de nacimiento" />
                                <span class="inputin__labelin">Fecha de Inicio Item/Memorandum/Contrato</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin" id="confin" >
                                <input class="inputin__fieldin" id="ffin" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="date" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de nacimiento" />
                                <span class="inputin__labelin">Fecha de fin Item/Memorandum/Contrato</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <div class="form-group">
                               
                            </div>
                        </article>
                    </div>
                </div>
    
                <div class="row">
                    <div class="col-md-8">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                            
                            </label>
                        </article>
                    </div>

                </div>
            </div>
             <div class="modal-footer" style="margin-bottom: 0!important; background-color: #00A7D0;">
                <%-- <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="return validateForm();" />--%>               

                <button type="button" id="guardar" class="btn btn-default pull-left"><span class="glyphicon glyphicon-floppy-disk"></span>Guardar</button>
                <button type="button" id="siguiente" class="btn btn-default"><span class="glyphicon glyphicon-chevron-right"></span>Siguiente</button>
            </div>
        <%--    <div style="margin-bottom: 0!important; background-color: #00A7D0;">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="box-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <div class="input-group input-group-sm">
                                        <span class="input-group-btn">

                                            <button type="button" id="guardar" class="btn btn-block btn-default btn-lg">
                                                <span class="glyphicon glyphicon-floppy-disk"></span>Guardar</button>
                                            
                                        </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
 
                </div>
            </div>--%>
        </div>
    </div>
    
</form>
    <div id="mensaje"></div>
    <div class="row" style="padding-top: 10px;">
        <div class="col-xs-12">
            <div id="msgBox" style="display: none;" class="alert alert-success"></div>
        </div>
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
    <script src="SimpleAjaxUploader.js"></script> 

  
      <script  type="text/javascript">


          var laboral

          $(document).ready(function () {

              document.getElementById("siguiente").style.display = 'none';

              var personadatos1 = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("datos"))%>
               laboral = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("datos_laboral"))%>
                  //console.log(personadatos1)
              
          //$.ajax({
          //    type: 'POST',
          //    url: 'WebService2.asmx/laboral',
          //    data: '{"v1": "' + personadatos1[1] + '"}',
          //    contentType: "application/json; charset=utf-8",
          //    dataType: "json",
          //    success: function (response) {
          //        if (response.d[0] == "error1") {
          //            //console.log(response)
          //            alert('Existio un error intente mas tarde');
          //            window.location = "/Default.aspx";
                  //} else {
                     

                      $('#contrato').val(laboral[0]);
                      $('#categoria').val(laboral[1]);
                      $('#ffinanciamiento').val(laboral[2]);
              //console.log(laboral[13]);
                      $('#horario').val(laboral[3])
                      //if (laboral[3] == '2')
                      //    $('#horario').val('Tiempo completo');
                      //else
                      //    $('#horario').val('Medio tiempo');
                      $('#item').val(laboral[4]);
                      $('#finicio').val(laboral[5]);
                      $('#ffin').val(laboral[6]);
                      //alert(laboral[10]);
          //        }
          //    },
          //    error: function (result) {
          //        alert("ERROR " + result.status + ' ' + result.statusText);
          //    }
          //});
          });


          $(document).on('click', '#siguiente', function () {
              window.location = "/EV_Cargo.aspx";
          })



     
      //PREGUNTA SI DESEA GUARDAR   
      $(function () {
          $("#guardar").click(validateForm);
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
                              //console.log(maxSize);
                              guardar();
                              //window.location = "/Ev_Cargo.aspx";
                          }
                      },
                      cancelar: function () {
                      },
                  }
              });
          }
          else {
              //alert("boo :(");
              //alert('- Llene todos los campos requeridos');

              Swal.fire({
                  position: "center",
                  icon: "error",
                  title: "LLene todos los campos requeridos",
                  showConfirmButton: true,
              });
          }

       
      }

 
      //GUARDAR DATOS DE LABORAL
      function guardar() {
          $.ajax({
              type: "POST",
              contentType: "application/json; charset=utf-8",
              url: "WebService2.asmx/actualizar_session_laboral",
              data: '{"v1": "' + $('#contrato').val() + '", "v2": "' + $('#categoria').val() + '", "v3": "' + $('#ffinanciamiento').val() + '", "v4": "' + $('#horario').val() + '", "v5": "' + $('#item').val() + '","v6": "' + $('#finicio').val() + '", "v7": "' + $('#ffin').val() + '"}',
             
              success: function (response) { 
                  if (response.d == "OK") {                     
                      //alert(" - Los2 datos se guardaron correctamente");

                      //Swal.fire({
                      //    position: "center",
                      //    icon: "success",
                      //    title: "Los datos se guardaron correctamente",
                      //    showConfirmButton: false,
                      //    timer: 2000
                      //});


                      Swal.fire({
                          title: "Los datos se guardaron correctamente"  ,
                          //text: "You won't be able to revert this!",
                          icon: "success",
                          showCancelButton: false,
                          confirmButtonColor: "#3085d6",
                          cancelButtonColor: "#d33",
                          confirmButtonText: "Continuar"
                      }).then((result) => {
                          if (result.isConfirmed) {
                      //          Swal.fire({
                      //              title: "Deleted!",
                      //              text: "Your file has been deleted.",
                      //              icon: "success"
                                   
                      //}); 
                      window.location = "/EV_Cargo.aspx";

                  }
              });


                  } else {  
                      //alert("- Error al guardar intente mas tarde");
                      Swal.fire({
                          position: "center",
                          icon: "error",
                          title: "Error al guardar intente mas tarde" + response.d,
                          showConfirmButton: false,
                          timer: 2000
                      });
                  }
              },
              error: function ajaxError(result) {
                  alert(result.status + ' : ' + result.statusText);
              }
          });
      };


      $(function () {

          document.getElementById("confin").style.display = 'none';
          //Initialize Select2 Elements
          $('.select2').select2()

          //Datemask dd/mm/yyyy
          $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
          //$('#datemask1').inputmask('*', { 'placeholder': '*' })
          $('#datemask1').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })

          //MASCARA PARA LA FECHA
          $('[data-mask]').inputmask()
          $('[data-mask1]').inputmask()

          //Date picker
          //$('#finicio').datepicker({
          //    autoclose: true
          //})
          //$('#ffin').datepicker({
          //    autoclose: true
          //})
          //Flat red color scheme for iCheck
          $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
              checkboxClass: 'icheckbox_flat-green',
              radioClass: 'iradio_flat-green'
          })
      });



      $('#contrato').on('change', function (evt, params) {    
          document.getElementById("confin").style.display = 'none';
          if ($('#contrato').val() > 1) {
              document.getElementById("confin").style.display = 'inherit';
          }          
      });

</script>
</asp:Content>

