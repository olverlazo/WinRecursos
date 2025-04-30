<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage3.master" AutoEventWireup="false" CodeFile="Ev_Archivos.aspx.vb" Inherits="Ev_Archivos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link href="css/StyleSheetFile.css" rel="stylesheet" />
<link href="/bower_components/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
<link href="../bower_components/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
<form enctype="multipart/form-data" id="formuploadajax" method="post" runat="server">
         <section class="content-header">
        <h1>Adjuntar Documentación      
        </h1>
    </section>

        <section class="content">

        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="timeline">
                    <li>
                        <i class="fa fa-envelope bg-blue"></i>
                        <div class="timeline-item">
                            <h3 class="timeline-header"><a>Carnet de Identidad</a> </h3>    
                            <div class="timeline-body">
                                         El Formato debe ser .Pdf Max 500Kb.  
                            </div>                     
                            <div class="timeline-footer">            
                                <input type="file" name="file-1" id="file0" class="inputfile inputfile-1" data-validate="required" data-validate-message="Elija archivo" onchange="return validarExt0();"/>
                                <label for="file0">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="iborrainputfile" width="20" height="17" viewBox="0 0 20 17">
                                        <path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
                                    <span class="iborrainputfile">Seleccionar archivo</span>
                                </label>
                            </div>
                        </div>
                    </li>
                    <li>
                        <i class="fa fa-user bg-aqua"></i>
                        <div class="timeline-item">
                            <h3 class="timeline-header"><a>Item / Memorandum / Contrato</a> </h3>
                            <div class="timeline-body">
                                El Formato debe ser .Pdf Max 500Kb.
                            </div>
                            <div class="timeline-footer">
                                <input type="file" name="file-1" id="file1" class="inputfile inputfile-1" data-validate="required" data-validate-message="Elija archivo" onchange="return validarExt1();" />
                                <label for="file1">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="iborrainputfile" width="20" height="17" viewBox="0 0 20 17">
                                        <path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
                                    <span class="iborrainputfile">Seleccionar archivo</span>
                                </label>
                            </div>
                        </div>
                    </li>
              
                    <li>
                        <i class="fa fa-comments bg-yellow"></i>
                        <div class="timeline-item">
                            <h3 class="timeline-header"><a>Cargo</a> </h3>
                            <div class="timeline-body">
                                El Formato debe ser .Pdf Max 500Kb.
                            </div>
                            <div class="timeline-footer">
                                <input type="file" name="file-1" id="file2" class="inputfile inputfile-1" data-validate="required" data-validate-message="Elija archivo" onchange="return validarExt2();" />
                                <label for="file2">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="iborrainputfile" width="20" height="17" viewBox="0 0 20 17">
                                        <path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
                                    <span class="iborrainputfile">Seleccionar archivo</span>
                                </label>
                            </div>
                        </div>
                    </li>

                    <li>
                        <i class="fa fa-camera bg-purple"></i>
                        <div class="timeline-item">
                            <h3 class="timeline-header"><a>Fotografia fondo rojo</a> </h3>
                            <div class="timeline-body">
                                El Formato debe ser .Jpg Max 500Kb Tamaño 3x3.
                            </div>
                            <div class="timeline-footer">
                                <input type="file" name="file-1" id="file3" class="inputfile inputfile-1" data-validate="required" data-validate-message="Elija archivo" onchange="return validarExt3();" />
                                <label for="file3">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="iborrainputfile" width="20" height="17" viewBox="0 0 20 17">
                                        <path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
                                    <span class="iborrainputfile">Seleccionar archivo</span>
                                </label>
                                  <div id="visorArchivo">
                                    <!--Aqui se desplegará el fichero-->
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <i class="fa fa-video-camera bg-maroon"></i>
                        <div class="timeline-item">
                            <h3 class="timeline-header"><a>Hoja de vida </a></h3>
                            <div class="timeline-body">
                                El Formato debe ser .Pdf Max 1Mb.</div>
                            <div class="timeline-footer">
                                <input type="file" name="file-1" id="file4" class="inputfile inputfile-1" data-validate="required" data-validate-message="Elija archivo" onchange="return validarExt4();" />
                                <label for="file4">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="iborrainputfile" width="20" height="17" viewBox="0 0 20 17">
                                        <path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"></path></svg>
                                    <span class="iborrainputfile">Seleccionar archivo</span>
                                </label>                              
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
       
 </div>

