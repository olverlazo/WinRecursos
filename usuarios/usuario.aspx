<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="usuario.aspx.vb" Inherits="usuarios_usuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../bower_components/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
     <form id="formuploadajax" runat="server">
     <section class="content-header">
        <h1>Cambiar contraseña       
        </h1>
    </section>
    <div id="form">
        <div class="pad margin no-print">
            <div class="modal-body" style="background-color: #FFFFFF">
                <div class="row">                    
                    <div class="col-md-8">
                         <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="nombre" type="text" data-validate="required" data-validate-message="Cargo actual" maxlength="50" placeholder=" " disabled="disabled"  />
                                <span class="inputin__labelin">Usuario</span>
                            </label>
                        </article>
                    </div>
                </div>

                <div class="row">                    
                    <div class="col-md-8">
                         <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="usuario1" type="text" data-validate="required" data-validate-message="Cargo actual" maxlength="50" placeholder=" " disabled="disabled"  />
                                <span class="inputin__labelin">Nombre de usuario</span>
                            </label>
                        </article>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-8">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="ConAnt" type="text"  data-validate="required" placeholder=" " />
                                <span class="inputin__labelin">Contraseña anterior</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-8">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="ConAct" type="text"  data-validate="required" placeholder=" " />
                                <span class="inputin__labelin">Nueva contraseña</span>
                            </label>
                        </article>
                    </div>
                    <div class="col-md-8">
                        <article class="l-design-widhtin">
                            <label class="inputin">
                                <input class="inputin__fieldin" id="ConAct1" type="text"  data-validate="required" placeholder=" " />
                                <span class="inputin__labelin">Repita la contraseña</span>
                            </label>
                        </article>
                    </div>
                </div>              
            </div>
             <div class="modal-footer" style="margin-bottom: 0!important; background-color: #00A7D0;">
                <button type="button" id="guardar" class="btn btn-default pull-left"><span class="glyphicon glyphicon-floppy-disk"></span>Guardar</button>                
            </div>          
        </div>
    </div>
    

        </form>
    
    
         

    
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
        <!-- iCheck 1.0.1 -->
        <script src="/plugins/iCheck/icheck.min.js"></script>
   
        <script src="/SimpleAjaxUploader.js"></script>
  
    <script src="js/JSusuario.js"></script>
    <script type="text/javascript">
        var clave
        var id
        $(document).ready(function () {

            var personadatos = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("datos"))%>
            $('#nombre').val(personadatos[2] + " " + personadatos[3] + " " + personadatos[4]);
            $('#usuario1').val(personadatos[5]);
            clave = personadatos[6]
            id = personadatos[0]
        });
    </script>

</asp:Content>

