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

Partial Class Contratos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("idusuario").ToString = "" Then
                Response.Redirect("~/Default.aspx")
            End If
        End If
    End Sub


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
    Public Class Contratopersona
        Public Sub New(ByVal id As String, ByVal FFinanciamiento As String, ByVal categoria As String, ByVal tipoContrato As String, ByVal item As String, ByVal fe_ingreso As String, ByVal fe_retiro As String, ByVal estado As String, ByVal documento As String)
            Me.id = id
            Me.FFinanciamiento = FFinanciamiento
            Me.categoria = categoria
            Me.tipoContrato = tipoContrato
            Me.item = item
            Me.fe_ingreso = fe_ingreso
            Me.fe_retiro = fe_retiro
            Me.estado = estado
            Me.documento = documento
        End Sub

        Public Property id As String
        Public Property FFinanciamiento As String
        Public Property categoria As String
        Public Property tipoContrato As String
        Public Property item As String
        Public Property fe_ingreso As String
        Public Property fe_retiro As String
        Public Property estado As String
        Public Property documento As String
    End Class

    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarContratos(ByVal id As String, ByVal id_personal As String, ByVal id_categoria As String, ByVal id_tipocontrato As String, ByVal item As String, ByVal id_FFinanciamiento As String, ByVal ch As String, ByVal f_inicio As String, ByVal f_retiro As String, ByVal mot_retiro As String, ByVal estado As String, ByVal usuario As String, ByVal fecha As String, ByVal sw As String) As Object

        HttpContext.Current.Session("carnet") = id_personal
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim lista1 As List(Of Contratopersona) = New List(Of Contratopersona)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_CONTRATOS"
        cmd.Parameters.AddWithValue("@id", id)
        cmd.Parameters.AddWithValue("@id_personal", id_personal)
        cmd.Parameters.AddWithValue("@id_categoria", id_categoria)
        cmd.Parameters.AddWithValue("@id_tipocontrato", id_tipocontrato)
        cmd.Parameters.AddWithValue("@item", Trim(UCase(item)))
        cmd.Parameters.AddWithValue("@id_Ffinanciamiento", id_FFinanciamiento)
        cmd.Parameters.AddWithValue("@ch", ch)
        If Convert.ToString(f_inicio) = Convert.ToString(0) Then
            f_inicio = "2000-01-01"
        End If

        cmd.Parameters.AddWithValue("@f_inicio", f_inicio)
        If Convert.ToString(f_retiro) = Convert.ToString(0) Then
            f_retiro = "2000-01-01"
        End If
        cmd.Parameters.AddWithValue("@f_retiro", f_retiro)
        cmd.Parameters.AddWithValue("@motivo_retiro", Trim(UCase(mot_retiro)))
        cmd.Parameters.AddWithValue("@estado", estado)
        cmd.Parameters.AddWithValue("@usuario", usuario)
        cmd.Parameters.AddWithValue("@fecha", "01/01/2000")
        cmd.Parameters.AddWithValue("@SW", sw)
        Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            If dt.Rows.Count > 0 Then
                For i As Integer = 0 To dt.Rows.Count - 1
                    Dim ffin As String
                    Dim dt2 As New DataTable()
                    Using con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                        Using cmd2 As New SqlCommand("select f_financiamiento from ffinanciamiento where id='" + dt.Rows(i)("id_FFinanciamiento").ToString() + "'", con1)
                            con1.Open()
                            Dim da2 As New SqlDataAdapter(cmd2)
                            da2.Fill(dt2)
                            If dt2.Rows.Count > 0 Then
                                ffin = dt2.Rows(0)("f_financiamiento").ToString()
                            End If
                            con1.Close()
                        End Using
                    End Using

                    Dim cat As String
                    Dim dt3 As New DataTable()
                    Using con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                        Using cmd2 As New SqlCommand("select categoria from categoria  where id='" + dt.Rows(i)("id_categoria").ToString() + "'", con1)
                            con1.Open()
                            Dim da2 As New SqlDataAdapter(cmd2)
                            da2.Fill(dt3)
                            If dt3.Rows.Count > 0 Then
                                cat = dt3.Rows(0)("categoria").ToString()
                            End If
                            con1.Close()
                        End Using
                    End Using

                    Dim cat1 As String
                    Dim dt4 As New DataTable()
                    Using con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                        Using cmd2 As New SqlCommand("select tipo from tipoContrato  where id='" + dt.Rows(i)("id_tipocontrato").ToString() + "'", con1)
                            con1.Open()
                            Dim da2 As New SqlDataAdapter(cmd2)
                            da2.Fill(dt4)
                            If dt3.Rows.Count > 0 Then
                                cat1 = dt4.Rows(0)("tipo").ToString()
                            End If
                            con1.Close()
                        End Using
                    End Using
                    lista1.Add(New Contratopersona(dt.Rows(i)("id_contrato").ToString, ffin, cat, cat1, dt.Rows(i)("item").ToString(), dt.Rows(i)("fecha_inicio1").ToString(), dt.Rows(i)("fecha_retiro").ToString(), dt.Rows(i)("estado").ToString(), dt.Rows(i)("documento").ToString))
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
            Using cmd2 As New SqlCommand("select *, (select categoria from categoria where id=a.id_categoria) as categoria,(select tipo from tipoContrato where id=a.id_tipocontrato) as contrato,(select f_financiamiento from ffinanciamiento where id=a.id_FFinanciamiento) as fuente from contratos as a where  id_contrato ='" + v1 + "'", con1)
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
                lista.Add(dt2.Rows(0).Item(7).ToString)
                lista.Add(dt2.Rows(0).Item(8).ToString)
                lista.Add(dt2.Rows(0).Item(9).ToString)
                lista.Add(dt2.Rows(0).Item(10).ToString)
                lista.Add(dt2.Rows(0).Item(11).ToString)
                lista.Add(dt2.Rows(0).Item(12).ToString)
                lista.Add(dt2.Rows(0).Item(13).ToString)
                lista.Add(dt2.Rows(0).Item(14).ToString)
                lista.Add(dt2.Rows(0).Item(15).ToString)
            End Using
            con1.Close()
        End Using
        Return lista
    End Function

    'FUNCION VALIDAR NUEVO CONTRATO
   
    <WebMethod(EnableSession:=True)> _
    Public Shared Function valida_contrato(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String) As List(Of String)
        Dim lista As List(Of String) = New List(Of String)()
        Dim msg As String = ""
        Dim sw As Integer = 0
        Dim v33 As Date = Date.ParseExact(v3, "dd/MM/yyyy", System.Globalization.DateTimeFormatInfo.InvariantInfo)


        'Dim v44 As Date = Date.ParseExact(v4, "dd/MM/yyyy", System.Globalization.DateTimeFormatInfo.InvariantInfo)
        ' lista.Add("-")
        If Not IsDate(v33) Then
            sw = 1
            'lista.Add("- La fecha de inicio no es correcta")
            msg = "- La fecha de inicio de contrato no es correcta"
        Else
            If v4 = "" Then
                v4 = "01/01/1900"
            Else
                Dim v44 As Date = Date.ParseExact(v4, "dd/MM/yyyy", System.Globalization.DateTimeFormatInfo.InvariantInfo)
                If Not IsDate(v44) Then
                    ' lista.Add("- La fecha de fin de contrato no es correcta ")
                    msg = msg & vbNewLine & "- La fecha de fin de contrato no es correcta "
                    sw = 1
                Else
                    If CDate(v33) >= CDate(v44) Then
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


































    'FUNCIONES DE CONTRATOS
    '''''''''''''''''''''
    '''''''''''
    ''''''''
    '''''
    '''
    ''
    '
    'CARGAR BLOQUE
    Public Class bloque
        Public Property bloque_id() As Integer
            Get
                Return id
            End Get
            Set(value As Integer)
                id = value
            End Set
        End Property
        Private id As Integer
        Public Property bloque_descripcion() As String
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
    Public Shared Function fun_bloque() As List(Of bloque)
        Dim lista As List(Of bloque) = New List(Of bloque)()
        Dim dt2 As New DataTable()
        Dim con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim cmd2 As New SqlCommand("select * from bloque", con1)
        con1.Open()
        Dim da2 As New SqlDataAdapter(cmd2)
        da2.Fill(dt2)
        For i As Integer = 0 To dt2.Rows.Count - 1
            lista.Add(New bloque() With {.bloque_id = Convert.ToInt32(dt2.Rows(i)("id_bloque")), .bloque_descripcion = dt2.Rows(i)("descripcion").ToString()})
        Next
        con1.Close()
        Return lista
    End Function


    'CARGAR UNIDAD/SERVICIO
    Public Class unidad
        Public Property unidad_id() As Integer
            Get
                Return id
            End Get
            Set(value As Integer)
                id = value
            End Set
        End Property
        Private id As Integer
        Public Property unidad_descripcion() As String
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
    Public Shared Function fun_unidad() As List(Of unidad)
        Dim lista As List(Of unidad) = New List(Of unidad)()
        Dim dt2 As New DataTable()
        Dim con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim cmd2 As New SqlCommand("select id_UServicios, servicio from servicio order by servicio", con1)
        con1.Open()
        Dim da2 As New SqlDataAdapter(cmd2)
        da2.Fill(dt2)
        For i As Integer = 0 To dt2.Rows.Count - 1
            lista.Add(New unidad() With {.unidad_id = Convert.ToInt32(dt2.Rows(i)("id_UServicios")), .unidad_descripcion = dt2.Rows(i)("servicio").ToString()})
        Next
        con1.Close()
        Return lista
    End Function


    Public Class Cargos
        Public Sub New(ByVal id_cargo As String, ByVal bloque As String, ByVal servicio As String, ByVal cargo As String, ByVal fe_ini As String, ByVal fe_fin As String, ByVal estado As String, ByVal documento As String)
            Me.id_cargo = id_cargo
            Me.bloque = bloque
            Me.servicio = servicio
            Me.cargo = cargo
            Me.fe_ini = fe_ini
            Me.fe_fin = fe_fin
            Me.estado = estado
            Me.documento = documento
        End Sub

        Public Property id_cargo As String
        Public Property bloque As String
        Public Property servicio As String
        Public Property cargo As String
        Public Property fe_ini As String
        Public Property fe_fin As String
        Public Property estado As String
        Public Property documento As String
    End Class

    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarCargos(ByVal id_cargo As String, ByVal id_contrato As String, ByVal id_personal As String, ByVal id_bloque As String, ByVal id_servicio As String, ByVal cargo As String, ByVal fecha_ini As String, ByVal fecha_fin As String, ByVal estado As String, ByVal usuario As String, ByVal sw As String) As Object

        'HttpContext.Current.Session("carnet") = id_personal
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim listacargo As List(Of Cargos) = New List(Of Cargos)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_CARGOS"
        cmd.Parameters.AddWithValue("@id", id_cargo)
        cmd.Parameters.AddWithValue("@id_contrato", id_contrato)
        cmd.Parameters.AddWithValue("@id_personal", id_personal)
        cmd.Parameters.AddWithValue("@id_bloque", id_bloque)
        cmd.Parameters.AddWithValue("@id_servicio", id_servicio)
        cmd.Parameters.AddWithValue("@cargo", Trim(UCase(cargo)))

        If Convert.ToString(fecha_ini) = Convert.ToString(0) Then
            fecha_ini = "2000-01-01"
        End If

        cmd.Parameters.AddWithValue("@fecha_ini", fecha_ini)

        If Convert.ToString(fecha_fin) = Convert.ToString(0) Then
            fecha_fin = "2000-01-01"
        End If

        'If Len(Convert.ToString(fecha_fin)) = 0 Then
        '    fecha_fin = "2000-01-01"
        'End If

        cmd.Parameters.AddWithValue("@fecha_fin", fecha_fin)
        cmd.Parameters.AddWithValue("@estado", estado)
        cmd.Parameters.AddWithValue("@usuario", usuario)
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
                        Using cmd2 As New SqlCommand("select servicio from servicio where id_UServicios='" + dt.Rows(i)("id_servicio").ToString() + "'", con1)
                            con1.Open()
                            Dim da2 As New SqlDataAdapter(cmd2)
                            da2.Fill(dt3)
                            If dt3.Rows.Count > 0 Then
                                servicio = dt3.Rows(0)("servicio").ToString()
                            End If
                        End Using
                    End Using
                    listacargo.Add(New Cargos(dt.Rows(i)("id_cargo").ToString, bloque, servicio, dt.Rows(i)("cargo").ToString(), dt.Rows(i)("fecha_inicio").ToString(), dt.Rows(i)("fecha_retiro").ToString(), dt.Rows(i)("estado").ToString(), dt.Rows(i)("documento").ToString))
                Next
            End If
        End Using
        Dim json As Object = New With {Key .Data = listacargo}
        Return json
    End Function




    'FUNCION VALIDAR NUEVO CCARGO

    <WebMethod(EnableSession:=True)> _
    Public Shared Function valida_cargo(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String) As List(Of String)
        Dim lista As List(Of String) = New List(Of String)()
        Dim msg As String = ""
        Dim sw As Integer = 0
        Dim v11 As Date = Date.ParseExact(v1, "dd/MM/yyyy", System.Globalization.DateTimeFormatInfo.InvariantInfo)
        Dim v33 As Date = Date.ParseExact(v3, "dd/MM/yyyy", System.Globalization.DateTimeFormatInfo.InvariantInfo)
        Dim v22 As Date
        Dim v44 As Date
        If v2 <> "" Then
            v22 = Date.ParseExact(v2, "dd/MM/yyyy", System.Globalization.DateTimeFormatInfo.InvariantInfo)
        End If
        If v4 <> "" Then
            v44 = Date.ParseExact(v4, "dd/MM/yyyy", System.Globalization.DateTimeFormatInfo.InvariantInfo)
        End If


        If Not IsDate(v33) Then
            sw = 1
            msg = "- La fecha de inicio de cargo no es correcta"
        Else
            If v5 = "FINALIZADO" Then
                If Not IsDate(v4) And msg = "" Then
                    msg = "- El contrato esta Finalizado, Debe ingresar fecha de finalizacion de cargo"
                Else
                    If (CDate(v4) <= CDate(v33)) And msg = "" Then
                        msg = "- La fecha de fin de cargo debe ser mayor que la fecha de inicio"
                    End If

                    If (CDate(v33) < CDate(v11) Or CDate(v33) > CDate(v22)) And msg = "" Then
                        msg = "- La fecha de inicio de cargo debe estar dentro las fechas del contrato"
                    End If

                    If (CDate(v44) < CDate(v11) Or CDate(v44) > CDate(v22)) And msg = "" Then
                        msg = "- La fecha de fin de cargo debe estar dentro las fechas del contrato"
                    End If
                End If
            Else

                If Not IsDate(v2) Then  ' contrato indefinido
                    If (CDate(v33) < CDate(v11)) And msg = "" Then
                        msg = "- La fecha de inicio de cargo debe ser mayor que la de inicio de contrato" + v2
                    End If

                    If IsDate(v4) Then
                        If (CDate(v44) <= CDate(v33)) And msg = "" Then
                            msg = "- La fecha de fin de cargo debe ser mayor que la fecha de inicio"
                        End If
                    End If
                Else
                    If (CDate(v33) < CDate(v11) Or CDate(v33) > CDate(v22)) And msg = "" Then
                        msg = "- La fecha de inicio y fin de cargo debe estar en el rango de fecha del contrato" + v3
                    End If

                    If IsDate(v4) Then
                        If (CDate(v44) < CDate(v33)) And msg = "" Then
                            msg = "- La fecha de fin de cargo debe ser mayor que la fecha de inicio "
                        End If

                        If (CDate(v44) < CDate(v11) Or CDate(v44) > CDate(v22)) And msg = "" Then
                            msg = "- La fecha de fin de cargo debe estar dentro las fechas del contrato"
                        End If
                    End If
                End If
            End If
        End If

        If msg = "" Then
            Dim dt As New DataTable()
            Dim conn As New SqlConnection()
            Dim cmd As New SqlCommand()
            lista.Clear()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
            cmd.Connection = conn
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "VALIDA_CARGO"
            cmd.Parameters.AddWithValue("@f_inicargo", v3)
            cmd.Parameters.AddWithValue("@f_retiro", v4)
            cmd.Parameters.AddWithValue("@idcontrato", v6)
            Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
                sda.Fill(dt)
            End Using

            If dt.Rows.Count > 0 Then
                msg = msg & vbNewLine & dt.Rows(0).Item(0).ToString
            End If
        End If
        lista.Add(msg)
        Return lista

    End Function


End Class