<%--<div class="pad margin no-print">--%>
            <div class="modal-footer" style="margin-bottom: 0!important; background-color: #00A7D0;">
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <asp:Button ID="Button1" ClientIDMode="Static" runat="server" class="btn btn-default pull-left" Text="Guardar"></asp:Button>

            </div>
        <%--</div>--%>


    </section>


    <div id="form">
        
    </div>
     <!-- jQuery 3 -->  
<script src="bower_components/jquery/dist/jquery.min.js"></script>   
<script src="/bower_components/sweetalert2/sweetalert2.all.min.js"></script>    
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

             function mostrarMensaje() {
                 Swal.fire({
                     position: "center",
                     icon: "error",
                     title: "Debe cargar todos los archivos",
                     showConfirmButton: true,
                 });
                 //alert("Debe cargar todo")
             }

             function mostrarMensaje1() {
                 Swal.fire({
                     position: "center",
                     icon: "error",
                     title: "Dejo mucho tiempo inactivo el sistema intente nuevamente",
                     showConfirmButton: true,
                 });
                 //alert("Debe cargar todo")
             }

             function validarExt0() {
                 var archivocar = document.getElementById('file0');
                 var archivoRuta = archivocar.value;
                 //var extPermitidas = /(.jpeg|.jpg|.png|.gif)$/i;
                 var extPermitidas = /(.pdf)$/i;
                 var tam = document.getElementById("file0").files[0].size;
                 //console.log(tam)
                 if (tam > 1000000) {
                     $.alert("- SU ARCHIVO PESA " + tam / 1024 + "KB." + "\n" + '- EL ARCHIVO NO PUEDE PESAR MAS DE 500 KB');
                     //$.alert(tam);
                     document.getElementById("file0").value = "";
                     archivocar.value = '';
                     return false;
                 } else {
                     if (!extPermitidas.exec(archivoRuta)) {
                         $.alert('- DEBE SELECIONAR UN ARCHIVO CON EXTENCION .Pdf');
                         archivocar.value = '';
                         return false;
                     }                    
                 }
             }

             function validarExt1() {
                 var archivocar = document.getElementById('file1');
                 var archivoRuta = archivocar.value;
                 //var extPermitidas = /(.jpeg|.jpg|.png|.gif)$/i;
                 var extPermitidas = /(.pdf)$/i;
                 var tam = document.getElementById("file1").files[0].size;
                 //console.log(tam)
                 if (tam > 1000000) {
                     $.alert("- SU ARCHIVO PESA " + tam / 1024 + "KB." + "\n" + '- EL ARCHIVO NO PUEDE PESAR MAS DE 500 KB');
                     //$.alert(tam);
                     document.getElementById("file1").value = "";
                     archivocar.value = '';
                     return false;
                 } else {
                     if (!extPermitidas.exec(archivoRuta)) {
                         $.alert('- DEBE SELECIONAR UN ARCHIVO CON EXTENCION .Pdf');
                         archivocar.value = '';
                         return false;
                     }
                     //else {
                     //    //PRevio del PDF
                     //    if (archivocar.files && archivocar.files[0]) {
                     //        var visor = new FileReader();
                     //        visor.onload = function (e) {
                     //            document.getElementById('visorArchivo').innerHTML =
                     //            '<embed src="' + e.target.result + '" width="100" height="150" />';
                     //        };
                     //        visor.readAsDataURL(archivocar.files[0]);
                     //    }
                     //}
                 }
             }

             function validarExt2() {
                 var archivocar = document.getElementById('file2');
                 var archivoRuta = archivocar.value;
                 //var extPermitidas = /(.jpeg|.jpg|.png|.gif)$/i;
                 var extPermitidas = /(.pdf)$/i;
                 var tam = document.getElementById("file2").files[0].size;
                 //console.log(tam)
                 if (tam > 1000000) {
                     $.alert("- SU ARCHIVO PESA " + tam / 1024 + "KB." + "\n" + '- EL ARCHIVO NO PUEDE PESAR MAS DE 500 KB');
                     //$.alert(tam);
                     document.getElementById("file2").value = "";
                     archivocar.value = '';
                     return false;
                 } else {
                     if (!extPermitidas.exec(archivoRuta)) {
                         $.alert('- DEBE SELECIONAR UN ARCHIVO CON EXTENCION .Pdf');
                         archivocar.value = '';
                         return false;
                     }
                     //else {
                     //    //PRevio del PDF
                     //    if (archivocar.files && archivocar.files[0]) {
                     //        var visor = new FileReader();
                     //        visor.onload = function (e) {
                     //            document.getElementById('visorArchivo').innerHTML =
                     //            '<embed src="' + e.target.result + '" width="100" height="150" />';
                     //        };
                     //        visor.readAsDataURL(archivocar.files[0]);
                     //    }
                     //}
                 }
             }

             function validarExt3() {
                 var archivocar = document.getElementById('file3');
                 var archivoRuta = archivocar.value;
                 //var extPermitidas = /(.jpeg|.jpg|.png|.gif)$/i;
                 var extPermitidas = /(.jpg)$/i;
                 var tam = document.getElementById("file3").files[0].size;
                 //console.log(tam)
                 if (tam > 800000) {
                     $.alert("- SU ARCHIVO PESA " + tam / 1024 + "KB." + "\n" + '- EL ARCHIVO NO PUEDE PESAR MAS DE 500 KB');
                     //$.alert(tam);
                     document.getElementById("file3").value = "";
                     archivocar.value = '';
                     return false;
                 } else {
                     if (!extPermitidas.exec(archivoRuta)) {
                         $.alert('- DEBE SELECIONAR UN ARCHIVO CON EXTENCION .Jpg');
                         archivocar.value = '';
                         return false;
                     }
                     else {
                         //PRevio del PDF
                         if (archivocar.files && archivocar.files[0]) {
                             var visor = new FileReader();
                             visor.onload = function (e) {
                                 document.getElementById('visorArchivo').innerHTML =
                                 '<embed src="' + e.target.result + '" width="100" height="100" />';
                             };
                             visor.readAsDataURL(archivocar.files[0]);
                         }
                     }
                 }
             }

             function validarExt4() {
                 var archivocar = document.getElementById('file4');
                 var archivoRuta = archivocar.value;
                 //var extPermitidas = /(.jpeg|.jpg|.png|.gif)$/i;
                 var extPermitidas = /(.pdf)$/i;
                 var tam = document.getElementById("file4").files[0].size;
                 //console.log(tam)
                 if (tam > 1000000) {
                     $.alert("- SU ARCHIVO PESA " + (Math.round(tam * 100 / 1048576) / 100).toString() + "Mb." + "\n" + '- EL ARCHIVO NO PUEDE PESAR MAS DE 1 Mb');
                     //$.alert(tam);
                     document.getElementById("file4").value = "";
                     archivocar.value = '';
                     return false;
                 } else {
                     if (!extPermitidas.exec(archivoRuta)) {
                         $.alert('- DEBE SELECIONAR UN ARCHIVO CON EXTENCION .Pdf');
                         archivocar.value = '';
                         return false;
                     }
                     //else {
                     //    //PRevio del PDF
                     //    if (archivocar.files && archivocar.files[0]) {
                     //        var visor = new FileReader();
                     //        visor.onload = function (e) {
                     //            document.getElementById('visorArchivo').innerHTML =
                     //            '<embed src="' + e.target.result + '" width="100" height="150" />';
                     //        };
                     //        visor.readAsDataURL(archivocar.files[0]);
                     //    }
                     //}
                 }
             }

             

             $(document).ready(function () {
                 var laboral = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("datos_laboral"))%>
              console.log('')
                 //if (laboral[18] == null) {
                 //    alert('Existio un error intente mas tarde');
                 //    window.location = "/Default.aspx";
                 //}
             });
             </script>

     </form>

</asp:Content>

