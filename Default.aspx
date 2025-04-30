<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>
<%--<html lang="en" xmlns:th="http://www.thymeleaf.org">--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <%--<link rel="stylesheet" type="text/css" href="static/css/solid.css"/>--%>

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
                        <input type="text" class="form-control" placeholder="Nombre de usuario" name="usuario" id="usuario"/>
                    </div>
                    <div class="form-group" id="contrasena-group">
                        <input type="password" class="form-control" placeholder="Contraseña" name="password" id="password"/>
                    </div>
                    <button type="button" id="aceptar" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i>  Ingresar </button>

                </form>
                <div class="col-12 forgot">
                    <a href="http://www.hospitalgeneraloruro.com.bo">Hospital General San Juan De Dios</a>
                    <a href="#">Unidad de Sistemas - Informatica</a>
                </div>
            </div>
        </div>
    </div>


    <script src="bower_components/jquery/dist/jquery.min.js"></script>
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript">
        var es_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
        var es_firefox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
        if (es_chrome || es_firefox) {
            $('#aceptar').click(function (e) {
                e.preventDefault(); // Usamos esta línea para cancelar el postback que el botón crea
                var usuario = $('#usuario').val();
                var password = $('#password').val();
                $.ajax({
                    type: 'POST',                               // tipo de llamada (POST, GET)
                    url: 'WebService.asmx/loginAcceso',     // el URL del método que vamos a llamar
                    data: '{"v1": "' + usuario + '", "v2": "' + password + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",                           // tipo de datos enviados al servidor
                    success: function (response) {
                        if (response.d[0] == "error") {
                            alert("USUARIO O CONTRASEÑA INCORRECTOS");
                            //console.log(response.d)                            
                        } else {
                            window.location = "../KardexPersonal3.aspx"
                            //if (response.d[30] == "false") {
                            //    alert("USTED YA REGISTRO SUS DATOS");
                            //    window.location = "/Ev_ddjj.aspx";
                            //}
                            //else {
                            //    window.location = "/Ev_Kardex.aspx";
                            //}
                        }
                    },
                    error: function (result) {          // función que se va a ejecutar si el pedido falla
                        alert("ERROR " + result.status + ' ' + result.statusText);
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
