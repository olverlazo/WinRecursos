Imports System
Imports System.Data
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Net
Imports System.Diagnostics
Imports System.Globalization
Partial Class VoletaLicencia
    Inherits System.Web.UI.Page
    'MUESTRA LOS CONTRATOS DEL PERSONAL
    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarLicencia(ByVal id_licencia As String) As List(Of String)

        Dim lista As List(Of String) = New List(Of String)()

        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim cmd As New SqlCommand("select * from personal where idpersonal=(select idpersonal  from licencias where idlicencia=" + id_licencia + ")", con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        con.Close()

        Dim dt1 As New DataTable()
        Dim con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim cmd1 As New SqlCommand("select id_contrato,cargo,(select descripcion from bloque where id_bloque=aa.id_bloque ) as bloque1 ,(select servicio from servicio where id_UServicios=aa.id_servicio ) as area from cargos as aa where aa.fecha_ini=(select MAX(fecha_ini) from cargos where id_personal='" + dt.Rows(0)("idpersonal").ToString() + "') and estado='ACTIVO' and id_personal='" + dt.Rows(0)("idpersonal").ToString() + "'", con1)
        con1.Open()
        Dim da1 As New SqlDataAdapter(cmd1)
        da1.Fill(dt1)
        con1.Close()

        Dim dt2 As New DataTable()
        Dim con2 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim cmd2 As New SqlCommand("select (select categoria from categoria where id=bb.id_categoria ) as categoria1,(select tipo from tipoContrato where id=bb.id_tipocontrato) as tipocontrato1 from contratos bb where id_personal='" + dt.Rows(0)("idpersonal").ToString() + "' and id_contrato='" + dt1.Rows(0)("id_contrato").ToString() + "'", con2)
        con2.Open()
        Dim da2 As New SqlDataAdapter(cmd2)
        da2.Fill(dt2)
        con2.Close()

        Dim dt3 As New DataTable()
        Dim con3 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim cmd3 As New SqlCommand("select * from licencias where idlicencia =" + id_licencia + "", con3)
        con3.Open()
        Dim da3 As New SqlDataAdapter(cmd3)
        da3.Fill(dt3)
        con3.Close()

        lista.Add(dt.Rows(0)("ap_paterno").ToString)
        lista.Add(dt.Rows(0)("ap_materno").ToString)
        lista.Add(dt.Rows(0)("nombre").ToString)
        lista.Add(dt.Rows(0)("documento").ToString)
        lista.Add(dt.Rows(0)("complemento").ToString())
        lista.Add(dt.Rows(0)("expedido").ToString())
        lista.Add(dt1.Rows(0)("bloque1").ToString())
        lista.Add(dt2.Rows(0)("categoria1").ToString())
        lista.Add(dt2.Rows(0)("tipocontrato1").ToString())
        lista.Add(dt1.Rows(0)("area").ToString())
        lista.Add(dt1.Rows(0)("cargo").ToString())
        lista.Add(dt3.Rows(0)("fechalicencia").ToString())
        lista.Add(dt3.Rows(0)("motivo").ToString())
        lista.Add(dt3.Rows(0)("tipolicencia").ToString())
        lista.Add(dt3.Rows(0)("resumen").ToString())
        lista.Add(dt3.Rows(0)("fechaini").ToString())
        lista.Add(dt3.Rows(0)("fechafin").ToString())
        lista.Add(dt3.Rows(0)("usuario").ToString())
        lista.Add(dt3.Rows(0)("estado").ToString())
        Return lista
    End Function
End Class
