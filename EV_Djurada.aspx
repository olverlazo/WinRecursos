<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage3.master" AutoEventWireup="false" CodeFile="EV_Djurada.aspx.vb" Inherits="EV_Djurada" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
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
-->
</style>

   
     <div style="margin-bottom: 0!important; background-color: #00A7D0;">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="box-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <div class="input-group input-group-sm">
                                        <span class="input-group-btn">
                                            <button type="button" id="guardar" class="btn btn-block btn-default btn-lg" onclick="printDiv('formIMP')" value="Decargar Reporte">
                                                <span class="glyphicon glyphicon-floppy-disk"></span>Guardar Informacion</button> 
                                            <%--<input type="button" onclick="printDiv('formIMP')" value="Print a Div" />--%>
                                        </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                  
                </div>
            </div>
    
     <div id="formIMP" style="padding: 5px 1px 1px 30px; margin: 2px 3px 2px 3px">
                  
     <p class='MsoNormal' style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:7.1pt;margin-bottom:.0001pt;line-height:normal;tab-stops:10.0cm right 489.05pt'><b
style='mso-bidi-font-weight:normal'><span lang=ES style='font-size:8.0pt;
font-family:"Arial","sans-serif";letter-spacing:1.0pt'>HOSPITAL GENERAL SAN JUAN DE DIOS<o:p> - ORURO</o:p></span></b></p>

<p class='MsoNormal' style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:7.1pt;margin-bottom:.0001pt;line-height:normal;tab-stops:10.0cm right 489.05pt'><b
style='mso-bidi-font-weight:normal'><span lang=ES style='font-size:9.0pt;
mso-bidi-font-size:14.0pt;font-family:"Arial","sans-serif";letter-spacing:1.0pt'>Unidad</span></b><span
lang=ES style='font-size:9.0pt;mso-bidi-font-size:14.0pt;font-family:"Arial","sans-serif";
letter-spacing:1.0pt'>: RRHH<o:p></o:p></span></p>

<p class='MsoNormal' style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:7.1pt;margin-bottom:.0001pt;line-height:normal;tab-stops:10.0cm right 489.05pt'><b
style='mso-bidi-font-weight:normal'><span lang=ES style='font-size:9.0pt;
mso-bidi-font-size:14.0pt;font-family:"Arial","sans-serif";letter-spacing:1.0pt'>Tel</span></b><span
lang=ES style='font-size:9.0pt;mso-bidi-font-size:14.0pt;font-family:"Arial","sans-serif";
letter-spacing:1.0pt'>: 5275405<o:p></o:p></span></p>

        
<table class='MsoTableGrid' border=1 cellspacing=0 cellpadding=0 align=left
 width=836 style='width:534pt; border-collapse:collapse;border:none;
 mso-border-alt:solid black .5pt;mso-border-themecolor:text1;mso-table-overlap:
 never;mso-yfti-tbllook:1184;mso-table-lspace:7.05pt;margin-left:5.25pt;
 mso-table-rspace:7.05pt;margin-right:5.25pt;mso-table-anchor-vertical:paragraph;
 mso-table-anchor-horizontal:column;mso-table-left:-8.85pt;mso-table-top:.05pt;
 mso-padding-alt:0cm 5.4pt 0cm 5.4pt'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:12.35pt;mso-row-margin-left:
  258.4pt'>
  <td style='mso-cell-special:placeholder;border:none;padding:0cm 0cm 0cm 0cm' colspan="9"><p class='MsoNormal'>&nbsp;
      <p  align=center  class='MsoNormal' style='margin-bottom:0cm;margin-bottom:.0001pt;tab-stops:
10.0cm right 489.05pt'><b style='mso-bidi-font-weight:normal'><span lang=ES
style='font-size:14.0pt;line-height:115%;font-family:"Britannic Bold","sans-serif";
letter-spacing:1.0pt'>DECLARACION JURADA DE INFORMACION</span></b></p>
     </td>
 </tr>
 <tr style='mso-yfti-irow:1;height:19.35pt;mso-row-margin-left:258.4pt'>
  <td style='mso-cell-special:placeholder;border:none;border-bottom:solid black 1.0pt;
  mso-border-bottom-themecolor:text1' colspan="9">
     
     </td>
 </tr>
 <tr style='mso-yfti-irow:2;height:17.05pt'>
  <td colspan=9 style='width:501.55pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;background:#D9D9D9;mso-background-themecolor:background1;mso-background-themeshade:
  217;padding:0cm 5.4pt 0cm 5.4pt;height:17.05pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>DATOS DEL PERSONALES.-<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:3;height:24pt'>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Apellido Paterno:<span style='mso-spacerun:yes'> 
       </span></span></b> <label id ="paterno"></label></p>
  </td>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Apellido Materno:<span style='mso-spacerun:yes'>   </span></span></b>
        <label id ="materno"></label>
    </p>  
  </td>
  <td colspan=5 style='width:33.33%; border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
  border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
  solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:24.3pt'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Nombres:<span style='mso-spacerun:yes'>  </span></span></b>
