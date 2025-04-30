<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VoletaVacacion.aspx.vb" Inherits="VoletaVacacion" %>

<!DOCTYPE html>
  <style>

      #pdf {
   width:713px;
}
    <!--
 /* Font Definitions */
 @font-face
	{font-family:Batang;
	panose-1:2 3 6 0 0 1 1 1 1 1;
	mso-font-alt:\BC14\D0D5;
	mso-font-charset:129;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-1342176593 1775729915 48 0 524447 0;}
@font-face
	{font-family:"Cordia New";
	panose-1:2 11 3 4 2 2 2 2 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-2130706429 0 0 0 65537 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:1;
	mso-generic-font-family:roman;
	mso-font-format:other;
	mso-font-pitch:variable;
	mso-font-signature:0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-536870145 1073786111 1 0 415 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-520081665 -1073717157 41 0 66047 0;}
@font-face
	{font-family:"Britannic Bold";
	panose-1:2 11 9 3 6 7 3 2 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:3 0 0 0 1 0;}
@font-face
	{font-family:Candara;
	panose-1:2 14 5 2 3 3 3 2 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-1610611985 1073783883 0 0 415 0;}
@font-face
	{font-family:SimSun-ExtB;
	panose-1:2 1 6 9 6 1 1 1 1 1;
	mso-font-charset:134;
	mso-generic-font-family:modern;
	mso-font-pitch:fixed;
	mso-font-signature:3 168689664 16 0 262145 0;}
@font-face
	{font-family:Euphemia;
	panose-1:2 11 5 3 4 1 2 2 1 4;
	mso-font-alt:"Times New Roman";
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-2147483537 74 8192 0 1 0;}
@font-face
	{font-family:"Arial Narrow";
	panose-1:2 11 6 6 2 2 2 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:647 2048 0 0 159 0;}
@font-face
	{font-family:"\@Batang";
	panose-1:2 3 6 0 0 1 1 1 1 1;
	mso-font-charset:129;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-1342176593 1775729915 48 0 524447 0;}
@font-face
	{font-family:"\@SimSun-ExtB";
	panose-1:2 1 6 9 6 1 1 1 1 1;
	mso-font-charset:134;
	mso-generic-font-family:modern;
	mso-font-pitch:fixed;
	mso-font-signature:3 168689664 16 0 262145 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:0cm;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-ansi-language:ES;
	mso-fareast-language:ES;}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"Encabezado Car";
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:center 212.6pt right 425.2pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-ansi-language:ES;
	mso-fareast-language:ES;}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"Pie de página Car";
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:center 212.6pt right 425.2pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-ansi-language:ES;
	mso-fareast-language:ES;}
a:link, span.MsoHyperlink
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#0563C1;
	mso-themecolor:hyperlink;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-noshow:yes;
	mso-style-priority:99;
	color:#954F72;
	mso-themecolor:followedhyperlink;
	text-decoration:underline;
	text-underline:single;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"Texto de globo Car";
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-ansi-language:ES;
	mso-fareast-language:ES;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:36.0pt;
	mso-add-space:auto;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-ansi-language:ES;
	mso-fareast-language:ES;}
p.MsoListParagraphCxSpFirst, li.MsoListParagraphCxSpFirst, div.MsoListParagraphCxSpFirst
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-type:export-only;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	mso-add-space:auto;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-ansi-language:ES;
	mso-fareast-language:ES;}
p.MsoListParagraphCxSpMiddle, li.MsoListParagraphCxSpMiddle, div.MsoListParagraphCxSpMiddle
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-type:export-only;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	mso-add-space:auto;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-ansi-language:ES;
	mso-fareast-language:ES;}
p.MsoListParagraphCxSpLast, li.MsoListParagraphCxSpLast, div.MsoListParagraphCxSpLast
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-type:export-only;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:10.0pt;
	margin-left:36.0pt;
	mso-add-space:auto;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-ansi-language:ES;
	mso-fareast-language:ES;}
