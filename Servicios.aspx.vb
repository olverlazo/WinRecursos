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



Partial Class Servicios
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("idusuario").ToString = "" Then
                Response.Redirect("~/Default.aspx")
            End If
        End If
    End Sub


    <WebMethod(EnableSession:=True)> _
    Public Shared Function funcion_ingresar(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String) As String
        If v3 >= 0 Then
            Dim dt As New DataTable()
            Dim conn As New SqlConnection()
            Dim cmd As New SqlCommand()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
            cmd.Connection = conn
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "GET_SERVICIOS"
            cmd.Parameters.AddWithValue("@id_UServicios", v1)
            cmd.Parameters.AddWithValue("@servicio", v2)
            cmd.Parameters.AddWithValue("@dependiente", v1)
            cmd.Parameters.AddWithValue("@bloque", 1)
            cmd.Parameters.AddWithValue("@sw", v3)
            Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            Return "OK"
        Else
            Return "Error"
        End If
    End Function



    'MUESTRA LA LISTA DE PERSONAL
    Public Class persona
        Public Sub New(ByVal documento As String, ByVal nombre As String, ByVal ap As String, ByVal am As String)
            Me.documento = documento
            Me.nombre = nombre
            Me.ap = ap
            Me.am = am
        End Sub
        Public Property documento As String
        Public Property nombre As String
        Public Property ap As String
        Public Property am As String
    End Class

    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarLista(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String) As Object
        Dim lista As List(Of persona) = New List(Of persona)()
        Dim consulta As String = "select a.documento,nombre,ap_paterno ap,ap_materno am from personal a, cargos b, servicio c where a.idpersonal=b.id_personal and b.id_servicio=c.id_UServicios and b.estado<>'ANULADO' and c.id_UServicios=@ID and (b.fecha_ini <=CONVERT(char(10),'" + v2 + "',103) or b.fecha_fin >=CONVERT(char(10),'" + v3 + "',103) ) group  by a.documento,nombre,a.ap_paterno,a.ap_materno order by nombre,ap,am"
        Dim nwindConn As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        nwindConn.Open()
        Dim cmd As New SqlCommand(consulta, nwindConn)
        cmd.Parameters.Add(New SqlParameter("@ID", v1))
        'cmd.ExecuteNonQuery()
        Dim dt As New DataTable()
        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        sda.Fill(dt)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                lista.Add(New persona(dt.Rows(i)("documento").ToString, dt.Rows(i)("nombre").ToString, dt.Rows(i)("ap").ToString, dt.Rows(i)("am").ToString))
            Next
        End If
        nwindConn.Close()
        nwindConn.Dispose()
            Dim json As Object = New With {Key .data = lista}
            Return json
    End Function
End Class