<label id ="nombre"></label>
    </p>
      
  </td>
 </tr>
 <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>C.I.:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="ci"></label>
  </p>
  </td>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Lugar:<span style='mso-spacerun:yes'>   </span></span></b>
        <label id ="ciudad"></label>
    </p>  
  </td>
  <td colspan=5 style='width:33.33%; border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
  border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
  solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:24.3pt'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Fecha Nacimiento:<span style='mso-spacerun:yes'>  </span></span></b>
        <label id ="nacimiento"></label>
    </p>
  </td>
 </tr>
    <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Genero:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="genero"></label>
  </p>
  </td>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Dirección:
      <span style='mso-spacerun:yes'>
        </span></span></b>
        <label id ="direccion"></label>
    </p>  
  </td>
  <td colspan=5 style='width:33.33%; border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
  border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
  solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:24.3pt'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Telefono:<span style='mso-spacerun:yes'>  </span></span></b>
        <label id ="telefono"></label>
    </p>
  </td>
 </tr>
     <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Email:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="email"></label>
  </p>
  </td>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Seguro:<span style='mso-spacerun:yes'>   </span></span></b>
        <label id ="seguros"></label>
    </p>  
  </td>
  <td colspan=5 style='width:33.33%; border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
  border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
  solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:24.3pt'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Matricula:<span style='mso-spacerun:yes'>  </span></span></b>
<label id ="m_seguros"></label>
    </p>
  </td>
 </tr>

      <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>A.F.P.:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="afp"></label>
  </p>
  </td>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>NUA/CUA:<span style='mso-spacerun:yes'>   </span></span></b>
        <label id ="nua"></label>
    </p>  
  </td>
  <td colspan=5 style='width:33.33%; border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
  border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
  solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:24.3pt'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Nivel de estudio:<span style='mso-spacerun:yes'>  </span></span></b>
        <label id ="estudio"></label>
    </p>
  </td>
 </tr>

     <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Profesión:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="profesion"></label>
  </p>
  </td>
  <td colspan=2 style='border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black; width:33.33%; mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>
