<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel="stylesheet" href="css/mdb.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div>
      <%--<asp:RadioButton id="disco" runat="server" GroupName="guardar"
	    Checked="true" Text="Guardar imagen en disco"/>
      <asp:RadioButton id="bd" runat="server" GroupName="guardar"
	    Text="Guardar imagen en base de datos"/>--%>
    </div>
    <p>
      <asp:Label ID="Label1" AssociatedControlId="fileUploader1" runat="server"
	    Text="Seleccionar una imagen:" />
      <asp:FileUpload id="fileUploader1" runat="server" />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </p>
        <asp:Button id="cargarImagen" runat="server" Text="Cargar imágenes" OnClick="cargarImagen_Click" />
    </div>
  </form>
    <table>
        <tr style="width: 100%">

            <td style="width: 100%"></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</body>
</html>
