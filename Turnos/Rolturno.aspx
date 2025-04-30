<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Rolturno.aspx.vb" Inherits="Turnos_Rolturno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Rol Turno</title>
        <link href="/css/StyleSheetImprimir.css" rel="stylesheet" />
    <%--<link href="../bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" />--%>
</head>
<body>



    <form id="form1" runat="server">
       
 <button class="myButton" id="imprimir" type="button">Imprimir</button>
         <div id="Div1" style="padding: 1cm; width: 30cm">
        <div id="HTMLPdf"  style="padding: 1cm; width: 30cm">
            <table style="width: 100%;">
                <tr style="border-bottom-style: solid; border-bottom-width: 1px;">
                    <td style="padding: 1px; width: 20%; border-bottom-style: solid; border-bottom-width: 1px;">
                        <img src="../imagenes/hg.jpg" style="margin: 1px; width: 40%" />
                    </td>
                    <td style="width: 60%; border-bottom-style: solid; border-bottom-width: 1px;">
                        <p class='MsoNormal' style='margin: 1px; text-align: center;'>
                            <b><span  style='font-size: 14pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt; text-align: center;'>
                                <br>
                                HOSPITAL GENERAL SAN JUAN
                                <br>
                                DE DIOS - ORURO</span></b>
                        </p>
                    </td>
                    <td style="width: 20%; border-bottom-style: solid; border-bottom-width: 1px;">&nbsp;
                        <p style='margin: 1px; text-align: center;'>
                            <b><span style='font-size: 9pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt; text-align: center;'>Fecha: </span></b>
                            <br>
                            <b><span style='font-size: 9pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt; text-align: center;'>Hora: </span></b>
                            <br>
                            <b><span style='font-size: 9pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt; text-align: center;'>Usuario: </span></b>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <dl id="mdatos" class="dl-horizontal">
                            <dt class="box-title">NOMBRE:</dt>
                            <dd>
                                <label id="nombres"></label>
                            </dd>
                            <dt class="box-title">C.I.:</dt>
                            <dd>
                                <label id="ci"></label>
                            </dd>
                            <dt class="box-title">CONTRATO:</dt>
                            <dd>
                                <label id="contrato"></label>
                            </dd>
                            <dd>
                                <label id="categoria"></label>
                            </dd>
                            <dd>
                                <label id="ff"></label>
                            </dd>
                            <dt class="box-title">CARGO:</dt>
                            <dd>
                                <label id="bloque"></label>
                            </dd>
                            <dd>
                                <label id="cargo"></label>
                            </dd>
                        </dl>                    
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>


            <div class="box-body info-box bg-gray">
               
               
            </div>
            
            <div id="Div" class="datagrid">
                <table id="TablePDF">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Turno</th>
                            <th>Tipo</th>
                            <th>Fecha</th>
                            <th>Ingreso</th>
                            <th>Salida</th>
                            <th>Ingreso</th>
                            <th>Salida</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>

     </div>
          <embed id="vistaPrevia" type="application/pdf" width="400" height="400" />


         
    </form>
</body>
    
    <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script src="../bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    