Matricula Profecional:<span style='mso-spacerun:yes'>   </span></span></b>
        <label id ="matricula"></label>
    </p>  
  </td>
  <td colspan=5 style='width:33.33%; border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;mso-border-bottom-themecolor:text1;
  border-right:solid black 1.0pt;mso-border-right-themecolor:text1;mso-border-top-alt:
  solid black .5pt;mso-border-top-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:24.3pt'>
    <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>--<span style='mso-spacerun:yes'>  </span></span></b></p>
  </td>
 </tr>

 <tr style='mso-yfti-irow:5;height:16.2pt'>
  <td colspan=9 valign=top style='width:100%;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;background:#D9D9D9;mso-background-themecolor:background1;mso-background-themeshade:
  217;padding:0cm 3.5pt 0cm 3.5pt;height:16.2pt'>
  <p class='MsoNormal' style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>ESTADO LABORAL.-<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=3 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Tipo de Contrato:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="contrato"></label>
  </p>
  </td>
  <td colspan=9 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Categoria:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="categoria"></label>
  </p>
  </td>
 </tr>

     <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=3 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>F. Financiamiento:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="ffinanciamiento"></label>
  </p>
  </td>
  <td colspan=9 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Carga Horaria:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="horario"></label>
  </p>
  </td>
 </tr>

     <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=3 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Nº. Item:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="item"></label>
  </p>
  </td>
  <td colspan=9 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>---<span style='mso-spacerun:yes'>   </span></span></b></p>
  </td>
 </tr>

 <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=3 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Fecha Inicio:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="finicio"></label>
  </p>
  </td>
  <td colspan=9 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Fecha de finalizacion:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="ffin"></label>
  </p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:7;height:16.2pt'>
  <td width=836 colspan=9 valign=top style='width:501.55pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;background:#D9D9D9;mso-background-themecolor:background1;mso-background-themeshade:
  217;padding:0cm 5.4pt 0cm 5.4pt;height:16.2pt'>
   <p class='MsoNormal' style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>CARGO.-<o:p></o:p></span></b></p>
  </td>
 </tr>

     <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=3 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Bloque:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="entidad"></label>
  </p>
  </td>
  <td colspan=9 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Servicio:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="servicio"></label>
  </p>
  </td>
 </tr>

     <tr style='mso-yfti-irow:4;height:24pt'>
  <td colspan=3 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>Cargo:<span style='mso-spacerun:yes'>   </span></span></b>
      <label id ="cargo"></label>
  </p>
  </td>
  <td colspan=9 style=' border-left: 1.0pt solid black; border-right: 1.0pt solid black; border-bottom: 1.0pt solid black;  mso-border-themecolor:text1; mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1; mso-border-alt:solid black .5pt; mso-border-themecolor:
  text1; padding:0cm 5.4pt 0cm 5.4pt; height:24.3pt; border-top-style: none; border-top-color: inherit; border-top-width: medium;'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>---<span style='mso-spacerun:yes'>   </span></span></b></p>
  </td>
 </tr>

     <tr style='mso-yfti-irow:7;height:16.2pt'>
  <td width=836 colspan=9 valign=top style='width:501.55pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;background:#D9D9D9;mso-background-themecolor:background1;mso-background-themeshade:
  217;padding:0cm 5.4pt 0cm 5.4pt;height:16.2pt'>
   <p class='MsoNormal' style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
  normal;mso-element:frame;mso-element-frame-hspace:7.05pt;mso-element-wrap:
  around;mso-element-anchor-vertical:paragraph;mso-element-anchor-horizontal:
  column;mso-element-left:-8.8pt;mso-element-top:.05pt;mso-height-rule:exactly'><b
  style='mso-bidi-font-weight:normal'><span style='font-size:10.0pt;font-family:
  "Euphemia","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>DECLARACION.-<o:p></o:p></span></b></p>
  </td>
 </tr>

     <tr style='mso-yfti-irow:10;mso-yfti-lastrow:yes;height:28.8pt'>
  <td width=836 colspan=9 valign=top style='width:501.55pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-top:none;mso-border-top-alt:solid black .5pt;
  mso-border-top-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0cm 5.4pt 0cm 5.4pt;height:28.8pt'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
  justify;text-justify:inter-ideograph;line-height:normal;mso-element:frame;
  mso-element-frame-hspace:7.05pt;mso-element-wrap:around;mso-element-anchor-vertical:
  paragraph;mso-element-anchor-horizontal:column;mso-element-left:-8.8pt;
  mso-element-top:.05pt;mso-height-rule:exactly'><b style='mso-bidi-font-weight:
  normal'><span style='font-size:10.0pt;mso-bidi-font-size:11.0pt;font-family:
  "Arial","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'><o:p>&nbsp;</o:p></span></b></p>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
  justify;text-justify:inter-ideograph;line-height:normal;mso-element:frame;
  mso-element-frame-hspace:7.05pt;mso-element-wrap:around;mso-element-anchor-vertical:
  paragraph;mso-element-anchor-horizontal:column;mso-element-left:-8.8pt;
  mso-element-top:.05pt;mso-height-rule:exactly'><b style='mso-bidi-font-weight:
  normal'><span style='font-size:10.0pt;mso-bidi-font-size:11.0pt;font-family:
  "Arial","sans-serif";mso-ansi-language:ES-BO;mso-fareast-language:ES-BO'>- Juro que los datos consignados en la presente Declaracion son verdaderos, asi, en caso de falsedad
  u omision de información me someto a las sanciones que establece la ley<br>
  - Me comprometo a realizar la entrega de toda la documentación informada a efectos de verifiación.<br>
  - El contenido de la presente declcaración es de exclusiva responsabilidad del declarante<br><br>
      <label id ="fechaimp"></label>
  <o:p></o:p></span></b></p>

  </td>
 </tr>

 <tr >
  <td style="border-style: none">

  
      
       
  </td>
     
  <td style="border-style: none">

<br></br><br></br>
  </td>


 </tr>
 
  
</table>

         <div id="formIMP1">
            
                <p align="center" style='width: 534pt; margin-top: 0cm; margin-right: 0cm; margin-bottom: 0cm; margin-left: 7.1pt; margin-bottom: .0001pt; line-height: normal; tab-stops: 10.0cm right 489.05pt'> 
                     <b
                style='mso-bidi-font-weight: normal; border-top-style: solid; border-top-color: #000000;'><span lang="ES" style='font-size: 9.0pt; mso-bidi-font-size: 14.0pt; font-family: "Arial","sans-serif"; letter-spacing: 1.0pt'>FIRMA Y SELLO                        
                </span></b>
                </p>
                
              

               
            </div>

    </div>
