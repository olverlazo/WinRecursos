<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="ListaDispositivos.aspx.vb" Inherits="Dispositivos_ListaDispositivos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <link href="../bower_components/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <form id="form1" runat="server">

 

    <section class="content-header">
        <h1>DISPOSITIVOS          
        </h1>
    </section>


        <%--  <section class="content">--%>
     <section class="content">
        <div class="row">
            <!-- /.col -->
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <article class="l-design-widhtin">
                                        <label class="inputin">
                                            <select id="dispositivo" name="dispositivo" class="inputin__fieldin" data-validate="required" data-validate-message="Dispositivo">
                                                <option></option>
                                            </select>
                                            <span class="inputin__labelin">Dispositivo</span>
                                        </label>
                                        <asp:Button ID="bnConectar" runat="server" Text="Conectar..." CssClass="btn btn-primary margin-bottom" Visible="False"></asp:Button>
                                        <asp:Button ID="bnDesconectar" runat="server" Text="Desconectar..." CssClass="btn btn-primary btn-warning margin-bottom" Enabled="False" Visible="False"></asp:Button>


<%--                                         <a class="btn btn-primary margin-bottom" id="conexion"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Conectar...</a>
                                         <a class="btn btn-primary btn-warning margin-bottom" id="desconexion"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Desconectar...</a>--%>
                                     

                                        <button type="button" id="conexion" class="btn btn-primary margin-bottom"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Conectar...</button>

                                        <button type="button" id="desconexion" class="btn btn-primary btn-warning margin-bottom"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Desconectar...</button>

                                    </article>
                                </div>

                            </div>

                          

                              
                            
</div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div id="Div1">
                            <div>
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">

                                            <h4 class="modal-title">
                                                <asp:Label ID="Label2" runat="server" Text="Dispositivo Desconectado" Visible="False"></asp:Label>
                                                <label id="Label21" class="box-title"></label>
                                            </h4>
                                        </div>
                                        <div class="modal-body">

                                            <dl id="mdatos" class="dl-horizontal">
                                                <dt class="box-title">Numero de dispositivo:</dt>
                                                <dd>
                                                    <asp:Label ID="ndisp" runat="server"></asp:Label>
                                                    <label id="ndisp1" class="box-title"></label>
                                                </dd>
                                                <dt class="box-title">Nombre del Dispositivo:</dt>
                                                <dd>
                                                    <asp:Label ID="Label1" runat="server"></asp:Label>
                                                    <label id="Label11" class="box-title"></label>
                                                </dd>
                                                <dt class="box-title">Modelo :</dt>
                                                <dd>
                                                    <asp:Label ID="modelo" runat="server" ></asp:Label>
                                                    <label id="modelo1" class="box-title"></label>
                                                </dd>
                                                <dt class="box-title">Numero de Serie:</dt>
                                                <dd>
                                                    <asp:Label ID="ns" runat="server" ></asp:Label>
                                                    <label id="ns1" class="box-title"></label>
                                                </dd>
                                                <dt class="box-title">Mac :</dt>
                                                <dd>
                                                    <asp:Label ID="dmac" runat="server" ></asp:Label>
                                                    <label id="dmac1" class="box-title"></label>
                                                </dd>

                                                <dt class="box-title">Total Marcaciones :</dt>
                                                <dd>
                                                    <asp:Label ID="totalmar" runat="server" ></asp:Label>
                                                    <label id="totalmar1" class="box-title"></label>
                                                </dd>
                                                <dt class="box-title">Reg. Descargados :</dt>
                                                <dd>
                                                    <asp:Label ID="regdescarga" runat="server" ></asp:Label>
                                                    <label id="regdescarga1" class="box-title"></label>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                    <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                                         <asp:Button ID="descargar" runat="server" Text="Descargar" CssClass="btn btn-primary btn-success margin-bottom" Enabled="False" Visible="False"></asp:Button>
                                         <button type="button" id="btnDescargar" class="btn btn-primary btn-success margin-bottom"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Descargar</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                                <asp:Label ID="lblfecha1" runat="server" ></asp:Label>
                            </div>
                        </div>                        
                        </div>
                </div>
            </div>
            <!-- /.col -->
        </div>

     
         <%--MODAL  adicionar nuevo--%>
            <div id="form">
                <div class="modal fade" id="modal-nuevo" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-mg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Nuevo dispositvo</h4>
                            </div>
                            <div class="modal-body">
                                                           
                                <div class="row">
                                    <div class="col-md-8">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="descripcion" type="text" data-validate="required" data-validate-message="dias" placeholder=" " maxlength="2" autocomplete="off" />
                                                <span class="inputin__labelin">Descripcion</span>
                                            </label>
                                        </article>
                                    </div>

                                    <div class="col-md-8">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="IP" type="text" data-validate="required" data-validate-message="dias" placeholder=" " maxlength="2" autocomplete="off" />
                                                <span class="inputin__labelin">Direccion IP</span>
                                            </label>
                                        </article>
                                    </div>

                                    <div class="col-md-8">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="puerto" type="text" data-validate="required" data-validate-message="dias" placeholder=" " maxlength="2" autocomplete="off" />
                                                <span class="inputin__labelin">Puerto</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                            </div>                            
                        </div>
                        <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                            <input type="submit" value="Guardar" id="GuardarDatos" class="btn btn-primary example-the-1" />
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
            </div>            
    </section>
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
       <script src="js/JSListaDispositivo.js"></script>

    <script type="text/javascript">
        function mensaje() {
            alert($('select[name=dispositivo]').val())


            console.log("entra")
            //$.ajax({
            //    type: "POST",
            //    contentType: "application/json; charset=utf-8",
            //    url: "ListaDispositivos.aspx/Lista_Dispositivo",
            //    data: '{"v1": "' + id + '"}',
            //    dataType: "json",
            //    success: function (result) {
            //        $('#dispositivo').empty();
            //        $('#dispositivo').append("<option value=''>--Seleccionar--</option>");
            //        $.each(result.d, function (key, value) {
            //            $("#dispositivo").append($("<option></option>").val(value.id_dispositivo).html(value.nombre));
            //        });
            //    },
            //    error: function ajaxError(result) {
            //        alert(result.status + ' : ' + result.statusText);
            //    }
            //});
            return true;
        };

        function cargar(){
            console.log("entra")
            return true;
        };
         const fgp_loader = document.createElement("fgp-loader");
        fgp_loader.innerHTML =`
        <style>      
            fgp-loader {
            font: calc((100vh + 100vw)/ 100) verdana;
            color: #777;
            background: #fffd;
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            z-index: 9;
        }
        fgp-loader .spinner {
            font-size: calc(1vw / 2);
            border: 1em solid;
            border-top: 1em solid transparent;
            width: 30em;
            max-width: 5rem;
            height: 30em;
            max-height: 5rem;
            border-radius: 50%;
            animation: rotate 1s ease infinite;
        }
                    @keyframes rotate {
            100% { transform: rotate(360deg);    }
        }
        fgp-loader .title { animation: opacity 2s infinite; }
                    @keyframes opacity {
            50% {  opacity: 0.2;  }
        }
                </style>
                <div class="spinner"></div>
                <h2 class="title">Cargando...</h2>
                `;
                //document.body.appendChild(fgp_loader);

                //window.addEventListener("load", () => {
                //    fgp_loader.remove();
                //});
                
    </script>
 
    
 
</asp:Content>

