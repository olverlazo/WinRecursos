<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage3.master" AutoEventWireup="false" CodeFile="Ev_Kardex.aspx.vb" Inherits="Ev_Kardex" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content-header">
        <h1>Kardex de Personal        
        </h1>
    </section>
    <div id="form">
        <div class="pad margin no-print">
            <div class="modal-body" style="background-color: #FFFFFF">
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <%--<input class="inputin__fieldin" id="txtnombres" data-validate="required" data-validate-message="Ingrese nombre" type="text" maxlength="200" placeholder=" "  />--%>
                                <input class="inputin__fieldin" type="text" id="nombre" data-validate="required" placeholder=" " maxlength="200" data-validate-message="Ingrese Nombres" />
                                <span class="inputin__labelin">Nombres</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="paterno" type="text" maxlength="200" data-validate="required" data-validate-message="Ingrese Primer Apellido" placeholder=" " />
                                <span class="inputin__labelin">Apellido Paterno</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="materno" type="text" maxlength="200" data-validate="required" data-validate-message="Ingrese Segundo Apellido" placeholder=" " />
                                <span class="inputin__labelin">Apellido Materno</span>
                            </label>
                        </article>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="ci" name="texto" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese Numero de Documento" maxlength="9" disabled="disabled" />
                                <span class="inputin__labelin">Número de documento</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="complemento" type="text" maxlength="8" placeholder=" " />
                                <span class="inputin__labelin">Complemento</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <%--<input class="inputin__fieldin" id="Text3" type="text" placeholder=" " required />--%>
                                <select id="ciudad" name="ciudad" class="inputin__fieldin" data-validate="required" data-validate-message="Elija una ciudad">
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
                                <input class="inputin__fieldin" id="nacimiento" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="date" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de nacimiento" />
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
                                <input class="inputin__fieldin" id="direccion" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese Dirección" />
                                <span class="inputin__labelin">Dirección</span>
                            </label>
                        </article>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="telefono" type="text" placeholder=" " data-validate="required" data-validate-message="Ingrese Numero de cel y/o telefono" />
                                <span class="inputin__labelin">Telefono</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="email" type="email" placeholder=" " data-validate="required" data-validate-message="Ingrese correo electronico" />
                                <span class="inputin__labelin">Correo electronico</span>
                            </label>
                        </article>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <select id="seguros" name="seguros" class="inputin__fieldin" data-validate="required" data-validate-message="Elija un seguro">
                                    <option>CAJA BANCARIA ESTATAL</option>
                                    <option>CAJA DE CAMINOS</option>
                                    <option>CAJA NACIONAL DE SALUD</option>
                                    <option>CAJA PETROLERA</option>
                                    <option>CAJA UNIVERSITARIO</option>
                                    <option>NINGUNO</option>
                                </select>
                                <span class="inputin__labelin">Elija un seguro</span>
                            </label>
                        </article>
                    </div>

                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="m_seguros" type="text" placeholder=" " />
                                <span class="inputin__labelin">Matricula de seguro</span>
                            </label>
                        </article>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <%--<input class="inputin__fieldin" id="AFP" type="text"  placeholder=" " required />--%>
                                <select id="afp" name="afp" class="inputin__fieldin" data-validate="required">
                                    <option>PREVISION BOLIVIA</option>
                                    <option>FUTURO BOLIVIA</option>
                                    <option>GESTORA</option>
                                    <option>NINGUNO</option>
                                </select>
                                <span class="inputin__labelin">A.F.P.</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="nua" type="text" placeholder=" " />
                                <span class="inputin__labelin">NUA/CUA</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <%--   <label class="inputin">
                            <input class="inputin__fieldin" id="Text11" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " />
                            <span class="inputin__labelin">C.A.S.</span>
                        </label>--%>
                        </article>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <select id="estudio" name="estudio" class="inputin__fieldin" data-validate="required" data-validate-message="Ingrese Nivel de Estudio">
                                     <%--<option value="10">DOCTORADO</option>
                                    <option value="6">EGRESADO</option>
                                    <option value="8">ESPECIALIDAD MEDICA</option>
                                    <option value="7">LICENCIATURA</option> 
                                    <option value="9">MAESTRIA</option> 
                                    <option value="11">NINGUNO</option> 
                                    <option value="1">PRIMARIA</option> 
                                    <option value="2">SECUNDARIA</option> 
                                    <option value="4">TECNICO MEDIO</option> 
                                    <option value="5">TECNICO SUPERIOR</option> 
                                    <option value="3">UNIVERSITARIO</option> --%>
                                       <%-- <option value="10">DOCTORADO</option>
                                    <option value="6">EGRESADO</option>
                                    <option value="8">ESPECIALIDAD MEDICA</option>
                                    <option value="7">LICENCIATURA</option> 
                                    <option value="9">MAESTRIA</option> 
                                    <option value="11">NINGUNO</option> 
                                    <option value="1">PRIMARIA</option> 
                                    <option value="2">SECUNDARIA</option> 
                                    <option value="4">TECNICO MEDIO</option> 
                                    <option value="5">TECNICO SUPERIOR</option> 
                                    <option value="3">UNIVERSITARIO</option> --%>
                                </select>
                                <span class="inputin__labelin">Nivel de estudio</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="profesion" type="text" placeholder=" " />
                                <span class="inputin__labelin">Profecion</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-4">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="matricula" type="text" data-mask placeholder=" " />
                                <span class="inputin__labelin">Matricula Profecional</span>
                            </label>
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
                <button type="button" id="guardar" class="btn btn-default pull-left"><span class="glyphicon glyphicon-floppy-disk"></span>Guardar</button>
                <button type="button" id="siguiente" class="btn btn-default"><span class="glyphicon glyphicon-chevron-right"></span>Siguiente</button>
            </div>


       <%--     <div style="margin-bottom: 0!important; background-color: #00A7D0;">
                <div class="row">
                    <div class="col-md-3">
                        <div class="box-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <div class="input-group input-group-sm">
                                        <span class="input-group-btn">

                                            <button type="button" id="guardar" class="btn btn-block btn-default btn-lg">
                                                <span class="glyphicon glyphicon-floppy-disk"></span>Guardar</button>
                                             <button type="button" id="Button1" class="btn btn-block btn-default btn-lg">
                                                <span class="glyphicon glyphicon-floppy-disk pull-left"></span>Guardar</button>
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
          var personadatos
          $(document).ready(function () {

              document.getElementById("siguiente").style.display = 'none';

              //CARGA NIVEL DE ESTUDIO
              $.ajax({
                  type: "POST",
                  async: false,
                  contentType: "application/json; charset=utf-8",
                  url: "KardexPersonal3.aspx/funcion_estudio",
                  data: '{"v1": "0", "v2": "0", "v3": "0","v4": "4"}',
                  dataType: "json",
                  success: function (result) {
                      $('#estudio').empty();
                      $('#estudio').append("<option value=''>--Seleccionar--</option>");
                      $.each(result.d, function (key, value) {
                          $("#estudio").append($("<option></option>").val(value.estudio_id).html(value.estudio_descripcion));
                      });
                      // $("#estudio").select2();
                  },
              });


              personadatos = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("datos"))%>
                  console.log('')
              $('#nombre').val(personadatos[4]);
              $('#paterno').val(personadatos[5]);
              $('#materno').val(personadatos[6]);
              $('#ci').val(personadatos[1]);
              $('#complemento').val(personadatos[2]);
              $('#ciudad').val(personadatos[3]);
              //console.log(personadatos[8])
              $('#nacimiento').val(personadatos[8]);

              if (personadatos[7] == "MUJER") {
                  $('#mujer').prop('checked', 'checked');

                  $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                      checkboxClass: 'icheckbox_flat-green',
                      radioClass: 'iradio_flat-green'
                  })

                  // $("#mujer").select2();
              } else {
                  $('#hombre').prop('checked', 'checked');
                  $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                      checkboxClass: 'icheckbox_flat-green',
                      radioClass: 'iradio_flat-green'
                  })
                  // $("#hombre").select2();
              }

              $('#direccion').val(personadatos[9]);
              $('#telefono').val(personadatos[10]);
              $('#email').val(personadatos[11]);

              $('#seguros').val(personadatos[12]);
              $('#m_seguros').val(personadatos[13]);
              $('#afp').val(personadatos[14]);
              $('#nua').val(personadatos[15]);

              $('#estudio').val(personadatos[25]);

              $('#profesion').val(personadatos[26]);
              $('#matricula').val(personadatos[27]);

          });


          $(document).on('click', '#siguiente', function () {
              window.location = "/EV_Laboral.aspx";
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
                                  //window.location = "/EV_Laboral.aspx";
                              }
                          },
                          cancelar: function () {
                          },
                      }
                  });

     //             Swal.fire({
     //                 title: "Are you sure?",
     //                 text: "You won't be able to revert this!",
     //                 icon: "warning",
     //                 showCancelButton: true,
     //                 confirmButtonColor: "#3085d6",
     //                 cancelButtonColor: "#d33",
     //                 confirmButtonText: "Yes, delete it!"
     //             }).then((result) => {
     //                 if (result.isConfirmed) {
     //Swal.fire({
     //                 title: "Deleted!",
     //             text: "Your file has been deleted.",
     //             icon: "success"
     //         });
     //     }
     //     });


              }
              else {
                  //alert("boo :(");
                  //alert('- LLene todos los campos requeridos');

                  Swal.fire({
                      position: "center",
                      icon: "error",
                      title: "LLene todos los campos requeridos",
                      showConfirmButton: true,
                     
                  });
              }
          }

          //GUARDAR KARDEX EN VARIALE DE SESSION personadatos
          function guardar() {

              //personadatos[4] = $('#nombre').val();   
              //personadatos[5] = $('#paterno').val();
              //personadatos[6] = $('#materno').val();
              //personadatos[1] = $('#ci').val();
              //personadatos[2] = $('#complemento').val();
              //personadatos[3] = $('#ciudad').val();
              //personadatos[8] = $('#nacimiento').val();
              //personadatos[7] = $('input:radio[name=genero]:checked').val();
              //personadatos[9] = $('#direccion').val();
              //personadatos[10]= $('#telefono').val();
              //personadatos[11]= $('#email').val();
              //personadatos[12]=$('#seguros').val();
              //personadatos[13]=$('#m_seguros').val();
              //personadatos[14]=$('#afp').val();
              //personadatos[15]=$('#nua').val();
              //personadatos[25]=$('#estudio').val();
              //personadatos[26]=$('#profesion').val();
              //personadatos[27] = $('#matricula').val();
              $.ajax({
                  type: "POST",
                  contentType: "application/json; charset=utf-8",
                  url: "WebService2.asmx/actualizar_session",
                  data: '{"v1": "' + $('#nombre').val() + '", "v2": "' + $('#paterno').val() + '", "v3": "' + $('#materno').val() + '", "v4": "' + $('#ci').val() + '", "v5": "' + $('#complemento').val() + '","v6": "' + $('#ciudad').val() + '", "v7": "' + $('#nacimiento').val() + '", "v8": "' + $('input:radio[name=genero]:checked').val() + '", "v9": "' + $('#direccion').val() + '" , "v10": "' + $('#telefono').val() + '", "v11": "' + $('#email').val() + '", "v12": "' + $('#seguros').val() + '","v13": "' + $('#m_seguros').val() + '", "v14": "' + $('#afp').val() + '", "v15": "' + $('#nua').val() + '", "v16": "' + $('#estudio').val() + '", "v17": "' + $('#profesion').val() + '", "v18": "' + $('#matricula').val() + '"}',
                  success: function (response) {
                      if (response.d == "OK") {
                          //alert("Los datos se guardaron correctamente");

                          //Swal.fire({
                          //    position: "center",
                          //    icon: "success",
                          //    title: "Los datos se guardaron correctamente",
                          //    showConfirmButton: true,
                          //    timer: 26000
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
                      window.location = "/EV_Laboral.aspx";

                            }
                            });

                          

                      } else {
                          //alert("error en actualizacion");
                          Swal.fire({
                              position: "center",
                              icon: "error",
                              title: "error en actualizacion",
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

          jQuery("#ci").on('input', function (evt) {
              // Allow only numbers.
              jQuery(this).val(jQuery(this).val().replace(/[^0-9]/g, ''));
          });

          $(function () {
              //Initialize Select2 Elements
              $('.select2').select2()

              //Datemask dd/mm/yyyy
              $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
              //$('#datemask1').inputmask('*', { 'placeholder': '*' })
              $('#datemask1').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })

              //MASCARA PARA LA FECHA
              $('[data-mask]').inputmask()
              $('[data-mask1]').inputmask()

              //Flat red color scheme for iCheck
              $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                  checkboxClass: 'icheckbox_flat-green',
                  radioClass: 'iradio_flat-green'
              })
          });
</script>

</asp:Content>