<div style="margin-bottom: 0!important; ">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="box-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <div class="input-group input-group-sm">
                                        <span class="input-group-btn">
                                            <%--<asp:Button ID="guardar" runat="server" class="btn btn-block btn-default btn-lg" Text="Button"/>--%>
                                      <%--   <button onclick="printDiv('Form')">Print only the above div</button>--%>
                                            
                                        </span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="box-body">
                            <ul class="nav nav-pills nav-stacked">

                                <li>
                                    <div class="input-group input-group-sm">

                                        <%--   <span class="input-group-btn">
                                            <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Nombre/Apellido" id="txtvalor" />--%>
                                    </div>
                                </li>

                            </ul>
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
     <script src="/js/html2pdf.bundle.min.js"></script>​​​ 

     <script type="text/javascript">
         $(document).ready(function () {
             var personadatos = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("datos"))%>
                 
            $('#nombre').text(personadatos[4]);
            $('#paterno').text(personadatos[5]);
            $('#materno').text(personadatos[6]);
            $('#ci').text(personadatos[1] + " " + personadatos[2]);
            $('#ciudad').text(personadatos[3]);
            $('#nacimiento').text(personadatos[8]);
            $('#genero').text(personadatos[7]);

            $('#direccion').text(personadatos[9]);
            $('#telefono').text(personadatos[10]);
            $('#email').text(personadatos[11]);

            $('#seguros').text(personadatos[12]);
            $('#m_seguros').text(personadatos[13]);
            $('#afp').text(personadatos[14]);
            $('#nua').text(personadatos[15]);

            var nestudio= ["PRIMARIA", "SECUNDARIA","UNIVERSITARIO","TECNICO MEDIO","TECNICO SUPERIOR","EGRESADO","LICENCIATURA","ESPECIALIDAD MEDICA","MAESTRIA","DOCTORADO","NINGUNO"];

            $('#estudio').text(nestudio[personadatos[25]-1]);

            $('#profesion').text(personadatos[26]);
            $('#matricula').text(personadatos[27]);

            var laboral = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("datos_laboral"))%>
            console.log('')
             var contrato = ["PERSONAL PERMANENTE", "PERSONAL EVENTUAL","CONSULTOR EN LINEA","CONSULTOR POR PRODUCTO"];
             var categoria=["MEDICO","MEDICO COMPLEMENTARIO","LIC. ENFERMERIA","AUX. ENFERMERIA","ADMINISTRATIVO","TRABAJADOR MANUAL","CONDUCTOR DE VEHICULO","MEDICO ASSO","MEDICO RESIDENTE"]
             var fuente = ["Consultor Individual: 25220", "Personal Eventual: 12100", "Personal Eventual: 26990", "Recursos ASSO", "Recursos Gobernacion", "Recursos HIPI", "Recursos MINEDU", "Recursos Ministerio", "Recursos SUS", "Recursos Municipio", "Recursos ONG", "Recursos SERECI", "Recursos CRIDAI", "Recursos TELESALUD", "Recursos TGN"]
             var hora = ["Medio Tiempo", "Tiempo Completo"]
             var bloque = ["BLOQUE CENTRAL", "BLOQUE COREA"]

             
             var cargo = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("datos_cargo"))%>
      
            $('#contrato').text(contrato[laboral[0]-1]);
            $('#categoria').text(categoria[laboral[1]-1]);
            $('#ffinanciamiento').text(fuente[laboral[2]-1]);    
     


            $('#horario').text(hora[laboral[3]-1]);
            $('#item').text(laboral[4]);
            $('#finicio').text(laboral[5]);
            $('#ffin').text(laboral[6]);


            var unidad = <%= New System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Session("unidad"))%>
            $('#cargo').text(cargo[2]);
             $('#servicio').text(unidad);
             $('#entidad').text(bloque[cargo[0]-1]);

            $('#fechaimp').text("Fecha de la declaracion: " + personadatos[39]);
        });



         //llama a la ventana de impresion
         //$(document).on('click', '#guardar', function () {
             
         //        var element = document.querySelector('#formIMP');
                   
         //           var options = {
         //               margin: 1,
         //               filename: 'report.pdf',
         //               image: { type: 'pdf', quality: 0.98 },
         //               html2canvas: { scale: 2 },
         //               jsPDF: { unit: 'mm', format: 'letter', orientation: 'portrait' }
         //           };
                     
         //           html2pdf().set(options).from(element).save();
                 
             
         //});

         function printDiv(elem) {
            var form1 = '<%=Session("form1")%>'
            var form2 = '<%=Session("form2")%>'
            var form3 = '<%=Session("form3")%>'
            var form4 = '<%=Session("form4")%>'
            //guardarBase()
             if (form1 == "") {
                 //alert("Debe guardar la informacion del Formulario Datos Personales");
                 Swal.fire({
                     position: "center",
                     icon: "error",
                     title: "Debe guardar la informacion del Formulario Datos Personales",
                     showConfirmButton: true,
                 });
             } else {

                 if (form2 == "") {
                     //alert("Debe guardar la informacion del Formulario Contrato");
                     Swal.fire({
                         position: "center",
                         icon: "error",
                         title: "Debe guardar la informacion del Formulario Contrato",
                         showConfirmButton: true,
                     });
                 } else {

                     if (form3 == "") {
                         //alert("Debe guardar la informacion del Formulario Cargo");
                         Swal.fire({
                             position: "center",
                             icon: "error",
                             title: "Debe guardar la informacion del Formulario Cargo",
                             showConfirmButton: true,
                         });
                     } else {
                         //guardarBase()
                         //var element = document.querySelector('#formIMP');
                         //var options = {
                         //    margin: 1,
                         //    filename: 'report.pdf',
                         //    image: { type: 'pdf', quality: 0.98 },
                         //    html2canvas: { scale: 2 },
                         //    jsPDF: { unit: 'mm', format: 'letter', orientation: 'portrait' }
                         //};
                         //html2pdf().set(options).from(element).save();
                         //salirsistema();
                         //return true;


                         //////////////////


                         $.confirm({
                             title: 'Guardar?',
                             content: 'Si los datos son correctos Imprima el formulario, su informacion debera ser verificada en RRHH',
                             buttons: {
                                 guardar: {
                                     btnClass: 'btn-green',
                                     keys: ['enter', 'shift'],
                                     action: function () {                                        

                                         guardarBase()
                                         //var element = document.querySelector('#formIMP');
                                         //var options = {
                                         //    margin: 1,
                                         //    filename: 'report.pdf',
                                         //    image: { type: 'pdf', quality: 0.98 },
                                         //    html2canvas: { scale: 2 },
                                         //    jsPDF: { unit: 'mm', format: 'letter', orientation: 'portrait' }
                                         //};
                                         ////html2pdf().set(options).from(element).save();
                                         //html2pdf().set(options).from(element).toPdf().get('pdf').then(
                                         //    function (pdf) {
                                         //        const newWindow = window.open(pdf.output('bloburl'),'_blank');
                                         //    }
                                         // )
                                         //salirsistema();
                                         //return true;
                                     }
                                 },
                                 cancelar: function () {
                                 },
                             }
                         });
                         //////////////////
                     }
                 }
             }
         }
         function guardarBase() {

             $.ajax({
                 type: "POST",
                 async: false,
                 contentType: "application/json; charset=utf-8",
                 url: "WebService2.asmx/guardarbase1",
                 success: function (response) {
                     
                     if (response.d=='1'){
                         console.log('se grabo correctamente');
                         var element = document.querySelector('#formIMP');
                         var options = {
                             margin: 1,
                             filename: 'report.pdf',
                             image: { type: 'pdf', quality: 0.98 },
                             html2canvas: { scale: 2 },
                             jsPDF: { unit: 'mm', format: 'letter', orientation: 'portrait' }
                         };
                         html2pdf().set(options).from(element).toPdf().get('pdf').then(
                             function (pdf) {
                                 var newWindow = window.open(pdf.output('bloburl'),'_blank');
                             }
                          )
                         window.location = "/Ev_ddjj.aspx";
                         //salirsistema();
                     } else {
                         Swal.fire({
                             position: "center",
                             icon: "error",
                             title: "Exitio un error al guardar los Datos. Intente mas tarde "+response.d,                             
                             showConfirmButton: true,
                         });
                         //salirsistema();
                     }
                     //console.log(response)
                 },
                 error: function ajaxError(result) {
                     alert(result.status + ' : ' + result.statusText);
                 }
             });
         };

         function salirsistema() {
             $.ajax({
                 type: "POST",
                 async: false,
                 contentType: "application/json; charset=utf-8",
                 url: "WebService2.asmx/salirsistema",
                 success: function (response) {
                     //window.location = "/DefaultPersonal.aspx";
                 },
                 error: function ajaxError(result) {
                     alert(result.status + ' : ' + result.statusText);
                 }
             });
         };
    </script>
</asp:Content>

