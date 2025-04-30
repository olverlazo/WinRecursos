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
Partial Class Vacaciones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("idusuario").ToString = "" Then
                Response.Redirect("~/Default.aspx")
            End If
        End If
    End Sub

    Public Class cronograma
        Public Property idregistro() As Integer
            Get
                Return id
            End Get
            Set(value As Integer)
                id = value
            End Set
        End Property
        Private id As Integer
        Public Property gestion() As String
            Get
                Return gestionv
            End Get
            Set(value As String)
                gestionv = value
            End Set
        End Property
        Private gestionv As String
    End Class
    <WebMethod(EnableSession:=True)> _
    Public Shared Function funcion_cronograma(ByVal v1 As String) As List(Of cronograma)
        Dim persona_select As List(Of cronograma) = New List(Of cronograma)()

        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select idregistro,cast(YEAR(fecha1) as nvarchar(5)) +' -- ' + cast(dias as nvarchar(2)) +' dias'  as gestion from cronogramaV where idpersonal ='" + v1 + "' and dias >0 order by fecha1 desc"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                persona_select.Add(New cronograma() With {.idregistro = Convert.ToInt32(dt.Rows(i)("idregistro")), .gestion = dt.Rows(i)("gestion").ToString()})
            Next
            con.Close()
        End If
        Return persona_select
    End Function


    <WebMethod(EnableSession:=True)> _
    Public Shared Function funcion_GrabaVacacion(ByVal v0aux As String, ByVal v0 As String, ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String, ByVal v7 As String, ByVal v8 As String, ByVal v9 As String) As String
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_VACACIONES"
        cmd.Parameters.AddWithValue("@idVacacion", v0aux)
        cmd.Parameters.AddWithValue("@idpersonal", v0)
        cmd.Parameters.AddWithValue("@idcronograma", v1)
        cmd.Parameters.AddWithValue("@dias", v2)
        cmd.Parameters.AddWithValue("@tipovacacion", v3)
        cmd.Parameters.AddWithValue("@fecha1", v4)
        cmd.Parameters.AddWithValue("@fecha2", v5)
        cmd.Parameters.AddWithValue("@fecha3", v6)
        cmd.Parameters.AddWithValue("@observacion", v7)
        cmd.Parameters.AddWithValue("@usuario ", v8)
        cmd.Parameters.AddWithValue("@sw", v9)
        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        sda.Fill(dt)
        Return "OK"
    End Function



    Public Class LVacacion
        Public Sub New(ByVal idVacacion As String, ByVal gestion As String, ByVal tipovacacion As String, ByVal dias As String, ByVal fecha1 As String, ByVal fecha2 As String, ByVal fechaIncorporacion As String, ByVal observacion As String, ByVal estado As String)
            Me.idVacacion = idVacacion
            Me.gestion = gestion
            Me.tipovacacion = tipovacacion
            Me.dias = dias
            Me.fecha1 = fecha1
            Me.fecha2 = fecha2
            Me.fechaIncorporacion = fechaIncorporacion
            Me.observacion = observacion
            Me.estado = estado
        End Sub

        Public Property idVacacion As String
        Public Property gestion As String
        Public Property tipovacacion As String
        Public Property dias As String
        Public Property fecha1 As String
        Public Property fecha2 As String
        Public Property fechaIncorporacion As String
        Public Property observacion As String
        Public Property estado As String
    End Class

    <WebMethod(EnableSession:=True)> _
    Public Shared Function ListaVacaciones(ByVal v1 As String) As Object
        Dim lista_select As List(Of LVacacion) = New List(Of LVacacion)()
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select idVacacion,gestion,tipovacacion,dias,CONVERT (char(10),fecha1,103) as fecha1,CONVERT (char(10),fecha2,103) as fecha2,CONVERT (char(10),fechaIncorporacion,103) as fechaIncorporacion,observacion,estado from vacaciones where idpersonal=" + v1 + " order by idVacacion desc"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                Dim tipo As String
                If (dt.Rows(i)("tipovacacion").ToString() = 0) Then
                    tipo = "Dias cuenta vacacion"
                Else
                    tipo = "Vacacion"
                End If

                lista_select.Add(New LVacacion(dt.Rows(i)("idVacacion").ToString, dt.Rows(i)("gestion").ToString(), tipo, dt.Rows(i)("dias").ToString(), dt.Rows(i)("fecha1").ToString(), dt.Rows(i)("fecha2").ToString(), dt.Rows(i)("fechaIncorporacion").ToString(), dt.Rows(i)("observacion").ToString(), dt.Rows(i)("estado").ToString()))
            Next
            con.Close()
        End If

        Dim json As Object = New With {Key .data = lista_select}
        Return json
    End Function





    'BUSCA MAYOR SALIDA
    <WebMethod(EnableSession:=True)> _
    Public Shared Function Maxvacacion(ByVal v1 As String) As String
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select max(idVacacion) as mayor from vacaciones where idpersonal='" + v1 + "'"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        Return dt.Rows(0).Item(0).ToString
    End Function

    'ANULAR VACACION
    <WebMethod(EnableSession:=True)> _
    Public Shared Function AnularVacacion(ByVal v1 As String) As String
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "update cronogramaV set dias=dias + (select dias from vacaciones where idVacacion='" + v1 + "') where idregistro=(select idcronogramaV from vacaciones where idVacacion='" + v1 + "')"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)

        Dim dt1 As New DataTable()
        Dim consulta1 As String = "update vacaciones set estado='ANULADO'  WHERE idVacacion='" + v1 + "'"
        Dim cmd1 As New SqlCommand(consulta1, con)

        Dim da1 As New SqlDataAdapter(cmd1)
        da1.Fill(dt1)

        con.Close()

        Return "ok"
    End Function
End Class
