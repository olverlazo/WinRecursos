<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage3.master" AutoEventWireup="false" CodeFile="Ev_Cargo.aspx.vb" Inherits="Ev_Cargo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="formuploadajax" runat="server">
     <section class="content-header">
        <h1>Cargo Actual       
        </h1>
    </section>
    <div id="form">
        <div class="pad margin no-print">
            <div class="modal-body" style="background-color: #FFFFFF">
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <select id="entidad" name="entidad" class="inputin__fieldin" data-validate="required" data-validate-message="Elija Bloque">
                                     <option value=""></option>
                                    <option value="1">BLOQUE CENTRAL</option>
                                    <option value="2"> BLOQUE COREA</option>                                  
                                </select>
                                <span class="inputin__labelin">Bloque</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                         <article class="l-design-widhtin">
                            <label class="inputin">
                                <select id="servicio" name="servicio" class="inputin__fieldin" data-validate="required" data-validate-message="Elija Unidad/Servicio">                                   
                                </select>
                                
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                         <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="cargo" type="text" data-validate="required" data-validate-message="Cargo actual" maxlength="50" placeholder=" " />
                                <span class="inputin__labelin">Cargo</span>
                            </label>
                        </article>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="finicio1" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="required" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de inicio de cargo" />
                                <span class="inputin__labelin">Fecha de Inicio de cargo</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin" id="confin1" >
                                <input class="inputin__fieldin" id="ffin1" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="date" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de fina de cargo" />
                                <span class="inputin__labelin">Fecha de fin de cargo</span>
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
            </div>
             <div class="modal-footer" style="margin-bottom: 0!important; background-color: #00A7D0;">
                <button type="button" id="guardar" class="btn btn-default pull-left"><span class="glyphicon glyphicon-floppy-disk"></span>Guardar</button>
                <button type="button" id="siguiente" class="btn btn-default"><span class="glyphicon glyphicon-chevron-right"></span>Siguiente</button>
            </div>          
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
       

      <script  type="text/javascript" >
          //CARGA cargos
          $.ajax({
              type: "POST",
              contentType: "application/json; charset=utf-8",
              url: "Ev_Cargo.aspx/funcion_Cargos",
              dataType: "json",
              success: function (result) {
                  $('#servicio').empty();
                  $('#servicio').append("<option value=''>--Seleccionar Unidad/Servicio--</option>");
                  $.each(result.d, function (key, value) {
                      $("#servicio").append($("<option></option>").val(value.servicio_id).html(value.servicio_descripcion));
                  });
                  $("#servicio").select2();
              },
              error: function ajaxError(result) {
                  alert(result.status + ' : ' + result.statusText);
              }
          });


  

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
                                  //window.location = "/Ev_Archivos.aspx";
                              }
                          },
                          cancelar: function () {
                          },
                      }
                  });
              }
              else {
                  //alert("boo :(");
                  //alert('Error al cargar la pagina.');
                  Swal.fire({
                      position: "center",
                      icon: "error",
                      title: "LLene todos los campos requeridos",
                      showConfirmButton: true,
                  });
              }
          }


          $(document).on('click', '#siguiente', function () {
              window.location = "/Ev_Archivos.aspx";
          })


          //GUARDAR DATOS CARGOS
          function guardar() {
            var combo = document.getElementById("servicio");
            var selectedunidad = combo.options[combo.selectedIndex].text;

              $.ajax({
                  type: "POST",
                  contentType: "application/json; charset=utf-8",
                  url: "WebService2.asmx/actualizar_cargo",
                  data: '{"v1": "' + $('#entidad').val() + '", "v2": "' + $('#servicio').val() + '", "v3": "' + $('#cargo').val() + '", "v4": "' + $('#finicio1').val() + '", "v5": "' + $('#ffin1').val() + '", "v6": "' + selectedunidad + '"}',
                  success: function (response) {
                      if (response.d == "OK") {                   
                          //alert("- Los datos se guardaron correctamente");
                          //Swal.fire({
                          //    position: "center",
                          //    icon: "success",
                          //    title: "Los datos se guardaron correctamente",
                          //    showConfirmButton: false,
                          //    timer: 2000
                          //});

                          Swal.fire({
                              title: "Los datos se guardaron correctamente",
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
                      window.location = "/Ev_Archivos.aspx";

                      }
                  });


                      } else {
                          //alert("- - Error al guardar intente mas tarde");
                          Swal.fire({
                              position: "center",
                              icon: "error",
                              title: "Error al guardar intente mas tarde " +response.d,
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

              document.getElementById("siguiente").style.display = 'none';

              var laboral1 = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("datos_laboral"))%>

               console.log('')
              

              var cargo1 = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("datos_cargo"))%>
               console.log(cargo1)


              $('#entidad').val(cargo1[0]);
              $('#servicio').val(cargo1[1]);
              $('#cargo').val(cargo1[2]);     
              $('#finicio1').val(cargo1[3])  
              $('#ffin1').val(cargo1[4]);
        



              if (laboral1[0] == 1) {

                  document.getElementById("confin1").style.display = 'none';
              } else {
                  document.getElementById("confin1").style.display = 'inherit';
              }
              //Datemask dd/mm/yyyy
              $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
              //$('#datemask1').inputmask('*', { 'placeholder': '*' })
              $('#datemask1').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
              //MASCARA PARA LA FECHA
              $('[data-mask]').inputmask()
              $('[data-mask1]').inputmask()
          });

          </script>

</asp:Content>

