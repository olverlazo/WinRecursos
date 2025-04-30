<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Permisos.aspx.vb" Inherits="Permisos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content-header">
        <h1>REGISTRO DE PERMISOS/SALIDAS          
        </h1>
    </section>

    <div id="Div4" style="padding: 10px; margin: 2px 3px 2px 3px; display: none;">
        <div id="HTMLPdf" style="padding: 1px 50px 1px 50px; margin: 2px 3px 2px 3px">
            <br/>
            <div id="formIMP">
                <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal'>
                    <b><span style='font-size: 8.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>HOSPITAL GENERAL SAN JUAN DE DIOS - ORURO</span></b>
                </p>

                <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal' >
                    <b><span style='font-size: 9.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'></span></b><span
                            style='font-size: 9.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>: AREA DE RR.HH.</span>
                </p>

                <table style='width: 534pt; border-collapse: collapse; border: none; margin-left: 5.25pt; margin-right: 5.25pt'>
                    <tr>
                        <td style='border-style: none; border-color: inherit; border-width: medium; padding: 0cm 0cm 0cm 0cm; height: 12pt;' colspan="6">
                            <p align="center" style='margin-bottom: 0cm; margin-bottom: .0001pt'>
                                <span><span
                                    style='font-size: 14.0pt; line-height: 115%; font-family: "Britannic Bold","sans-serif"; letter-spacing: 1.0pt'><strong>VOLETA DE PERMISO Y/O SALIDA</strong></span></span>
                            </p>
                        </td>
                    </tr>
                    <tr height: 19.35pt'>
                        <td style='border: none; border-bottom: solid black 1.0pt'
                            colspan="6">Nº:<label id="numero"></label>
                        </td>
                    </tr>
                    <tr style='height: 17.05pt'>
                        <td colspan="6" style='width: 501.55pt; border: solid black 1.0pt; border-top: none;  background: #D9D9D9;   padding: 0cm 5.4pt 0cm 5.4pt; height: 17.05pt'>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                                <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>DATOS DEL PERSONALES.-</span></b>
                            </p>
                        </td>
                    </tr>
                    <tr style='height: 24pt'>
                        <td colspan="6" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                                <b>
                                    <span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Nombre y Apellido:
                                          &nbsp;&nbsp<label id="nombre"></label>
                                    </span>

                                </b>

                            </p>
                        </td>
                    </tr>
                    <tr style='height: 24pt'>
                        <td colspan="2" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%;  padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal'>
                                <b><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>C.I.:</span></b>
                                &nbsp;&nbsp<label id="cipdf"></label>
                            </p>
                        </td>
                        <td colspan="2" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Bloque:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp<label id="Label2"></label>
                            </p>
                        </td>
                        <td colspan="2" style='width: 33.33%; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt'>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Categoria:<span style='mso-spacerun: yes'>  </span></span></b>
                                &nbsp;&nbsp
                                <label id="Label3"></label>
                            </p>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td colspan="2" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Tipo de Personal:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp<label id="tpersonal"></label>
                            </p>
                        </td>
                        <td colspan="2" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Unidad/Servicio:
                                    </span></b>
                                &nbsp;&nbsp<label id="unidad"></label>
                            </p>
                        </td>
                        <td colspan="2" style='width: 33.33%; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Cargo:<span style='mso-spacerun: yes'>  </span></span></b>
                                &nbsp;&nbsp<label id="Label4"></label>
                            </p>
                        </td>
                    </tr>

                    <tr style='mso-yfti-irow: 5; height: 16.2pt'>
                        <td colspan="6" valign="top" style='width: 100%; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; background: #D9D9D9; mso-background-themecolor: background1; mso-background-themeshade: 217; padding: 0cm 3.5pt 0cm 3.5pt; height: 16.2pt'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>DATOS DEL PERMISO Y/O SALIDA.-<o:p></o:p></span></b>
                            </p>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td colspan="3" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                            class="auto-style5">
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Fecha De Permiso:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp
                                <label id="fpermiso"></label>
                            </p>
                        </td>
                        <td colspan="3" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Tipo De Permiso:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp
                                <label id="tpermiso"></label>
                            </p>
                        </td>
                    </tr>

                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td colspan="6" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                            class="auto-style5">
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'>
                                    <span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>DE HORA:&nbsp;&nbsp<label id="hora1"></label></span>
                                    <span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>&nbsp;&nbsp A HORA: &nbsp;&nbsp
                                         <label id="hora2"></label>
                                    </span>
                                </b>
                            </p>

                        </td>
                    </tr>

                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td colspan="6" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Motivo De Permiso:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp<label id="Label5"></label>
                            </p>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow: 7; height: 16.2pt'>
                        <td width="836" colspan="6" valign="top" style='width: 501.55pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; background: #D9D9D9; mso-background-themecolor: background1; mso-background-themeshade: 217; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.2pt'>
                            <p class='MsoNormal' style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>AUTORIZADO POR.-<o:p></o:p></span></b>
                            </p>
                        </td>
                    </tr>



                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; text-align: center;'
                            class="auto-style4">Interesado</td>
                        <td colspan="4" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; text-align: center;'
                            class="auto-style4">Inmediato Superiro</td>
                        <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; text-align: center; border: 1px solid #000000;'
                            class="auto-style4">Jefe de Personal</td>
                    </tr>


                    <tr style='mso-yfti-irow: 4; height: 50pt'>
                        <td style='border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 0pt 0cm 0pt; text-align: center; border: 1px solid #000000;'
                            class="auto-style4">&nbsp;</td>
                        <td colspan="4" style='border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0px; height: 24.3pt; border: 1px solid #000000;'
                            class="auto-style4">&nbsp;</td>
                        <td style='border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border: 1px solid #000000;'
                            class="auto-style4">&nbsp;</td>
                    </tr>


                </table>
            </div>

            <br/>
            <br/>
           
            <div id="formIMP1">

                <p style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt'>
                    <b
                        style='mso-bidi-font-weight: normal'><span style='font-size: 8.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>HOSPITAL GENERAL SAN JUAN DE DIOS<o:p> - ORURO</o:p></span></b>
                </p>

                <p class='MsoNormal' style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt'>
                    <b
                        style='mso-bidi-font-weight: normal'><span style='font-size: 9.0pt; mso-bidi-font-size: 14.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>Tel</span></b><span
                            style='font-size: 9.0pt; mso-bidi-font-size: 14.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>: 5275405<o:p></o:p></span>
                </p>

                <table style='width: 534pt; border-collapse: collapse; border: none; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; mso-table-overlap: never; mso-yfti-tbllook: 1184; mso-table-lspace: 7.05pt; margin-left: 5.25pt; mso-table-rspace: 7.05pt; margin-right: 5.25pt; mso-table-anchor-vertical: paragraph; mso-table-anchor-horizontal: column; mso-table-left: -8.85pt; mso-table-top: .05pt; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 12.35pt; mso-row-margin-left: 258.4pt'>
                        <td style='mso-cell-special: placeholder; border: none; padding: 0cm 0cm 0cm 0cm' colspan="6">
                            <p align="center" class='MsoNormal' style='margin-bottom: 0cm; margin-bottom: .0001pt; tab-stops: 10.0cm right 489.05pt'>
                                <span style='mso-bidi-font-weight: normal'><span
                                    style='font-size: 14.0pt; line-height: 115%; font-family: "Britannic Bold","sans-serif"; letter-spacing: 1.0pt'><strong>VOLETA DE PERMISO Y/O SALIDA</strong></span></span>
                            </p>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow: 1; height: 19.35pt; mso-row-margin-left: 258.4pt'>
                        <td style='mso-cell-special: placeholder; border: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1'
                            colspan="6">Nº:
     <label id="numero1"></label>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow: 2; height: 17.05pt'>
                        <td colspan="6" style='width: 501.55pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; background: #D9D9D9; mso-background-themecolor: background1; mso-background-themeshade: 217; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.05pt'>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>DATOS DEL PERSONALES.-<o:p></o:p></span></b>
                            </p>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow: 3; height: 24pt'>
                        <td colspan="6" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'>
                                    <span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Nombre y Apellido:
                                          &nbsp;&nbsp<label id="nombre1"></label>
                                    </span>

                                </b>

                            </p>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td colspan="2" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>C.I.:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp<label id="cipdf1"></label>
                            </p>
                        </td>
                        <td colspan="2" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Bloque:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp<label id="bloque1"></label>
                            </p>
                        </td>
                        <td colspan="2" style='width: 33.33%; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Categoria:<span style='mso-spacerun: yes'>  </span></span></b>
                                &nbsp;&nbsp<label id="categoria1"></label>
                            </p>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td colspan="2" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Tipo de Personal:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp<label id="tpersonal1"></label>
                            </p>
                        </td>
                        <td colspan="2" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"'>Unidad/Servicio:
                                    </span></b>
                                &nbsp;&nbsp<label id="unidad1"></label>
                            </p>
                        </td>
                        <td colspan="2" style='width: 33.33%; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Cargo:<span style='mso-spacerun: yes'>  </span></span></b>
                                &nbsp;&nbsp<label id="cargo1"></label>
                            </p>
                        </td>
                    </tr>

                    <tr style='mso-yfti-irow: 5; height: 16.2pt'>
                        <td colspan="6" valign="top" style='width: 100%; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; background: #D9D9D9; mso-background-themecolor: background1; mso-background-themeshade: 217; padding: 0cm 3.5pt 0cm 3.5pt; height: 16.2pt'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>DATOS DEL PERMISO Y/O SALIDA.-<o:p></o:p></span></b>
                            </p>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td colspan="3" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Fecha De Permiso:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp<label id="fpermiso1"></label>
                            </p>
                        </td>
                        <td colspan="3" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Tipo De Permiso:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp<label id="tpermiso1"></label>
                            </p>
                        </td>
                    </tr>

                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td colspan="6" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                            class="auto-style5">
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'>
                                    <span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>DE HORA:&nbsp;&nbsp<label id="hora11"></label></span>
                                    <span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>&nbsp;&nbsp A HORA: &nbsp;&nbsp
                                         <label id="hora22"></label>
                                    </span>
                                </b>
                            </p>

                        </td>
                    </tr>

                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td colspan="6" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Motivo De Permiso:<span style='mso-spacerun: yes'>   </span></span></b>
                                &nbsp;&nbsp
                                <label id="motivo1"></label>
                            </p>
                        </td>
                    </tr>
                    <tr style='mso-yfti-irow: 7; height: 16.2pt'>
                        <td width="836" colspan="6" valign="top" style='width: 501.55pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; background: #D9D9D9; mso-background-themecolor: background1; mso-background-themeshade: 217; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.2pt'>
                            <p style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b
                                    style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>AUTORIZADO POR.-<o:p></o:p></span></b>
                            </p>
                        </td>
                    </tr>

                    <tr style='mso-yfti-irow: 4; height: 24pt'>
                        <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; text-align: center;'
                            class="auto-style4">Interesado</td>
                        <td colspan="4" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; text-align: center;'
                            class="auto-style4">Inmediato Superiro</td>
                        <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; text-align: center; border: 1px solid #000000;'
                            class="auto-style4">Jefe de Personal</td>
                    </tr>


                    <tr style='mso-yfti-irow: 4; height: 50pt'>
                        <td style='border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 0pt 0cm 0pt; text-align: center; border: 1px solid #000000;'
                            class="auto-style4">&nbsp;</td>
                        <td colspan="4" style='border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0px; height: 24.3pt; border: 1px solid #000000;'
                            class="auto-style4">&nbsp;</td>
                        <td style='border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border: 1px solid #000000;'
                            class="auto-style4">&nbsp;</td>
                    </tr>
                </table>
            </div>
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
                        <div class="box-body info-box bg-aqua">
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
                        <a class="btn btn-primary margin-bottom " id="NuevaSalida"><span class="fa fa-plus-circle"></span>&nbsp&nbsp&nbsp Nuevo Registro</a>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="TableSalidas" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Nro</th>
                                    <th>Fecha Salida</th>
                                    <th>Motivo</th>
                                    <th>Marcacion</th>
                                    <th>Salida</th>
                                    <th>Retorno</th>
                                    <th>Tipo</th>
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

     
         <%--MODAL  NUEVA SALIDA--%>
            <div id="form">
                <div class="modal fade" id="modal-nuevo" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-mg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Permiso/Salida</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="tipo" name="tipo" class="inputin__fieldin" data-validate="required" data-validate-message="Tipo de Salida">
                                                    <option value="">--Seleccionar--</option>
                                                    <option value="1">Oficial</option>
                                                    <option value="2">Particular</option>
                                                    <option value="3">Cumpleaños</option>
                                                    <option value="4">Otros</option>
                                                </select>
                                                <span class="inputin__labelin">Salida</span>
                                            </label>
                                        </article>
                                    </div>
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <div id="datepicker1" class="input-group date" data-date-format="dd/mm/yyyy">
                                                    <input id="indate1" class="form-control" type="text"  />
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <textarea id="motivo" name="motivo" class="inputin__fieldin" data-validate="required" data-validate-message="Elegir Tipo de Personal" rows="4" placeholder="Motivo de Salida ..." maxlength="250"></textarea>
                                                <span class="inputin__labelin">Descripcion de la Salida</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Desde:</label>
                                                <div class="input-group">
                                                    <input id="desde" type="text" class="form-control timepicker"/>
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-clock-o"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Hasta:</label>
                                                <div class="input-group">
                                                    <input id="hasta" type="text" class="form-control timepicker"/>
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-clock-o"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                 <select id="marcado" name="marcado" class="inputin__fieldin" data-validate="required" data-validate-message="Incluir Marcado">
                                                    <option value="">--Seleccionar--</option>
                                                    <option value="SI">SI</option>
                                                    <option value="NO">NO</option>
                                                </select>
                                                <span class="inputin__labelin">Incluir Marcado</span>
                                            </label>
                                        </article>
                                    </div>
                                  
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                            <input type="submit" value="Guardar" id="GuardarSalida" class="btn btn-primary example-the-1" />
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
            </div>



          <%--MODAL  ANULAR SALIDA--%>
        <div id="Div1">
            <div class="modal fade" id="modal-anular" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog modal-mg">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Anular Permiso/Salida</h4>
                        </div>
                        <div class="modal-body">
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Nombre y Apellido:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="nombrea"></label>
                            </p>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Fecha Salida:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="fsalidaa"></label>
                            </p>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Motivo:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="motivoa"></label>
                            </p>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Marcacion:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="marcaciona"></label>
                            </p>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Hora Salida:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="salidaa"></label>
                            </p>
                            <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                                <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Hora Retorno:<span style='mso-spacerun: yes'>  </span></span></b>
                                <label id="retornoa"></label>
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
                            <h4 class="modal-title">Rol de Turno</h4>
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
        <script src="js/JSPermisos.js"></script>

      <script>
          document.getElementById("Div4").style.display = 'none';


          function generarPDF() {
              //html2pdf().from(document.body).save('miDocumento.pdf')
              var elemento = document.getElementById('HTMLPdf');
              var opt = {
                  margin: 1,
                  filename: 'Salida.pdf',
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



          //llama a la ventana de impresion
          $(document).on('click', '#imprimir', function () {
              if ($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["estado"] == 'ANULADO') {
                  //$.alert("- La orden esta anulada")

                  Swal.fire({
                      icon: "error",
                      title: "Error",
                      text: "La orden esta anulada",
                  });
              } else {                  
                  //var idsalida = $("#TableSalidas").DataTable().row($(this).parents("tr")).data()["idSalida"];
                  //window.open("../VoletaSalida.aspx?idsalida=" + idsalida, '_blank', 'width=800,height=600 top=200,left=500')
                  $('#numero').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["idSalida"])
                  $('#numero1').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["idSalida"])
                  $('#nombre').text(nombre)
                  $('#nombre1').text(nombre)
                  $('#cipdf').text(carnet)
                  $('#cipdf1').text(carnet)
                  $('#fpermiso').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["fechasalida"])
                  $('#fpermiso1').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["fechasalida"])

                  $('#tpermiso').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["tiposalida"])
                  $('#tpermiso1').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["tiposalida"])

                  $('#hora1').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["h_salida"])
                  $('#hora2').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["h_regreso"])
                  $('#hora11').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["h_salida"])
                  $('#hora22').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["h_regreso"])

                  $('#Label5').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["motivo"])
                  $('#motivo1').text($("#TableSalidas").DataTable().row($(this).parents("tr")).data()["motivo"])

                  $("#modal-PDF").modal("show");

                  
                  generarPDF();
              }
          });


          var usuariopersonal
          $(document).ready(function () {

              idusuariopersonal = '<%= Session("idusuario").ToString%>';             

          });


          $(function () {
              $("#datepicker1").datepicker({
                  autoclose: true,
                  todayHighlight: true,
                  todayBtn: "linked",
              }).datepicker('update', new Date());

              //$("#datepicker2").datepicker({
              //    autoclose: true,
              //    todayHighlight: true,
              //    todayBtn: "linked",
              //    //title: "Geeksforgeeks datepicker"
              //}).datepicker('update', new Date());
          });

          //Timepicker
          $('.timepicker').timepicker({
              showMeridian: false,
              showInputs: false,
              use24hours: true,
              format: 'HH:mm'
          })
    </script>
</asp:Content>

