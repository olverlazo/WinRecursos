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
Partial Class CronogramaVacacion
    Inherits System.Web.UI.Page
    Dim carnet As String

    Dim datos As List(Of String) = New List(Of String)()



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("idusuario").ToString = "" Then
                Response.Redirect("~/Default.aspx")
            End If
        End If
    End Sub

    <WebMethod(EnableSession:=True)> _
    Public Shared Function BuscarDatos(ByVal v1 As String) As List(Of String)
        Dim dt As New DataTable()
        Dim persona_select As List(Of String) = New List(Of String)()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select idpersonal,documento,complemento,expedido,nombre,ap_paterno,ap_materno from personal where idpersonal=(select idpersonal from personal where documento=" + v1 + ")"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            persona_select.Add(dt.Rows(0).Item(0).ToString)
            persona_select.Add(dt.Rows(0).Item(1).ToString) 'carnet
            persona_select.Add(dt.Rows(0).Item(2).ToString) 'complemento
            persona_select.Add(dt.Rows(0).Item(3).ToString) ' ciudad
            persona_select.Add(dt.Rows(0).Item(4).ToString) 'nombres
            persona_select.Add(dt.Rows(0).Item(5).ToString) ' paterno
            persona_select.Add(dt.Rows(0).Item(6).ToString) ' paterno
            con.Close()
        Else
            persona_select.Add("error")
        End If

        'dt.Clear()
        Dim dt1 As New DataTable()
        consulta = "select (SELECT categoria FROM categoria WHERE id=bb.id_categoria) as categoria, (select tipo from tipoContrato where id=bb.id_tipocontrato) as contrato,(select f_financiamiento from ffinanciamiento where id=bb.id_FFinanciamiento) as fuente from contratos bb where id_personal=" + persona_select(0) + " and fecha_inicio=(select MAX(fecha_inicio) as fe_ini from contratos where id_personal = " + persona_select(0) + "	group by id_personal) "
        cmd = New SqlCommand(consulta, con)
        con.Open()
        'da = New SqlDataAdapter(cmd)
        Dim da1 As New SqlDataAdapter(cmd)
        da1.Fill(dt1)
        If dt1.Rows.Count > 0 Then
            persona_select.Add(dt1.Rows(0).Item(0).ToString)
            persona_select.Add(dt1.Rows(0).Item(1).ToString) 'carnet
            persona_select.Add(dt1.Rows(0).Item(2).ToString) 'complemento
            con.Close()
        Else
            persona_select.Add("error")
        End If

        'dt.Clear()
        Dim dt2 As New DataTable()
        consulta = "select cargo,(SELECT descripcion FROM bloque WHERE id_bloque=car.id_bloque) as bloque1 , (SELECT servicio FROM servicio  WHERE id_UServicios=car.id_servicio) as servicio1 from cargos car where id_personal=" + persona_select(0) + " AND  estado<>'ANULADO' and fecha_ini=(select MAX(fecha_ini) as fe_ini from cargos  where id_personal = " + persona_select(0) + " group by id_personal)"
        cmd = New SqlCommand(consulta, con)
        con.Open()
        'da = New SqlDataAdapter(cmd)
        Dim da2 As New SqlDataAdapter(cmd)
        da2.Fill(dt2)
        If dt2.Rows.Count > 0 Then
            persona_select.Add(dt2.Rows(0).Item(0).ToString)
            persona_select.Add(dt2.Rows(0).Item(1).ToString) 'carnet
            persona_select.Add(dt2.Rows(0).Item(2).ToString) 'carnet
            con.Close()
        Else
            persona_select.Add("error")
        End If
        Return persona_select
    End Function

    <WebMethod(EnableSession:=True)> _
    Public Shared Function funcion_ingresar_CV(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String, ByVal v7 As String) As String
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_CRONOGRAMAV"
        cmd.Parameters.AddWithValue("@id", v1)
        cmd.Parameters.AddWithValue("@fecha1", v2)
        cmd.Parameters.AddWithValue("@fecha2", v3)
        cmd.Parameters.AddWithValue("@dias", v4)
        cmd.Parameters.AddWithValue("@cas", v5)
        cmd.Parameters.AddWithValue("@idpersonal", v6)
        cmd.Parameters.AddWithValue("@usuario", v7)
        cmd.Parameters.AddWithValue("@sw", 1)
        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        sda.Fill(dt)
        Return "OK"
    End Function


    Public Class cronograma
        Public Sub New(ByVal idregistro As String, ByVal fecha1 As String, ByVal fecha2 As String, ByVal dias As String, ByVal cas As String)
            Me.idregistro = idregistro
            Me.fecha1 = fecha1
            Me.fecha2 = fecha2
            Me.dias = dias
            Me.cas = cas
        End Sub

        Public Property idregistro As String
        Public Property fecha1 As String
        Public Property fecha2 As String
        Public Property dias As String
        Public Property cas As String
    End Class
    <WebMethod(EnableSession:=True)> _
    Public Shared Function ListaCronogramaV(ByVal v1 As String) As Object
        Dim persona_select As List(Of cronograma) = New List(Of cronograma)()
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select idregistro, CONVERT (char(10),fecha1,103) as fecha1 ,CONVERT (char(10),fecha2,103) as fecha2 ,dias ,cas from cronogramaV where idpersonal=" + v1 + " order by fecha1  desc"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                persona_select.Add(New cronograma(dt.Rows(i)("idregistro").ToString, dt.Rows(i)("fecha1").ToString(), dt.Rows(i)("fecha2").ToString(), dt.Rows(i)("dias").ToString(), dt.Rows(i)("cas").ToString()))
            Next
            con.Close()
        End If

        Dim json As Object = New With {Key .data = persona_select}
        Return json
    End Function




End Class