<script src="../js/html2pdf.bundle.min.js"></script>
          <script >    
              //document.getElementById("Div1").style.display = 'none';
              var nombre 
              var ci1
              var idusuario
              var mes
              $(document).ready(function () {
                idusuariopersonal = '<%= Session("idusuario").ToString%>';
                  nombre = '<%= Request.QueryString("nombre")%>';
                  ci1= '<%= Request.QueryString("ci")%>';
                  idusuario= '<%= Request.QueryString("idusuario")%>';
                  mes= '<%= Request.QueryString("mes")%>';              
                  VerCronograma();
                  get_ListaTurno();
                  //$("#imprimir").click();
                  //generarPDF();
               });

              //window.onload = function () {
              //    generarPDF();
              //}

          

              function VerCronograma() {
                  $('#nombres').text(nombre);
                  $.ajax({
                      type: 'POST',
                      url: "AdicionarTurnos.aspx/CargarDatos",
                      data: '{"v1": "' + ci1 + '"}',
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (response) {                                 
                          var campo = document.getElementById('contrato');
                          var campo1 = document.getElementById('bloque');
                          if (response.d[3] == 'error') {
                              campo.style.color = "red";
                              campo1.style.color = "red";                    
                              $('#idpersona').text(response.d[1]);
                              $('#ci').text(response.d[2]);
                              $('#contrato').text('SIN CONTRATO VIGENTE');
                              $('#categoria').text('');
                              $('#ff').text('');
                              $('#bloque').text('SIN CARGO VIGENTE');
                              $('#cargo').text('');
                          }
                          else {
                              campo.style.color = "WHITE";
                              campo1.style.color = "WHITE";
                              //idpersona1 = response.d[0]
                              $('#idpersona').text(response.d[1]);
                              $('#ci').text(response.d[2]);
                              $('#contrato').text(response.d[3]);
                              $('#categoria').text(response.d[4]);
                              $('#ff').text(response.d[5]);
                              $('#bloque').text(response.d[6]);
                              $('#cargo').text(response.d[7] + " - " + response.d[8]);
                          }            
                      },
                      error: function (XMLHttpRequest, textStatus, errorThrown) {
                          var err = eval("(" + XMLHttpRequest.responseText + ")");
                          $.alert("Error!: " + err.Message)
                      }
                  });
              };
          
              
              function get_ListaTurno() {
                  //console.log(idusuario)
                  //console.log(mes)
                  $.ajax({
                      type: 'POST',
                      url: "AdicionarTurnos.aspx/ListarTurnos",
                      data: '{"v1": "' + idusuario + '","v2": "' + mes + '"}',
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (json) {
                          var table1 = $("#TablePDF").DataTable({
                              'paging': false,
                              'lengthChange': false,
                              'searching': false,
                              'ordering': false,
                              'info': false,
                              'autoWidth': false,
                              language: {
                                  "processing": "Procesando...",
                                  "lengthMenu": "Mostrar _MENU_ registros",
                                  "zeroRecords": "No se encontraron resultados",
                                  "emptyTable": "Ningún dato encontrado",
                                  "info": "Registros del _START_ al _END_ de un total de _TOTAL_",
                                  "infoEmpty": "Registros del 0 al 0 de un total de 0",
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
                              "data": json.d.data,
                              "columns": [
                                 { "data": "id_turno" },
                                 { "data": "aux" },
                                 { "data": "horario" },
                                 { "data": "fecha", type: 'date' },
                                 { "data": "hora1" },
                                 { "data": "hora2" },
                                 { "data": "hora3" },
                                 { "data": "hora4" },                   
                                 { "defaultContent": "<button type='button' title='ELIMINAR' id='anular' class='btn btn-danger btn-xs checkbox-toggle' data-target='#modal-nuevo'><i class='fa fa-times'></i>" },
                              ],
                          });
                      },
                      error: function (XMLHttpRequest, textStatus, errorThrown) {
                          var err = eval("(" + XMLHttpRequest.responseText + ")");
                          alert("Error!: " + err.Message)
                      }
                  });
              }



            function generarPDF() {
                //html2pdf().from(document.body).save('miDocumento.pdf')
                var elemento = document.getElementById('HTMLPdf');
                var opt = {
                    //margin: 1,
                    filename: 'RolTurno.pdf',
                    image: { type: 'pdf', quality: 0.98 },
                    html2canvas: { scale: 2 },
                    jsPDF: {
                        unit: 'mm', format: 'letter', orientation: 'portrait'
                    }
                    //, margin: { top: 1, right: 3, bottom: 2, left: 2 }
                };
                //html2pdf().set(opt).from(elemento).save();
                html2pdf().set(opt).from(elemento).toPdf().get('pdf').then(
                    function (pdf) {
                        //var newWindow = window.open(pdf.output('bloburl'), '_blank');
                        document.querySelector('#vistaPrevia').setAttribute('src', pdf.output('bloburl'));
                        console.log(pdf.output('bloburl'))
                        //if (newWindow) {
                        //    newWindow.onload = () =>{
                        //        newWindow.print()
                        //    }
                        //}
                    }
                      )                      
            }

         

            //document.querySelector('#pdffFile').addEventListener('change', () => {
            //var pdffFileURL = URL.createObjectURL(pdffFile) + "#toolbar=0";

            //document.querySelector('#vistaPrevia').setAttribute('src', pdffFileURL);
            //})


            //obtiene los valores de la fila seleccionada
            $(document).on('click', '#imprimir', function () {               
                generarPDF();              
           });


    </script>
</html>
