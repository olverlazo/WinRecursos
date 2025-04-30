<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Copia de KardexPersonal3.aspx.vb" Inherits="KardexPersonal3" %>

 
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <section class="content-header">
      <h1>
        Kardex de Personal        
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Invoice</li>
      </ol>
    </section>

     <div class="pad margin no-print">

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
                             Ingrese Nombre / Apellidos / Carnet de Identidad
                         </ul>
                     </div>
                 </div>
             </div>
         </div>
    </div>

     <section class="invoice">
           <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Lista de Personal</h3>
                </div>
                 
                <div class="box-body">
                    <table id="TablePersona" class="table table-bordered table-hover cell-border">
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
          </section>
    <!-- /.MODAL DATOS PACINTE-->
   
     <div id="form">
    <div class="modal modal-info fade" id="modal-NuevoKardex" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Adicionar nuevo personal</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <%--<input class="inputin__fieldin" id="txtnombres" data-validate="required" data-validate-message="Ingrese nombre" type="text" maxlength="200" placeholder=" "  />--%>
                                    <input class="inputin__fieldin" type="text" id="txtnombres" data-validate="required" placeholder=" " maxlength="200" data-validate-message="Ingrese Nombres" />
                                    <span class="inputin__labelin">Nombres</span>
                                </label>
                            </article>
                         </div>
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <input class="inputin__fieldin" id="txtapaterno" type="text" maxlength="200" data-validate="required"  data-validate-message="Ingrese Primer Apellido" placeholder=" "  />
                                    <span class="inputin__labelin">Apellido Paterno</span>
                                </label>
                            </article>
                        </div>
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <input class="inputin__fieldin" id="txtamaterno" type="text" maxlength="200"  data-validate="required"  data-validate-message="Ingrese Segundo Apellido" placeholder=" "  />
                                    <span class="inputin__labelin">Apellido Materno</span>
                                </label>
                            </article>
                        </div>
                           
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <input class="inputin__fieldin" id="ci" name="texto" type="text" placeholder=" "  data-validate="required"  data-validate-message="Ingrese Numero de Documento" maxlength="9"  />
                                    <span class="inputin__labelin">Número de documento</span>
                                </label>
                            </article>
                        </div>
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <input class="inputin__fieldin" id="complemento" type="text" maxlength="8"  placeholder=" " />
                                    <span class="inputin__labelin">Complemento</span>
                                </label>
                            </article>
                        </div>
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <%--<input class="inputin__fieldin" id="Text3" type="text" placeholder=" " required />--%>
                                    <select id="ciudad" name="ciudad" class="inputin__fieldin" data-validate="required" data-validate-message="Elija una ciudad"  >
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
                                    <input class="inputin__fieldin" id="nacimiento" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="date" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de nacimiento"  />
                                    <span class="inputin__labelin">Fecha de nacimiento</span>
                                </label>
                                     
                            </article>
                        </div>
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <div class="form-group">
                                    <label style="color: #3f4040">Genero&nbsp;  &nbsp; </label>
                                    <label style="color: #3f4040">
                                        <input type="radio" name="genero" id="hombre" class="flat-red" value="HOMBRE" data-validate="required"  data-validate-message="Elija genero" />
                                        Hombre &nbsp;  &nbsp;             
                                    </label>
                                    <label style="color: #3f4040">
                                        <input type="radio" name="genero" id="mujer" class="flat-red" value="MUJER" data-validate="required"  data-validate-message="Elija genero" />
                                        Mujer               
                                    </label>
                                </div>
                            </article>
                        </div>
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <input class="inputin__fieldin" id="direccion" type="text" placeholder=" " data-validate="required"  data-validate-message="Ingrese Dirección" />
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
                                    <input class="inputin__fieldin" id="email" type="email" placeholder=" " data-validate="required" data-validate-message="Ingrese correo electronico"  />
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
                                    <select id="seguros" name="seguros" class="inputin__fieldin" >
                                        <option></option>
                                    </select>
                                    <span class="inputin__labelin">Caja de seguro</span>
                                </label>
                            </article>
                        </div>
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <input class="inputin__fieldin" id="matriculas" type="text" placeholder=" " />
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
                                    <select id="afp" name="afp" class="inputin__fieldin" >
                                        <option value="">--Seleccionar--</option>
                                        <option>PREVISION BOLIVIA</option>
                                        <option>FUTURO BOLIVIA</option>
                                        <option>Ninguno</option>
                                    </select>
                                    <span class="inputin__labelin">A.F.P.</span>
                                </label>
                            </article>
                        </div>
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <input class="inputin__fieldin" id="NUA" type="text" placeholder=" " />
                                    <span class="inputin__labelin">NUA/CUA</span>
                                </label>
                            </article>
                        </div>
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <input class="inputin__fieldin" id="CAS" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " />
                                    <span class="inputin__labelin">C.A.S.</span>
                                </label>
                            </article>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <article class="l-design-widhtin">
                                <label class="inputin">
                                    <select id="estudio" name="estudio" class="inputin__fieldin" data-validate="required" data-validate-message="Elija nivel de estudio" >
                                        <option></option>
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
                                     <input type='file' id="imgInp" name="archivo"/>
                                      <img id="blah" src="imagenes/imagen.png" alt="Tu imagen" height="150px" width="150px" style="margin-top: 25px" />
                                 </label>
                             </article>
                         </div>
                       
                    </div>
                </div>
                </div>
                <div class="modal-footer">
                    
                    <%--<button id="btnGuardar" type="button" class="btn btn-outline">Guardar</button>--%>
                    <button class="btn btn-primary example-the-1" id="btnGuardar" type="button">Guardar</button>
                    <button type="reset" class="btn btn-outline" data-dismiss="modal" >Cerrar</button>                
                </div>
            </div>
            <!-- /.modal-content -->
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


  


      <script  type="text/javascript">



 //CARGA IMAGEN
          function readImage(input) {
              if (input.files && input.files[0]) {
                  var reader = new FileReader();
                  reader.onload = function (e) {
                      $('#blah').attr('src', e.target.result); // Renderizamos la imagen
                  }
                  reader.readAsDataURL(input.files[0]);
              }
          }

          $("#imgInp").change(function () {
              readImage(this);
          });

          
          $(document).ready(function () {

//CARGA SEGUROS
              $.ajax({
                  type: "POST",
                  contentType: "application/json; charset=utf-8",
                  url: "KardexPersonal3.aspx/funcion_Seguros",
                  data: '{"v1": "0", "v2": "0", "v3": "0","v4": "4"}',
                  dataType: "json",
                  success: function (result) {
                      $('#seguros').empty();
                      $('#seguros').append("<option value=''>--Seleccionar--</option>");
                      $.each(result.d, function (key, value) {
                          $("#seguros").append($("<option></option>").val(value.seguros_id).html(value.seguros_descripcion));
                      });
                      // $("#ddlDepartments").select2();
                  },
                  error: function ajaxError(result) {
                      alert(result.status + ' : ' + result.statusText);
                  }
              });
 //CARGA NIVEL DE ESTUDIO
              $.ajax({
                  type: "POST",
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
                      // $("#ddlDepartments").select2();
                  },
                  error: function ajaxError(result) {
                      alert(result.status + ' : ' + result.statusText);
                  }
              });

 //SOLO NUMEROS EN CI
              jQuery("#ci").on('input', function (evt) {
                  // Allow only numbers.
                  jQuery(this).val(jQuery(this).val().replace(/[^0-9]/g, ''));
              });

          });


        
