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
Partial Class Turnos_AdicionarTurnos
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("idusuario").ToString = "" Then
                Response.Redirect("~/Default.aspx")
            End If
        End If
    End Sub
    'MUESTRA LA LISTA DE PERSONAL
    Public Class persona
        Public Sub New(ByVal nombres As String, ByVal ci As String, ByVal f_nacimiento As String, ByVal direccion As String, ByVal telefono As String, ByVal profesion As String)
            Me.nombres = nombres
            Me.ci = ci
            Me.f_nacimiento = f_nacimiento
            Me.direccion = direccion
            Me.telefono = telefono
            Me.profesion = profesion
        End Sub

        Public Property nombres As String
        Public Property ci As String
        Public Property f_nacimiento As String
        Public Property direccion As String
        Public Property telefono As String
        Public Property profesion As String
    End Class

    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarLista(ByVal v1 As String) As Object
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim lista As List(Of persona) = New List(Of persona)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "ListaPersonal"
        cmd.Parameters.AddWithValue("@nombre", v1)
        Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            If dt.Rows.Count > 0 Then
                For i As Integer = 0 To dt.Rows.Count - 1
                    lista.Add(New persona(dt.Rows(i)("nombres").ToString, dt.Rows(i)("ci").ToString(), dt.Rows(i)("f_nacimiento").ToString(), dt.Rows(i)("direccion").ToString(), dt.Rows(i)("telefono").ToString(), dt.Rows(i)("profesion").ToString()))
                Next
            End If
        End Using
        Dim json As Object = New With {Key .data = lista}
        Return json
    End Function


    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarDatos(ByVal v1 As String) As Object
        Dim dt As New DataTable()
        Dim lista As List(Of String) = New List(Of String)()
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select idpersonal ,nombre + ' ' + ap_paterno + ' ' + ap_materno as nombres, [documento] as ci,CONVERT (char(10),f_nacimiento,103) as f_nacimiento,direccion,telefono,profesion from dbo.personal where  nombre + ' ' + ap_paterno + ' ' + ap_materno like '%" + v1 + "%' or CAST(LTRIM(STR([documento] ,50)) AS NVARCHAR(50))+' '+ ISNULL(cast([complemento] as nvarchar(50)),'') like '" + v1 + "%'"
        conn.Open()
        Dim cmd As New SqlCommand(consulta, conn)
        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        sda.Fill(dt)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                Dim DATO As String = "ACTIVO"
                Dim consulta1 As String = "select (SELECT categoria FROM categoria WHERE id=bb.id_categoria) as categoria, (select tipo from tipoContrato where id=bb.id_tipocontrato) as contrato,(select f_financiamiento from ffinanciamiento where id=bb.id_FFinanciamiento) as fuente from contratos bb where id_personal=" + dt.Rows(i)("idpersonal").ToString + " AND estado ='" + DATO + "'"
                Dim cmd1 As New SqlCommand(consulta1, conn)
                Dim dt1 As New DataTable()
                Dim da As New SqlDataAdapter(cmd1)
                da.Fill(dt1)
                If dt1.Rows.Count > 0 Then
                    Dim DATO2 As String = "ACTIVO"
                    Dim consulta2 As String = "select cargo,(SELECT descripcion FROM bloque WHERE id_bloque=car.id_bloque) as bloque1 ,(SELECT servicio FROM servicio  WHERE id_UServicios=car.id_servicio) as servicio1 from cargos car  where id_personal=" + dt.Rows(i)("idpersonal").ToString + " AND  estado ='" + DATO2 + "'"
                    Dim cmd2 As New SqlCommand(consulta2, conn)
                    Dim dt2 As New DataTable()
                    Dim da2 As New SqlDataAdapter(cmd2)
                    da2.Fill(dt2)
                    If dt2.Rows.Count > 0 Then
                        lista.Add(dt.Rows(i)("idpersonal").ToString)
                        lista.Add(dt.Rows(i)("nombres").ToString)
                        lista.Add(dt.Rows(i)("ci").ToString)
                        lista.Add(dt1.Rows(0).Item(0).ToString)
                        lista.Add(dt1.Rows(0).Item(1).ToString)
                        lista.Add(dt1.Rows(0).Item(2).ToString)
                        lista.Add(dt2.Rows(0).Item(0).ToString)
                        lista.Add(dt2.Rows(0).Item(1).ToString)
                        lista.Add(dt2.Rows(0).Item(2).ToString)
                    End If
                Else
                    lista.Add(dt.Rows(i)("idpersonal").ToString)
                    lista.Add(dt.Rows(i)("nombres").ToString)
                    lista.Add(dt.Rows(i)("ci").ToString)
                    lista.Add(dt.Rows(i)("profesion").ToString)
                    lista.Add("error")
                    lista.Add("")
                    lista.Add("")
                    lista.Add("")
                    lista.Add("")
                End If

            Next
        End If
        conn.Close()
        Return lista
    End Function



    'YURNOS HABILITADOS

    Public Class turno
        Public Property turno_id() As Integer
            Get
                Return idtipoturno
            End Get
            Set(value As Integer)
                idtipoturno = value
            End Set
        End Property
        Private idtipoturno As Integer
        Public Property turno_detalle() As String
            Get
                Return detalle
            End Get
            Set(value As String)
                detalle = value
            End Set
        End Property
        Private detalle As String
    End Class


    <WebMethod> _
    Public Shared Function funcion_tipoturno() As List(Of turno)
        Dim dt As New DataTable()
        Dim con As New SqlConnection()
        Dim lista As List(Of turno) = New List(Of turno)()
        con.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        Dim cmd As New SqlCommand("select * from tipoturno ", con)
        con.Open()
        Dim da As SqlDataAdapter = New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                lista.Add(New turno() With {.turno_id = Convert.ToInt32(dt.Rows(i)("idtipoturno")), .turno_detalle = dt.Rows(i)("detalle").ToString()})
            Next
        End If
        Return lista
    End Function



    <WebMethod(EnableSession:=True)> _
    Public Shared Function guardar_turno(ByVal v0 As String, ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String, ByVal v7 As String, ByVal v8 As String, ByVal v9 As String, ByVal v10 As String, ByVal v11 As String, ByVal v12 As String) As Object
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim lista As List(Of persona) = New List(Of persona)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_TURNOS"
        cmd.Parameters.AddWithValue("@id_turno", v0)
        cmd.Parameters.AddWithValue("@id_personal", v1)
        cmd.Parameters.AddWithValue("@id_tipoturno", v2)
        cmd.Parameters.AddWithValue("@horario", v3)
        cmd.Parameters.AddWithValue("@hora1", v4)
        cmd.Parameters.AddWithValue("@hora2", v5)
        cmd.Parameters.AddWithValue("@hora3", v6)
        cmd.Parameters.AddWithValue("@hora4", v7)
        cmd.Parameters.AddWithValue("@fecha", v8)
        cmd.Parameters.AddWithValue("@mes", v9)
        cmd.Parameters.AddWithValue("@id_usuario", v10)
        cmd.Parameters.AddWithValue("@genera_mes", v11)
        cmd.Parameters.AddWithValue("@sw", v12)

        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        sda.Fill(dt)
        Return "OK"
    End Function


    Public Class LTurnos
        Public Sub New(ByVal id_turno As String, ByVal aux As String, ByVal cantidad_horas As String, ByVal horario As String, ByVal fecha As String, ByVal hora1 As String, ByVal hora2 As String, ByVal hora3 As String, ByVal hora4 As String)
            Me.id_turno = id_turno
            Me.aux = aux
            Me.cantidad_horas = cantidad_horas
            Me.horario = horario
            Me.fecha = fecha
            Me.hora1 = hora1
            Me.hora2 = hora2
            Me.hora3 = hora3
            Me.hora4 = hora4
        End Sub

        Public Property id_turno As String
        Public Property aux As String
        Public Property cantidad_horas As String
        Public Property horario As String
        Public Property fecha As String
        Public Property hora1 As String
        Public Property hora2 As String
        Public Property hora3 As String
        Public Property hora4 As String
    End Class
    <WebMethod(EnableSession:=True)> _
    Public Shared Function ListarTurnos(ByVal v1 As String, ByVal v2 As String) As Object
        Dim lista_select As List(Of LTurnos) = New List(Of LTurnos)()
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select a.id_turno,(select b.detalle from tipoturno b where a.id_tipoturno=b.idtipoturno) as aux,a.cantidad_horas,a.horario,CONVERT (char(10),fecha,103) as fecha,RIGHT(LEFT([hora1],5),8) as hora1,RIGHT(LEFT([hora2],5),8) as hora2,RIGHT(LEFT([hora3],5),8) as hora3,RIGHT(LEFT([hora4],5),8) as hora4 from Turnos_personal a  where a.id_personal='" + v1 + "' and mes ='" + v2 + "' order by fecha"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                lista_select.Add(New LTurnos(dt.Rows(i)("id_turno").ToString, dt.Rows(i)("aux").ToString(), dt.Rows(i)("cantidad_horas").ToString(), dt.Rows(i)("horario").ToString(), dt.Rows(i)("fecha").ToString(), dt.Rows(i)("hora1").ToString(), dt.Rows(i)("hora2").ToString(), dt.Rows(i)("hora3").ToString(), dt.Rows(i)("hora4").ToString()))
            Next
            con.Close()
        End If

        Dim json As Object = New With {Key .data = lista_select}
        Return json
    End Function

End Class
