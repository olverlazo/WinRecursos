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


Partial Class Cargos
    Inherits System.Web.UI.Page


    'CARGAR fuente financiamiento
    Public Class fuen_financiamiento
        Public Property fuente_id() As Integer
            Get
                Return id
            End Get
            Set(value As Integer)
                id = value
            End Set
        End Property
        Private id As Integer
        Public Property fuente_descripcion() As String
            Get
                Return descripcion
            End Get
            Set(value As String)
                descripcion = value
            End Set
        End Property
        Private descripcion As String
    End Class
    <WebMethod> _
    Public Shared Function fuente_financiamiento(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String) As List(Of fuen_financiamiento)
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim lista As List(Of fuen_financiamiento) = New List(Of fuen_financiamiento)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_FFINANCIAMIENTO"
        cmd.Parameters.AddWithValue("@ID", v1)
        cmd.Parameters.AddWithValue("@ffinaciemiento ", v2)
        cmd.Parameters.AddWithValue("@sw", v3)
        Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            If dt.Rows.Count > 0 Then
                '  lista.Add(New fuen_financiamiento() With {.fuente_id = " ", .fuente_descripcion = "--Seleccionar--"})
                For i As Integer = 0 To dt.Rows.Count - 1
                    lista.Add(New fuen_financiamiento() With {.fuente_id = Convert.ToInt32(dt.Rows(i)("id")), .fuente_descripcion = dt.Rows(i)("f_financiamiento").ToString()})
                Next
            End If
        End Using
        Return lista
    End Function


    'CARGAR CATEGORIA
    Public Class categoria
        Public Property categoria_id() As Integer
            Get
                Return id
            End Get
            Set(value As Integer)
                id = value
            End Set
        End Property
        Private id As Integer
        Public Property categoria_descripcion() As String
            Get
                Return descripcion
            End Get
            Set(value As String)
                descripcion = value
            End Set
        End Property
        Private descripcion As String
    End Class
    <WebMethod> _
    Public Shared Function funcion_Categoria(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String) As List(Of categoria)
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim lista As List(Of categoria) = New List(Of categoria)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_CATEGORIA"
        cmd.Parameters.AddWithValue("@ID", v1)
        cmd.Parameters.AddWithValue("@CATEGORIA", v2)
        cmd.Parameters.AddWithValue("@sw", v3)
        Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            If dt.Rows.Count > 0 Then
                'lista.Add(New categoria() With {.categoria_id = "0", .categoria_descripcion = "--Seleccionar--"})
                For i As Integer = 0 To dt.Rows.Count - 1
                    lista.Add(New categoria() With {.categoria_id = Convert.ToInt32(dt.Rows(i)("id")), .categoria_descripcion = dt.Rows(i)("descripcion").ToString()})
                    ' lista.Add(New categoria() With {.categoria_id = "1", .categoria_descripcion = "erer4444"})
                Next
            End If
        End Using
        Return lista
    End Function


    'CARGAR TIPO DE PERSONAL
    Public Class T_PERSONAL
        Public Property tpersponal_id() As Integer
            Get
                Return id
            End Get
            Set(value As Integer)
                id = value
            End Set
        End Property
        Private id As Integer
        Public Property tpersponal_tipo() As String
            Get
                Return tipo
            End Get
            Set(value As String)
                tipo = value
            End Set
        End Property
        Private tipo As String
    End Class
    <WebMethod> _
    Public Shared Function tipo_personal(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String) As List(Of T_PERSONAL)
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim lista As List(Of T_PERSONAL) = New List(Of T_PERSONAL)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_tipo_personal"
        cmd.Parameters.AddWithValue("@ID", v1)
        cmd.Parameters.AddWithValue("@tipo ", v2)
        cmd.Parameters.AddWithValue("@sw", v3)
        Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            If dt.Rows.Count > 0 Then
                '  lista.Add(New fuen_financiamiento() With {.fuente_id = " ", .fuente_descripcion = "--Seleccionar--"})
                For i As Integer = 0 To dt.Rows.Count - 1
                    lista.Add(New T_PERSONAL() With {.tpersponal_id = Convert.ToInt32(dt.Rows(i)("id")), .tpersponal_tipo = dt.Rows(i)("tipo").ToString()})
                Next
            End If
        End Using
        Return lista
    End Function



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



    'MUESTRA LOS CONTRATOS DEL PERSONAL
    Public Class cargos
        Public Sub New(ByVal id As String, ByVal id_contrato As String, ByVal id_personal As String, ByVal id_bloque As String, ByVal id_servicio As String, ByVal cargo As String, ByVal fecha_ini As String, ByVal fecha_fin As String)
            Me.id = id
            Me.id_contrato = id_contrato
            Me.id_personal = id_personal
            Me.id_bloque = id_bloque
            Me.id_servicio = id_servicio
            Me.cargo = cargo
            Me.fecha_ini = fecha_ini
            Me.fecha_fin = fecha_fin
        End Sub

        Public Property id As String
        Public Property id_contrato As String
        Public Property id_personal As String
        Public Property id_bloque As String
        Public Property id_servicio As String
        Public Property cargo As String
        Public Property fecha_ini As String
        Public Property fecha_fin As String
    End Class

    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarCargos(ByVal id As String, ByVal id_contrato As String, ByVal id_personal As String, ByVal id_bloque As String, ByVal id_servicio As String, ByVal cargo As String, ByVal fecha_ini As String, ByVal fecha_fin As String, ByVal sw As String) As Object
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim lista1 As List(Of cargos) = New List(Of cargos)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_CARGOS"
        cmd.Parameters.AddWithValue("@id", id)
        cmd.Parameters.AddWithValue("@id_contrato", id_contrato)
        cmd.Parameters.AddWithValue("@id_personal", id_personal)
        cmd.Parameters.AddWithValue("@id_bloque", id_bloque)
        cmd.Parameters.AddWithValue("@id_servicio", id_servicio)
        cmd.Parameters.AddWithValue("@cargo", cargo)
        If Convert.ToString(fecha_ini) = Convert.ToString(0) Then
            fecha_ini = "01/01/2000"
        End If

        cmd.Parameters.AddWithValue("@fecha_ini", fecha_ini)
        If Convert.ToString(fecha_fin) = Convert.ToString(0) Then
            fecha_fin = "01/01/2000"
        End If
        cmd.Parameters.AddWithValue("@fecha_fin", fecha_fin)
        cmd.Parameters.AddWithValue("@SW", sw)
        Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            If dt.Rows.Count > 0 Then
                For i As Integer = 0 To dt.Rows.Count - 1
                    Dim bloque As String
                    Dim dt2 As New DataTable()
                    Using con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                        Using cmd2 As New SqlCommand("select descripcion from bloque where id_bloque='" + dt.Rows(i)("id_bloque").ToString() + "'", con1)
                            con1.Open()
                            Dim da2 As New SqlDataAdapter(cmd2)
                            da2.Fill(dt2)
                            If dt2.Rows.Count > 0 Then
                                bloque = dt2.Rows(0)("descripcion").ToString()
                            End If
                        End Using
                    End Using

                    Dim servicio As String
                    Dim dt3 As New DataTable()
                    Using con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                        Using cmd2 As New SqlCommand("select servicio from servicio where id_uservicios='" + dt.Rows(i)("id_servicio").ToString() + "'", con1)
                            con1.Open()
                            Dim da2 As New SqlDataAdapter(cmd2)
                            da2.Fill(dt3)
                            If dt3.Rows.Count > 0 Then
                                servicio = dt3.Rows(0)("servicio").ToString()
                            End If
                        End Using
                    End Using
                    lista1.Add(New cargos(dt.Rows(i)("id").ToString, dt.Rows(i)("id_contrato").ToString, dt.Rows(i)("id_personal").ToString, bloque, servicio, dt.Rows(i)("cargo").ToString(), dt.Rows(i)("fecha_inicio").ToString(), dt.Rows(i)("fecha_retiro").ToString()))
                Next
            End If
        End Using
        Dim json As Object = New With {Key .Data = lista1}
        Return json
    End Function


    'FUNCION VER DATOS DE EDICION
    <WebMethod(EnableSession:=True)> _
    Public Shared Function ver_datos(ByVal v1 As String) As List(Of String)
        Dim lista As List(Of String) = New List(Of String)()
        Dim dt2 As New DataTable()
        Using con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            Using cmd2 As New SqlCommand("SELECT id_categoria,id_FFinanciamiento,id_tipocontrato,item ,carga_horaria ,fecha_inicio ,fecha_retiro  FROM dbo.contratos WHERE id='" + v1 + "'", con1)
                con1.Open()
                Dim da2 As New SqlDataAdapter(cmd2)
                da2.Fill(dt2)
                lista.Add(dt2.Rows(0).Item(0).ToString)
                lista.Add(dt2.Rows(0).Item(1).ToString)
                lista.Add(dt2.Rows(0).Item(2).ToString)
                lista.Add(dt2.Rows(0).Item(3).ToString)
                lista.Add(dt2.Rows(0).Item(4).ToString)
                lista.Add(dt2.Rows(0).Item(5).ToString)
                lista.Add(dt2.Rows(0).Item(6).ToString)
            End Using
        End Using
        Return lista
    End Function

    'FUNCION VALIDAR NUEVO CONTRATO

    <WebMethod(EnableSession:=True)> _
    Public Shared Function valida_contrato(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String) As List(Of String)
        Dim lista As List(Of String) = New List(Of String)()
        Dim msg As String = ""
        Dim sw As Integer = 0

        ' lista.Add("-")
        If Not IsDate(v3) Then
            sw = 1
            'lista.Add("- La fecha de inicio no es correcta")
            msg = "- La fecha de inicio de contrato no es correcta"
        Else
            If v4 = "" Then
                v4 = "01/01/1900"
            Else
                If Not IsDate(v4) Then
                    ' lista.Add("- La fecha de fin de contrato no es correcta ")
                    msg = msg & vbNewLine & "- La fecha de fin de contrato no es correcta "
                    sw = 1
                Else
                    If v4 <= v3 Then
                        ' lista.Add("- La fecha de fin de contrato debe ser mayor")
                        msg = msg & vbNewLine & "- La fecha de fin de contrato debe ser mayor que el inicio de contrato"
                        sw = 1
                    End If
                End If
            End If

        End If



        If sw = 0 Then
            Dim dt As New DataTable()
            Dim conn As New SqlConnection()
            Dim cmd As New SqlCommand()
            lista.Clear()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
            cmd.Connection = conn
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "VALIDA_CONTRATO"
            cmd.Parameters.AddWithValue("@ID_CONTRATO", v1)
            cmd.Parameters.AddWithValue("@CARNET", v2)
            cmd.Parameters.AddWithValue("@f_ingreso", v3)
            cmd.Parameters.AddWithValue("@f_retiro", v4)
            Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
                sda.Fill(dt)
            End Using

            If dt.Rows.Count > 0 Then
                msg = msg & vbNewLine & dt.Rows(0).Item(0).ToString
            End If

            'lista.Add(dt.Rows(0).Item(0).ToString)
            'lista.Add(dt.Rows(0).Item(1).ToString)
            'lista.Add(dt.Rows(0).Item(2).ToString)

        End If
        lista.Add(msg)
        Return lista

    End Function

End Class