//GUARDAR ORDEN
          function guardar() {
              var idpersonal = 0                                                 //v1
              var documento = $('#ci').val();                                       //v2
              var complemento = $('#complemento').val();                               //v3
              var expedido = $('select[name=ciudad]').val();
              var nombre = $('#txtnombres').val();
              var ap_paterno = $('#txtapaterno').val();
              var ap_materno = $('#txtamaterno').val();
              var sexo = $('input:radio[name=genero]:checked').val()
              var f_nacimiento = $('#nacimiento').val();
              var direccion = $('#direccion').val();
              var telefono = $('#telefono').val();
              var correo = $('#email').val();
              var c_seguro = $('select[name=seguros]').val();
              var m_seguro = $('#matriculas').val();
              var e_afiliado = $('select[name=afp]').val();
              var c_afiliado = $('#NUA').val();
              var f_ing_sis_salud = "01/01/2000"; //no esta en el modal HTML
              var d_contraloria = 0;//no esta en el modal HTML
              var d_risaj = 0;//no esta en el modal HTML
              var f_risaj = 0;//no esta en el modal HTML
              var d_sipasse = 0;//no esta en el modal HTML
              var f_sipasse = 0;//no esta en el modal HTML
              var d_libreta = 0;//no esta en el modal HTML
              var f_asig_vacacion = "01/01/2000"; //no esta en el modal HTML
              var fuente_verif_vacacion = 0; //no esta en el modal HTML
              var n_estudio = $('select[name=estudio]').val();
              var profesion = $('#profesion').val();
              var mat_profesion = $('#matricula').val();
              var mat_especialidad = 0;//no esta en el modal HTML
              var foto = 0;// document.getElementById("blah").value;//cargar la foto al jscript     OJO   new FormData($('#blah')[0]);


              var frmData = new FormData();
              
              frmData.append("texto", $("#ci").val());
              //frmData.append("archivo", $('#imgInp')[0].files[0]);
              
              

             

              var estado = 'true';//no esta en el modal HTML
              var id_biometrico = 0;//no esta en el modal HTML
              var file = 0;//no esta en el modal HTML
              var r1 = 0;//no esta en el modal HTML
              var r2 = 0;//no esta en el modal HTML
              var r3 = 0;//no esta en el modal HTML
              var r4 = 0;//no esta en el modal HTML
              var f_registro_personal = "01/01/2000"; //no esta en el modal HTML esta variable se asigna en el procedimiento del SQL
              var usuario_r_personal = '<%= Session("idusuario").ToString%>';
              $.ajax({
                  type: 'POST',
                  url: 'KardexPersonal3.aspx/funcion_ingresar',
                  //data: '{"v1": "' + idpersonal + '", "v2": "' + documento + '", "v3": "' + complemento + '", "v4": "' + expedido + '", "v5": "' + nombre + '", "v6": "' + ap_paterno + '", "v7": "' + ap_materno + '", "v8": "' + sexo + '","v9": "' + f_nacimiento + '", "v10": "' + direccion + '", "v11": "' + telefono + '", "v12": "' + correo + '", "v13": "' + c_seguro + '", "v14": "' + m_seguro + '", "v15": "' + e_afiliado + '", "v16": "' + c_afiliado + '", "v17": "' + f_ing_sis_salud + '", "v18": "' + d_contraloria + '", "v19": "' + d_risaj + '", "v20": "' + f_risaj + '", "v21": "' + d_sipasse + '", "v22": "' + f_sipasse + '", "v23": "' + d_libreta + '", "v24": "' + f_asig_vacacion + '", "v25": "' + fuente_verif_vacacion + '", "v26": "' + n_estudio + '", "v27": "' + profesion + '", "v28": "' + mat_profesion + '", "v29": "' + mat_especialidad + '", "v30": "' + foto + '", "v31": "' + estado + '", "v32": "' + id_biometrico + '", "v33": "' + file + '","v34": "' + r1 + '", "v35": "' + r2 + '", "v36": "' + r3 + '", "v37": "' + r4 + '", "v38": "' + f_registro_personal + '", "v39": "' + usuario_r_personal + '"}',
                  
                  contentType: false,
                  processData: false,                  
                  data: frmData,
                  cache: false,
                  enctype: 'multipart/form-data',
                  //contentType: "application/json; charset=utf-8",
                  //dataType: "json",
                  success: function (response) {

                     // console.log(resultado);
                      if (response.d == "OK") {
                          $.alert('Los datos se guardaron correctamente');
                          //var res = response.d;
                          //console.log(res);
                      } //else { alert(response.d); }
                      console.log(response.d);
                  },
                  error: function (XMLHttpRequest, textStatus, errorThrown) {
                      var err = eval("(" + XMLHttpRequest.responseText + ")");
                      alert("ojo" + err.Message)
                      console.log("Ajax Error!");
                  }
              });
          };
           
      
