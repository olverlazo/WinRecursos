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

Partial Class VoletaSalida
    Inherits System.Web.UI.Page

    'MUESTRA LOS CONTRATOS DEL PERSONAL
    'Public Class datosalida
    '    Public Sub New(ByVal ap_paterno As String, ByVal ap_materno As String, ByVal nombre As String, ByVal documento As String, ByVal complemento As String, ByVal expedido As String, ByVal bloque As String, ByVal categoria As String,ByVal tpersonal As String, ByVal unidad As String, ByVal cargo As String, ByVal fpermiso As String, ByVal tipopermiso As String, ByVal hora1 As String, ByVal hora2 As String, ByVal motivo As String)
    '        Me.ap_paterno = ap_paterno
    '        Me.ap_materno = ap_materno
    '        Me.nombre = nombre
    '        Me.documento = documento
    '        Me.complemento = complemento
    '        Me.expedido = expedido
    '        Me.bloque = bloque
    '        Me.categoria = categoria
    '        Me.tpersonal = tpersonal
    '        Me.unidad = unidad
    '        Me.cargo = cargo
    '        Me.fpermiso = fpermiso
    '        Me.tipopermiso = tipopermiso
    '        Me.hora1 = hora1
    '        Me.hora2 = hora2
    '        Me.motivo = motivo
    '    End Sub

    '    Public Property ap_paterno As String
    '    Public Property ap_materno As String
    '    Public Property nombre As String
    '    Public Property documento As String
    '    Public Property complemento As String
    '    Public Property expedido As String
    '    Public Property bloque As String
    '    Public Property categoria As String
    '    Public Property tpersonal As String
    '    Public Property unidad As String
    '    Public Property cargo As String
    '    Public Property fpermiso As String
    '    Public Property tipopermiso As String
    '    Public Property hora1 As String
    '    Public Property hora2 As String
    '    Public Property motivo As String
    'End Class

    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarSalida(ByVal id_salida As String) As List(Of String)

        'Dim lista As List(Of datosalida) = New List(Of datosalida)()
        Dim lista As List(Of String) = New List(Of String)()

        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim cmd As New SqlCommand("select * from personal where idpersonal=(select idpersonal  from salidas where idSalida=" + id_salida + ")", con)
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
        Dim cmd3 As New SqlCommand("select * from salidas where idSalida=" + id_salida + "", con3)
        con3.Open()
        Dim da3 As New SqlDataAdapter(cmd3)
        da3.Fill(dt3)
        con3.Close()

        'lista.Add(New datosalida(dt.Rows(0)("ap_paterno").ToString, dt.Rows(0)("ap_materno").ToString, dt.Rows(0)("nombre").ToString, dt.Rows(0)("documento").ToString, dt.Rows(0)("complemento").ToString(), dt.Rows(0)("expedido").ToString(), dt1.Rows(0)("bloque1").ToString(), dt2.Rows(0)("categoria1").ToString(), dt2.Rows(0)("tipocontrato1").ToString(), dt1.Rows(0)("area").ToString(), dt1.Rows(0)("cargo").ToString(), dt3.Rows(0)("fechaSalida").ToString(), dt3.Rows(0)("tipoSalida").ToString(), dt3.Rows(0)("h_salida").ToString(), dt3.Rows(0)("h_regreso").ToString(), dt3.Rows(0)("motivo").ToString()))
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
        lista.Add(dt3.Rows(0)("fechaSalida").ToString())
        lista.Add(dt3.Rows(0)("tipoSalida").ToString())
        lista.Add(dt3.Rows(0)("h_salida").ToString())
        lista.Add(dt3.Rows(0)("h_regreso").ToString())
        lista.Add(dt3.Rows(0)("motivo").ToString())

        Return lista

        'Dim json As Object = New With {Key .Data = lista}

        'Return json
    End Function
End Class
