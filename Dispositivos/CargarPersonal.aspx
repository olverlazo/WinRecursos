<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="CargarPersonal.aspx.vb" Inherits="Dispositivos_CargarPersonal" %>





<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--    <link href="../assets/css/styles.css" rel="stylesheet" />--%>

    
<%--    <link href="../bower_components/sweetalert2/sweetalert2.min.css" rel="stylesheet" />--%>
     <form id="form1" runat="server">
     <section class="content-header">
        <h1>DISPOSITIVOS          
        </h1>
    </section>
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
                                              <%--<a class="btn btn-primary margin-bottom " id="conexion"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Conectar...</a>
                                            <a class="btn btn-primary btn-warning margin-bottom" id="desconexion"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Desconectar...</a>--%>

                                            <button type="button" class="btn btn-primary margin-bottom " id="conexion"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Conectar...</button>

                                        <button type="button" class="btn btn-primary btn-warning margin-bottom" id="desconexion"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Desconectar...</button>
                                       
                                       </article>
                                   </div>


                                      <div class="col-md-4">
                                          <article class="l-design-widhtin">
                                              <%-- <div class="modal-body">--%>
                                              <asp:Label ID="Label2" runat="server" Text="Dispositivo Desconectado" Visible="False"></asp:Label>
                                              <label id="dispoconect" class="box-title"></label>
                                                <label id="nombredispo" class="box-title"></label>
                                                  
                                                      <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                                                      
                                                  
                                              <%--   </div>--%>
                                          </article>
                                   </div>

                               </div>
                           </div>
                       </div>                      
                   </div>
               </div>

                <div class="col-md-6">
                   <div class="box box-primary">
                       <div class="box-header with-border">
                           <h3 class="box-title">&nbsp;Buscar</h3>
                           <input type="text" class="form-control" placeholder="Nombre/Apellido/C.I." id="txtvalor" autocomplete="off" />
                       </div>
                           <div class="box-body">
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
                   </div>
               </div>
                <div class="col-md-6">
                   <div class="box box-primary">
                       <div class="box-header with-border">
                           <div class="modal-body">
                             <%--  <div class="row">
                                   <div class="col-md-6">--%>
                                       <article >
                                           <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped"></asp:GridView>
                                           <table id="TableListaPersonal" class="table table-bordered table-striped">
                                               <thead>
                                                   <tr>
                                                       <th>id</th>
                                                       <th>Nombre</th>
                                                       <th>Password</th>
                                                       <th>Privilegio</th>
                                                       <th>Statu</th>
                                                       <th></th>
                                                   </tr>
                                               </thead>
                                                 <tbody id= "result"></tbody>
                                           </table>

                                           <%--         <asp:Button ID="bnConectar" runat="server" Text="Conectar..." CssClass="btn btn-primary margin-bottom"></asp:Button>
                                           <asp:Button ID="bnDesconectar" runat="server" Text="Desconectar..." CssClass="btn btn-primary btn-warning margin-bottom" Enabled="False"></asp:Button>--%>
                                       </article>
                                 <%--  </div>

                               </div>--%>
                           </div>
                       </div>                      
                   </div>
               </div>
               
               <!-- /.col -->
           </div>

     
        <!-- Loading Modal -->
           <div class="modal fade" id="loadingModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="loadingModalLabel" aria-hidden="true">
               <div class="modal-dialog">
                   <div class="modal-content">
                       <div class="modal-header">
                           <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                       <div class="modal-body">
                           ...
                       </div>
                       <div class="modal-footer">
                           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                           <button type="button" class="btn btn-primary">Understood</button>
                       </div>
                   </div>
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


<script src="js/JSCArgarPersonal.js"></script>
    <script >
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
                

            $(function () {
            $('#example1').DataTable()
        })
    </script>
   
       
    
</asp:Content>

