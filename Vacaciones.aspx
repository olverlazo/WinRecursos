<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Vacaciones.aspx.vb" Inherits="Vacaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content-header">
        <h1>VACACIONES SOLICITADAS          
        </h1>
    </section>

    <div id="Div4" style="padding: 10px; margin: 2px 3px 2px 3px; display: none;">
        <div id="HTMLPdf" style="padding: 1px 50px 1px 50px; margin: 2px 3px 2px 3px">
             <br> <br> <br> <br>
            <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; text-align: center;'>
                <b><span style='font-size: 8.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt; text-align: center;'>HOSPITAL GENERAL SAN JUAN DE DIOS - ORURO </span></b>
            </p>

            <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; text-align: center;'>
                <b><span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>AREA DE RR.HH.</span></b>
            </p>
            <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; text-align: center;'>
                FORM-SIP-003
            </p>
            <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; text-align: center;'>
                <br>
                <br>
            </p>

            <table style='width: 534pt; border-collapse: collapse; border: none; margin-left: 5.25pt; margin-right: 5.25pt'>
                <tr>
                    <td style='border: none; padding: 0cm 0cm 0cm 0cm' colspan="4">
                        <p align="center" style='margin-bottom: 0cm; margin-bottom: .0001pt'>
                            <span><span style='font-size: 14.0pt; line-height: 115%; font-family: "Britannic Bold","sans-serif"; letter-spacing: 1.0pt'><strong>FORMULARIO DE SOLICITUD DE VACACION <br> O DIAS CUENTA VACACION </strong></span></span>
                        </p>                    
                    </td>
                </tr>


                <tr style='height: 19.35pt'>
                    <td style='border: none; border-bottom: solid black 1.0pt; width: 50%;' colspan="2">Nº:<label id="numero"></label>
                    </td>
                    <td style='border: none; border-bottom: solid black 1.0pt; width: 50%;' colspan="2">Fecha de Registro:
                        <label id="FechaRec"></label>
                    </td>
                </tr>


                <tr style='height: 17.05pt'>
                    <td colspan="4" style='width: 501.55pt; border: solid black 1.0pt; border-top: none; background: #D9D9D9; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.05pt'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>DATOS DEL PERSONAL.-</span></b>
                        </p>
                    </td>
                </tr>
                <tr style='height: 24pt'>
                    <td colspan="4" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Nombre y Apellido:</span></b>
                            <label id="nombre"></label>
                        </p>
                    </td>
                </tr>
                <tr style='height: 24pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>C.I.:</span></b>
                            <label id="cipdf"></label>
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;' colspan="2">
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Bloque:</span></b>
                            <label id="Label2"></label>
                        </p>
                    </td>
                    <td style='width: 33.33%; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Categoria:</span></b>
                            <label id="Label3"></label>
                        </p>
                    </td>
                </tr>
                <tr style='height: 24pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Tipo de Personal:</span></b>
                            <label id="tpersonal"></label>
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;' colspan="2">
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Unidad/Servicio:
                            </span></b>
                            <label id="unidad"></label>
                        </p>
                    </td>
                    <td style='width: 33.33%; border-top: none; border-left: none; border-bottom: solid black 1.0pt; border-right: solid black 1.0pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Cargo:</span></b>
                            <label id="Label4"></label>
                        </p>
                    </td>
                </tr>

            </table>
            
            <table style='width: 534pt; border-collapse: collapse; border: none; margin-left: 5.25pt; margin-right: 5.25pt'>


                <tr style='height: 16.2pt'>
                    <td colspan="4" style='width: 501.55pt; border: solid black 1.0pt; border-top: none; background: #D9D9D9; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.05pt'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>DATOS DE LA VACACION.-</span></b>
                        </p>
                    </td>
                </tr>
                <tr style='height: 24pt; width: 100%;'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%; text-align: right'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Tipo de Vacacion:</span></b>
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'>
                        <label id="tvacacion"></label>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%; text-align: right'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Gestion:</span></b>
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'>
                        <label id="gestion"></label>
                    </td>
                </tr>

                <tr style='height: 24pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%; text-align: right'>
                        <p style="margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;">
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Desde Fecha:</span></b>
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'>
                        <label id="fecha1">
                        </label>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%; text-align: right'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Hasta Fecha:</span></b>
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'>
                        <label id="fecha2"></label>
                    </td>
                </tr>

                <tr style='height: 24pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%; text-align: right'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Fecha de Incorporacion:</span></b>
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'>
                        <label id="fecha3"></label>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%; text-align: right'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Cantidad de dias:</span></b>
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'>
                        <label id="cantidaddias"></label>
                    </td>
                </tr>


                <tr style='height: 24pt'>
                    <td colspan="4" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Observacion:</span></b>
                            <label id="observacion"></label>
                        </p>
                    </td>
                </tr>
            </table>

            <table style='width: 534pt; border-collapse: collapse; border: none; margin-left: 5.25pt; margin-right: 5.25pt'>

                <tr style='height: 16.2pt'>
                    <td colspan="3" style='width: 501.55pt; border: solid black 1.0pt; border-top: none; background: #D9D9D9; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.05pt'>
                        <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                            <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>AUTORIZADO POR.-</span></b>
                        </p>
                    </td>
                </tr>

                <tr>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 33.33%; text-align: right'></td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 33.33%; text-align: right'></td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 33.33%; text-align: right'></td>
                </tr>

                <tr style='height: 24pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 33.33%; text-align: center'>Interesado</td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 33.33%; text-align: center'>Inmediato Superiro</td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 33.33%; text-align: center'>Jefe de Personal</td>
                </tr>


                <tr style='height: 52pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 33.33%; text-align: right'>&nbsp;</td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 33.33%; text-align: right'>&nbsp;</td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 33.33%; text-align: right'>&nbsp;</td>
                </tr>


            </table>

            <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; text-align: center;'>
                <br>
                *EL PRESENTE FORMUARIO NO DEBE CONTENER BORRONES, ENMIENDAS Y/O CORRECCIONES
            </p>
            <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; text-align: center;'>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
            </p>            
            <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; text-align: center;'>
                <b style='border-top-style: solid; border-top-color: #000000;'><span lang="ES" style='font-size: 9.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>Director                      
                </span></b>
            </p>
            <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; text-align: center;'>
                <b><span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>FIRMA Y SELLO
                </span></b>
            </p>
        </div>
    </div> 

    <section class="content">
        <div class="row">
            <div class="col-md-4">
                <div class="box box-success">
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
            <!-- /.col -->
            <div class="col-md-8">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <div class="box-body info-box bg-gray">
                            <label id="idpersona" class="box-title">0</label>
                            <dl id="mdatos" class="dl-horizontal">
                                <dt class="box-title">NOMBRE:</dt>
                                <dd>
                                    <label id="nombres" class="box-title"></label>
                                </dd>
                                <dt class="box-title">C.I.:</dt>
                                <dd>
                                    <label id="ci" class="box-title"></label>
                                </dd>
                                <dt class="box-title">CONTRATO:</dt>
                                <dd>
                                    <label id="contrato" class="box-title"></label>
                                </dd>
                                <dd>
                                    <label id="categoria" class="box-title"></label>
                                </dd>
                                <dd>
                                    <label id="ff" class="box-title"></label>
                                </dd>
                                <dt class="box-title">CARGO:</dt>
                                <dd>
                                    <label id="bloque" class="box-title"></label>
                                </dd>
                                <dd>
                                    <label id="cargo" class="box-title"></label>
                                </dd>
                            </dl>
                        </div>
                        <a class="btn btn-primary margin-bottom " id="NuevaVacacion"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Nuevo Registro</a>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="TableVacaciones" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Nro</th>
                                    <th>Gestion</th>
                                    <th>Tipo</th>
                                    <th>Dias</th>
                                    <th>Fecha Desde</th>
                                    <th>Fecha Hasta</th>
                                    <th>Fecha Incorporacion</th>
                                    <th>Observacion</th>
                                    <th>Estado</th>
                                    <th></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.col -->
        </div>

     
         <%--MODAL  adicionar VACACION--%>
            <div id="form">
                <div class="modal fade" id="modal-nuevo" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-mg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Vacaciones</h4>
                            </div>
                            <div class="modal-body">

                                  <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="tipo" name="tipo" class="inputin__fieldin" required data-validate="required" data-validate-message="Tipo">                                               
                                                    <option value="">--Seleccionar--</option>
                                                    <option value="0">Dias cuenta vacacion</option>
                                                    <option value="1">Vacacion</option>
                                                </select>
                                                <span class="inputin__labelin">Tipo</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>

                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="listagestion" name="listagestion" class="inputin__fieldin" data-validate="required" data-validate-message="gestion" onchange="opcion()">
                                                </select>
                                                <span class="inputin__labelin">Gestion</span>
                                            </label>
                                        </article>
                                    </div>

                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <input class="inputin__fieldin" id="dias" type="text" data-validate="required" data-validate-message="dias" placeholder=" " maxlength="2" autocomplete="off" />
                                                <span class="inputin__labelin">Dias</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <textarea id="resumen" name="resumen" class="inputin__fieldin" data-validate="required" data-validate-message="Descripcion" rows="4" placeholder="Resumen..." maxlength="250"></textarea>
                                                <span class="inputin__labelin">Descripcion</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>

                                <div class="row">
                                    
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Desde:</label>
                                                <div id="datepicker1" class="input-group date" data-date-format="dd/mm/yyyy">
                                                    <input id="indate1" class="form-control" type="text" readonly />
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Hasta:</label>
                                                <div id="datepicker2" class="input-group date" data-date-format="dd/mm/yyyy">
                                                    <input id="indate2" class="form-control" type="text" readonly />
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                </div>


                                   <div class="row">
                                    
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Fecha de incorporacion:</label>
                                                <div id="datepicker3" class="input-group date" data-date-format="dd/mm/yyyy">
                                                    <input id="indate3" class="form-control" type="text" readonly />
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
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


          <%--MODAL  ANULAR VACACION--%>
        <div id="Div1">
            <div class="modal fade" id="modal-anular" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-mg">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Anular Vacacion</h4>
                        </div>
                        <div class="modal-body">
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                                <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Nombre y Apellido:</span></b>
                                <label id="nombrea"></label>
                            </p>

                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                                <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Gestion:</span></b>
                                <label id="gestiona"></label>
                            </p>

                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                                <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Tipo de Vacacion:</span></b>
                                <label id="tipoa"></label>
                            </p>

                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                                <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Desde Fecha:</span></b>
                                <label id="fecha1a"></label>
                            </p>

                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                                <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Hasta Fecha:</span></b>
                                <label id="fecha2a"></label>
                            </p>

                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                                <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Dias:</span></b>
                                <label id="diasa"></label>
                            </p>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal;'>
                                <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif";'>Observacion:</span></b>
                                <label id="observaciona"></label>
                            </p>
                        </div>
                    </div>
                    <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                        <input type="submit" value="Anular" id="GuardaAnular" class="btn btn-primary example-the-1" />
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
        </div>


          <div id="Div3">
            <div class="modal fade" id="modal-PDF" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Vacacion</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-6">
                                      <embed id="vistaPrevia" type="application/pdf" width="870" height="500" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
        </div>
     
    </section>
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
        <!-- iCheck 1.0.1 -->
        <script src="plugins/iCheck/icheck.min.js"></script>
   
        <script src="SimpleAjaxUploader.js"></script>

        <!-- Script Personalizado -->
        <!-- Script Personalizado -->
        <script src="js/JSVacaciones.js"></script>

      <script>
          var idusuariopersonal
          $(document).ready(function () {
              idusuariopersonal = '<%= Session("idusuario").ToString%>';            
          });


          function generarPDF() {
              //html2pdf().from(document.body).save('miDocumento.pdf')
              var elemento = document.getElementById('HTMLPdf');
              var opt = {
                  margin: 1,
                  filename: 'Licecia.pdf',
                  image: { type: 'pdf', quality: 0.98 },
                  html2canvas: { scale: 2 },
                  jsPDF: { unit: 'mm', format: 'letter', orientation: 'portrait' }
              };
              //html2pdf().set(opt).from(elemento).save();
              html2pdf().set(opt).from(elemento).toPdf().get('pdf').then(
                  function (pdf) {
                      //var newWindow = window.open(pdf.output('bloburl'), '_blank');
                      document.querySelector('#vistaPrevia').setAttribute('src', pdf.output('bloburl'));
                      //console.log(pdf.output('bloburl'))
                      //if (newWindow) {
                      //    newWindow.onload = () =>{
                      //        newWindow.print()
                      //    }
                      //}
                  }
                    )
          }



          //obtiene los valores del vacacion
          $(document).on('click', '#imprimir', function () {
              if ($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["estado"] == 'ANULADO') {
                  //$.alert("- La Licencia esta anulada")
                  Swal.fire({
                      icon: "error",
                      title: "Error",
                      text: 'La Vacacion esta anulada',
                  });
              } else {
                  var idVacacion = $("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["idVacacion"];
                  $('#numero').text(idVacacion)
                  $('#nombre').text(nombres.textContent)
                  $('#cipdf').text(ci.textContent)
                  $('#tvacacion').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["tipovacacion"])
                  $('#gestion').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["gestion"])
                  $('#fecha1').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["fecha1"])
                  $('#fecha2').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["fecha2"])
                  $('#fecha3').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["fechaIncorporacion"])
                  $('#cantidaddias').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["dias"])
                  $('#observacion').text($("#TableVacaciones").DataTable().row($(this).parents("tr")).data()["observacion"])

                  $("#modal-PDF").modal("show");
                  generarPDF();
              }
          });



          $(function () {
              $("#datepicker1").datepicker({
                  autoclose: true,
                  todayHighlight: true,
                  todayBtn: "linked",
              }).datepicker('update', new Date());

              $("#datepicker2").datepicker({
                  autoclose: true,
                  todayHighlight: true,
                  todayBtn: "linked",
              }).datepicker('update', new Date());

              $("#datepicker3").datepicker({
                  autoclose: true,
                  todayHighlight: true,
                  todayBtn: "linked",
              }).datepicker('update', new Date());
          });
       </script>
</asp:Content>

