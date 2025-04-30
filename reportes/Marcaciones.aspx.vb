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
Partial Class reportes_Marcaciones
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


    Public Class LMarcaciones
        Public Sub New(ByVal fecha As String, ByVal hora As String, ByVal bloque As String, ByVal servicio As String, ByVal fuente As String, ByVal cargo As String, ByVal tipocontrato As String)
            Me.fecha = fecha
            Me.hora = hora
            Me.bloque = bloque
            Me.servicio = servicio
            Me.fuente = fuente
            Me.cargo = cargo
            Me.tipocontrato = tipocontrato
        End Sub

        Public Property fecha As String
        Public Property hora As String
        Public Property bloque As String
        Public Property servicio As String
        Public Property fuente As String
        Public Property cargo As String
        Public Property tipocontrato As String
    End Class
    <WebMethod(EnableSession:=True)> _
    Public Shared Function ListarMarcaciones(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String) As Object
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim lista As List(Of LMarcaciones) = New List(Of LMarcaciones)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "reporte_marcaciones"
        cmd.Parameters.AddWithValue("@fecha1", v1)
        cmd.Parameters.AddWithValue("@fecha2", v2)
        cmd.Parameters.AddWithValue("@id_personal", v3)
        Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            If dt.Rows.Count > 0 Then
                For i As Integer = 0 To dt.Rows.Count - 1
                    lista.Add(New LMarcaciones(dt.Rows(i)("fecha1").ToString, dt.Rows(i)("hora").ToString(), dt.Rows(i)("bloque").ToString(), dt.Rows(i)("servicio").ToString(), dt.Rows(i)("fuente").ToString(), dt.Rows(i)("cargo").ToString(), dt.Rows(i)("tipocontrato").ToString()))
                Next
            End If
        End Using
        Dim json As Object = New With {Key .data = lista}
        Return json
    End Function

End Class

