<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DefaultPersonal.aspx.vb" Inherits="DefaultPersonal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>.::Sistema Integrado de RRHH::.</title>

    <!--JQUERY-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    <!-- Los iconos tipo Solid de Fontawesome-->
    <!-- Nuestro css-->
    <link rel="stylesheet" type="text/css" href="static/css/index.css" th:href="@{/css/index.css}"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css"/>



    <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
</head>
<body>
    <div class="modal-dialog text-center">
        <div class="col-sm-8 main-section">
            <div class="modal-content">
                <div class="col-12 user-img">
                    <img src="static/img/user.png" th:src="@{/img/user.png}"/>
                </div>
                <form class="col-12" th:action="@{/login}" method="get">
                    <div class="form-group" id="user-group">
                        <input type="text" class="form-control" placeholder="Carnet de Identidad" name="usuario" id="usuario"/>
                    </div>
                    <div class="form-group" id="contrasena-group">
                        <%--<input type="text" class="form-control"name="password" id="password"/>--%>
                        <input class="inputin__fieldin" id="password" type="text" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask placeholder=" " data-validate="required" data-value-format="dd/mm/yyyy" data-validate-message="Ingrese Fecha de inicio de cargo" />
                          <span class="inputin__labelin" style="color: #FFFFFF">Fecha de nacimiento</span>
                    </div>
                    <button type="button" id="aceptar" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i>  Ingresar </button>

                </form>
                <div class="col-12 forgot">
                    <a href="#">Area de Tecnologia de la Información</a>
                </div>
            </div>
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
    
    <script type="text/javascript">
        var es_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
        var es_firefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1;

        $(function () {

            //Datemask dd/mm/yyyy
            $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
            //$('#datemask1').inputmask('*', { 'placeholder': '*' })
            $('#datemask1').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })

            //MASCARA PARA LA FECHA
            $('[data-mask]').inputmask()
            $('[data-mask1]').inputmask()

    
        });


        if (es_chrome || es_firefox) {
            $('#aceptar').click(function (e) {
                e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
                var usuario = $('#usuario').val();
                var password = $('#password').val();

                $.ajax({
                    type: 'POST',                               // tipo de llamada (POST, GET)
                    url: 'WebService2.asmx/login1',     // el URL del método que vamos a llamar
                    data: '{"v1": "' + usuario + '", "v2": "' + password + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",                           // tipo de datos enviados al servidor
                    success: function (response) {
                        if (response.d[0] == "error") {                            
                            alert("USUARIO O CONTRASEÑA INCORRECTOS");
                            console.log(response.d)
                            //Swal.fire({
                            //    position: "center",
                            //    icon: "error",
                            //    text: "USUARIO O CONTRASEÑA INCORRECTOS?",
                            //    showConfirmButton: true,
                            //});
                            //console.log(response.d)                            
                        } else {
                              if (response.d[36] == "1") {
                                  alert("USTED YA REGISTRO SUS DATOS, VALIDE SU INFORMACION EN OFICINAS DE RRHH");
                                  //Swal.fire({
                                  //    position: "center",
                                  //    icon: "error",
                                  //    text: "USTED YA REGISTRO SUS DATOS, VALIDE SU INFORMACION EN OFICINAS DE RRHH",
                                  //    showConfirmButton: true,
                                  //});
                                window.location = "/Ev_ddjj.aspx";
                            }
                            else
                            {
                                window.location = "/Ev_Kardex.aspx";
                            }
                        }
                    },
                    error: function (result) {          // función que se va a ejecutar si el pedido falla
                        alert("ERROR " + result.status + ' ' + result.statusText);
                        //alert("USUARIO O CONTRASEÑA INCORRECTOS");
                        
                    }
                });
            });
        }
        else {
            //console.log(es_chrome)
            window.location = "/Pagina.html";
        }
    </script>
</body>
</html>