span.EncabezadoCar
	{mso-style-name:"Encabezado Car";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:Encabezado;}
span.PiedepginaCar
	{mso-style-name:"Pie de página Car";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:"Pie de página";}
span.TextodegloboCar
	{mso-style-name:"Texto de globo Car";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:"Texto de globo";
	mso-ansi-font-size:8.0pt;
	mso-bidi-font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-ascii-font-family:Tahoma;
	mso-hansi-font-family:Tahoma;
	mso-bidi-font-family:Tahoma;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;
	mso-style-unhide:no;}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	font-size:10.0pt;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-ansi-language:ES;
	mso-fareast-language:ES;}
@page WordSection1
	{size:612.1pt 792.1pt;
	margin:127.6pt 38.0pt 63.8pt 3.0cm;
	mso-header-margin:35.45pt;
	mso-footer-margin:35.45pt;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
      .auto-style3
      {
          height: 56pt;
           width: 33%;
      }
      .auto-style4
      {
          text-align: center;
      }
      .auto-style5
      {
          height: 24.3pt;
          width: 25%;
           text-align: right;
          }
     .auto-style6
     {
         color: #FFFFFF;
     }
      .auto-style7
      {
          height: 12pt;
      }
      .auto-style8
      {
          height: 24.3pt;
          width: 25%;
           text-align: left;
      }
-->
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div id="pdf">
        <div id="formIMP">
            <p class='MsoNormal' style='margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt; text-align: center;'>
                <b
                    style='mso-bidi-font-weight: normal'><span lang="ES" style='font-size: 8.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt; text-align: center;'>HOSPITAL GENERAL SAN JUAN DE DIOS<o:p> - ORURO</o:p></span></b>
            </p>

            <p class='MsoNormal' style='margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt; text-align: center;'>
                <b
                    style='mso-bidi-font-weight: normal'><span lang="ES" style='font-size: 9.0pt; mso-bidi-font-size: 14.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>AREA DE RR.HH.</span></b>
            </p>
            <p class='MsoNormal' style='margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt; text-align: center;'>
                FORM-SIP-003
            </p>
             <p class='MsoNormal' style='margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt; text-align: center;'>
                  <span class="auto-style6">-</span>
            </p>
            <p class='MsoNormal' style='margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt; text-align: center;'>
                  <span class="auto-style6">-</span>
            </p>
            <table class='MsoTableGrid' border="1" cellspacing="0" cellpadding="0" align="left"
                width="836" style='width: 534pt; border-collapse: collapse; border: none; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; mso-table-overlap: never; mso-yfti-tbllook: 1184; mso-table-lspace: 7.05pt; margin-left: 5.25pt; mso-table-rspace: 7.05pt; margin-right: 5.25pt; mso-table-anchor-vertical: paragraph; mso-table-anchor-horizontal: column; mso-table-left: -8.85pt; mso-table-top: .05pt; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
                <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-row-margin-left: 258.4pt'>
                    <td style='mso-cell-special: placeholder; border: none; padding: 0cm 0cm 0cm 0cm' colspan="4" class="auto-style7">
                        <p align="center" class='MsoNormal' style='margin-bottom: 0cm; margin-bottom: .0001pt; tab-stops: 10.0cm right 489.05pt'>
                            <span style='mso-bidi-font-weight: normal'><span lang="ES"
                                style='font-size: 14.0pt; line-height: 115%; font-family: "Britannic Bold","sans-serif"; letter-spacing: 1.0pt'><strong>FORMULARIO DE SOLICITUD DE VACACION </strong></span></span>
                        </p>
                        <p align="center" class='MsoNormal' style='margin-bottom: 0cm; margin-bottom: .0001pt; tab-stops: 10.0cm right 489.05pt'>
                            <span style='mso-bidi-font-weight: normal'><span lang="ES"
                                style='font-size: 14.0pt; line-height: 115%; font-family: "Britannic Bold","sans-serif"; letter-spacing: 1.0pt'><strong>O DIAS CUENTA VACACION</strong></span></span></p>
                    </td>
                </tr>

                  <tr style='mso-yfti-irow: 5; height: 16.2pt'>
                    
                </tr>


                <tr style='mso-yfti-irow: 1; height: 19.35pt; mso-row-margin-left: 258.4pt'>
                    <td style='mso-cell-special: placeholder; border: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; width: 50%;'
                        colspan="2">Nº:
     <label id="numero"></label>
                    </td>
                    <td style='mso-cell-special: placeholder; border: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; width: 50%;'
                        colspan="2">Fecha de Registro: <label id="FechaRec"></label></td>
                </tr>


                <tr style='mso-yfti-irow: 2; height: 17.05pt'>
                    <td colspan="4" style='width: 501.55pt; border: solid black 1.0pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; background: #D9D9D9; mso-background-themecolor: background1; mso-background-themeshade: 217; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.05pt'>
                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>DATOS DEL PERSONAL.-<o:p></o:p></span></b>
                        </p>
                    </td>
                </tr>
                <tr style='mso-yfti-irow: 3; height: 24pt'>
                    <td colspan="4" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Nombre y Apellido:<span style='mso-spacerun: yes'> 
                                </span></span></b>
                            <label id="nombre"></label>
                        </p>
                    </td>
                </tr>
                <tr style='mso-yfti-irow: 4; height: 24pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>C.I.:<span style='mso-spacerun: yes'>   </span></span></b>
                            <label id="ci"></label>
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;' colspan="2">
                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Bloque:<span style='mso-spacerun: yes'>   </span></span></b>
                            <label id="bloque"></label>
                        </p>
                    </td>
                    <td style='width: 33.33%; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt'>
                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Categoria:<span style='mso-spacerun: yes'>  </span></span></b>
                            <label id="categoria"></label>
                        </p>
                    </td>
                </tr>
                <tr style='mso-yfti-irow: 4; height: 24pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Tipo de Personal:<span style='mso-spacerun: yes'>   </span></span></b>
                            <label id="tpersonal"></label>
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width: 33.33%; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;' colspan="2">
                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Unidad/Servicio:
      <span style='mso-spacerun: yes'></span></span></b>
                            <label id="unidad"></label>
                        </p>
                    </td>
                    <td style='width: 33.33%; border-top: none; border-left: none; border-bottom: solid black 1.0pt; mso-border-bottom-themecolor: text1; border-right: solid black 1.0pt; mso-border-right-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-left-alt: solid black .5pt; mso-border-left-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt'>
                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Cargo:<span style='mso-spacerun: yes'>  </span></span></b>
                            <label id="cargo"></label>
                        </p>
                    </td>
                </tr>

                <tr style='mso-yfti-irow: 5; height: 16.2pt'>
                    
                </tr>
            </table>
  

                  <table class='MsoTableGrid' border="1" cellspacing="0" cellpadding="0" align="left"
                width="836" style='width: 534pt; border-collapse: collapse; border: none; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; mso-table-overlap: never; mso-yfti-tbllook: 1184; mso-table-lspace: 7.05pt; margin-left: 5.25pt; mso-table-rspace: 7.05pt; margin-right: 5.25pt; mso-table-anchor-vertical: paragraph; mso-table-anchor-horizontal: column; mso-table-left: -8.85pt; mso-table-top: .05pt; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
               

                <tr style='mso-yfti-irow: 5; height: 16.2pt'>
                    <td colspan="4" style='width: 501.55pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; background: #D9D9D9; mso-background-themecolor: background1; mso-background-themeshade: 217; padding: 0cm 5.4pt 0cm 5.4pt; height: 17.05pt; border-style: solid; border-width: 1.0pt; border-color: black;'>
                        <p class='MsoNormal' style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>DATOS DE LA VACACION.-<o:p></o:p></span></b>
                        </p>
                    </td>
                </tr>
                <tr style='mso-yfti-irow: 4; height: 24pt; width: 100%;'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%; text-align: right;'
                        class="auto-style5">
                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Tipo de Vacacion:<span style='mso-spacerun: yes'>   </span></span></b>
                            
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'
                        class="auto-style8">
                        <label id="tvacacion"></label></td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'
                        class="auto-style5">
                        
                    <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Gestion:<span style='mso-spacerun: yes'>   </span></span></b>

                            
                        </p>
                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style8">
                        
                        <label id="gestion"></label></td>
                </tr>

                <tr style='mso-yfti-irow: 4; height: 24pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'
                        class="auto-style5">
                         <p class="MsoNormal" style="margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly">
                            <b style="mso-bidi-font-weight: normal"><span style="font-size: 10.0pt; font-family: &quot;Euphemia&quot;,&quot;sans-serif&quot;; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO">Desde Fecha:<span style="mso-spacerun: yes"> </span></span></b>
                            
                        </p>

                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style8">
                         <label id="fecha1">
                            </label></td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'
                        class="auto-style5">
                        

                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Hasta Fecha:<span style='mso-spacerun: yes'>   </span></span></b>
                            
                        </p>
                        

                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'
                        class="auto-style8">

                        <label id="fecha2"></label></td>
                </tr>

                <tr style='mso-yfti-irow: 4; height: 24pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style5">
                       

                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Fecha de Incorporacion:<span style='mso-spacerun: yes'>   </span></span></b>
                           
                        </p>
                       

                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'
                        class="auto-style8">
                       

                         <label id="Fincorporacion"></label></td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 25%;'
                        class="auto-style5">
                       

                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Cantidad de dias:<span style='mso-spacerun: yes'>   </span></span></b>
                           
                        </p>
                       

                    </td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style8">
                       

                         <label id="dias"></label></td>
                </tr>

               

                <tr style='mso-yfti-irow: 4; height: 24pt'>
                    <td colspan="4" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
                        <p class="MsoNormal" style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>Observacion:<span style='mso-spacerun: yes'>   </span></span></b>
                            <label id="observacion"></label>
                        </p>
                    </td>
                </tr>
                       <tr style='mso-yfti-irow: 5; height: 16.2pt'>
                    
                </tr>
                </table>


             

               <table class='MsoTableGrid' border="1" cellspacing="0" cellpadding="0" align="left"
                width="836" style='width: 534pt; border-collapse: collapse; border: none; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; mso-table-overlap: never; mso-yfti-tbllook: 1184; mso-table-lspace: 7.05pt; margin-left: 5.25pt; mso-table-rspace: 7.05pt; margin-right: 5.25pt; mso-table-anchor-vertical: paragraph; mso-table-anchor-horizontal: column; mso-table-left: -8.85pt; mso-table-top: .05pt; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
               
                <tr style='mso-yfti-irow: 7; height: 16.2pt'>
                    <td width="836" colspan="5" valign="top" style='width: 501.55pt; mso-border-themecolor: text1; border-top: none; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; background: #D9D9D9; mso-background-themecolor: background1; mso-background-themeshade: 217; padding: 0cm 5.4pt 0cm 5.4pt; height: 16.2pt; border-style: solid; border-width: 1.0pt; border-color: black;'>
                        <p class='MsoNormal' style='margin-bottom: 0cm; margin-bottom: .0001pt; line-height: normal; mso-element: frame; mso-element-frame-hspace: 7.05pt; mso-element-wrap: around; mso-element-anchor-vertical: paragraph; mso-element-anchor-horizontal: column; mso-element-left: -8.8pt; mso-element-top: .05pt; mso-height-rule: exactly'>
                            <b
                                style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Euphemia","sans-serif"; mso-ansi-language: ES-BO; mso-fareast-language: ES-BO'>AUTORIZADO POR.-<o:p></o:p></span></b>
                        </p>
                    </td>
                </tr>

                <tr style='mso-yfti-irow: 4;'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style3"></td>
                    <td colspan="3" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style3"></td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style3"></td>
                </tr>

                <tr style='mso-yfti-irow: 4; height: 24pt'>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; text-align: center;'
                        class="auto-style4">Interesado</td>
                    <td colspan="3" style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style4">Inmediato Superiro</td>
                    <td style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style4">Jefe de Personal</td>
                </tr>


                <tr style='mso-yfti-irow: 4; height: 24pt'>
                    <td style='border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; border-top-style: none; border-top-color: inherit; border-top-width: medium; text-align: center;'
                        class="auto-style4">&nbsp;</td>
                    <td colspan="3" style='border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style4">&nbsp;</td>
                    <td style='border-bottom: 1.0pt solid black; mso-border-themecolor: text1; mso-border-top-alt: solid black .5pt; mso-border-top-themecolor: text1; mso-border-alt: solid black .5pt; mso-border-themecolor: text1; padding: 0cm 5.4pt 0cm 5.4pt; height: 24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'
                        class="auto-style4">&nbsp;</td>
                </tr>


            </table>


        </div>

             <p class='MsoNormal' style='margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt; text-align: center;'>
                *EL PRESENTE FORMUARIO NO DEBE CONTENER BORRONES, ENMIENDAS Y/O CORRECCIONES
            </p>
        <p>
            <span class="auto-style6">-</span>
        </p>
         <p>
            <span class="auto-style6">-</span>
        </p>
         <p> <span class="auto-style6">-</span></p>
         <p> <span class="auto-style6">-</span></p> <p> <span class="auto-style6">-</span></p>
        <p class='MsoNormal' style='margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt; text-align: center;'>
            <b
                style='mso-bidi-font-weight: normal; border-top-style: solid; border-top-color: #000000;'><span lang="ES" style='font-size: 9.0pt; mso-bidi-font-size: 14.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>Director                        
                </span></b>
        </p>
           <p class='MsoNormal' style='margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt; text-align: center;'>
            <b
                style='mso-bidi-font-weight: normal'><span lang="ES" style='font-size: 9.0pt; mso-bidi-font-size: 14.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>
                        FIRMA Y SELLO
                </span></b>
        </p>  
    </div>
       

            
</body>


      <script src="bower_components/jquery/dist/jquery.min.js"></script>
   <%-- <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>--%>
        
        <!-- Bootstrap 3.3.7 -->
        <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- Select2 -->
        <script src="bower_components/select2/dist/js/select2.full.min.js"></script>
        <!-- InputMask -->
        <script src="plugins/input-mask/jquery.inputmask.js"></script>
        <script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>

        <script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

          
        

<%--        <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script>--%>
        <!-- date-range-picker -->
        <script src="bower_components/moment/min/moment.min.js"></script>
        <script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
        <!-- bootstrap datepicker -->
        <script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
        <!-- bootstrap color picker -->
        <script src="bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
        <!-- bootstrap time picker -->
        <script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
        <!-- SlimScroll -->
        <script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- SlimScroll -->
        <script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
        <!-- iCheck 1.0.1 -->
        <script src="plugins/iCheck/icheck.min.js"></script>
        <!-- FastClick -->
        <script src="bower_components/fastclick/lib/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
        <!-- FastClick -->
        <script src="bower_components/fastclick/lib/fastclick.js"></script>
    <!-- treeview -->
    <script src="js/bootstrap-treeview.js"></script>
        <!-- MDB -->
        <%--<script src="bower_components/bootstrap/dist/js/mdb.min.js"></script>--%>
          <script type="text/javascript" src="js/jquery-confirm.js"></script>
            <script src="js/jquery.validate.min.js" type="text/javascript"></script> 
            <script src="js/jspdf.min.js"></script>

    

     <script src="js/JSVoletaVacacion.js"></script>

        <script type="text/javascript">
            var idVacacion =   <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Request.QueryString("idVacacion"))%>
             //console.log(idVacacion)
        </script>

 
</html>