//PREGUNTA SI DECEA GUARDAR   
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
                                  
                                      guardar()
                                      //$('#modal-NuevoKardex').on('show.bs.modal', function (event) {
                                      //$("#modal-NuevoKardex input").val("");
                                      //$("#modal-NuevoKardex textarea").val("");
                                      //$("#modal-NuevoKardex select").val("");
                                      //$("#modal-NuevoKardex input[type='checkbox']").prop('checked', false).change();
                                      //$("#modal-NuevoKardex input[type='radio']").prop('checked', false).change();
                                  //});
                                  //$("#modal-NuevoKardex").modal("hide");                               
                              }
                          },
                          cancelar: function () {
                             
                          },
                      }
                  });
              }
              //else {
              //    alert("boo :(");
              //}
          }



          $("#txtvalor").on("input", function (e) {
              var input = $(this);
              var val = input.val();
              if (val.length > 1) {
                  $("#TablePersona").DataTable({
                      'paging': true,
                      'lengthChange': true,
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
                          url: "KardexPersonal3.aspx/CargarLista",
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
                  'lengthChange': true,
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


          $(document).on('click', '#Nuevo', function () {
              
              $('#modal-NuevoKardex').modal('show');
          });

         
          $(function () {
              //Initialize Select2 Elements
              $('.select2').select2()

              //Datemask dd/mm/yyyy
              $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
              $('#datemask1').inputmask('*', { 'placeholder': '*' })

              //Money Euro
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

