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
Partial Class Permisos
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
            'con.Close()
        Else
            persona_select.Add("error")
        End If

        'dt.Clear()
        Dim dt1 As New DataTable()
        consulta = "select (SELECT categoria FROM categoria WHERE id=bb.id_categoria) as categoria, (select tipo from tipoContrato where id=bb.id_tipocontrato) as contrato,(select f_financiamiento from ffinanciamiento where id=bb.id_FFinanciamiento) as fuente from contratos bb where id_personal=" + persona_select(0) + " and fecha_inicio=(select MAX(fecha_inicio) as fe_ini from contratos where id_personal = " + persona_select(0) + "	group by id_personal) "
        cmd = New SqlCommand(consulta, con)
        'con.Open()
        'da = New SqlDataAdapter(cmd)
        Dim da1 As New SqlDataAdapter(cmd)
        da1.Fill(dt1)
        If dt1.Rows.Count > 0 Then
            persona_select.Add(dt1.Rows(0).Item(0).ToString)
            persona_select.Add(dt1.Rows(0).Item(1).ToString) 'carnet
            persona_select.Add(dt1.Rows(0).Item(2).ToString) 'complemento
            'con.Close()
        Else
            persona_select.Add("error")
        End If

        'dt.Clear()
        Dim dt2 As New DataTable()
        consulta = "select cargo,(SELECT descripcion FROM bloque WHERE id_bloque=car.id_bloque) as bloque1 , (SELECT servicio FROM servicio  WHERE id_UServicios=car.id_servicio) as servicio1 from cargos car where id_personal=" + persona_select(0) + " AND  estado<>'ANULADO' and fecha_ini=(select MAX(fecha_ini) as fe_ini from cargos  where id_personal = " + persona_select(0) + " group by id_personal)"
        cmd = New SqlCommand(consulta, con)
        'con.Open()
        'da = New SqlDataAdapter(cmd)
        Dim da2 As New SqlDataAdapter(cmd)
        da2.Fill(dt2)
        If dt2.Rows.Count > 0 Then
            persona_select.Add(dt2.Rows(0).Item(0).ToString)
            persona_select.Add(dt2.Rows(0).Item(1).ToString) 'carnet
            persona_select.Add(dt2.Rows(0).Item(2).ToString) 'carnet
            'con.Close()
        Else
            persona_select.Add("error")
        End If
        con.Close()
        Return persona_select

        'Dim json As Object = New With {Key .data = persona_select}
        'Return json
    End Function

    ' Public Shared Function funcion_ingresar_salida(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String, ByVal v7 As String, ByVal v8 As String, ByVal v9 As String, ByVal v10 As String, ByVal v11 As String, ByVal v12 As String, ByVal v13 As String) As String

    <WebMethod(EnableSession:=True)> _
    Public Shared Function funcion_ingresar_salida(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String, ByVal v7 As String, ByVal v8 As String, ByVal v9 As String, ByVal v10 As String, ByVal v11 As String, ByVal v12 As String, ByVal v13 As String) As String
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_SALIDA"
        cmd.Parameters.AddWithValue("@idsalida", v1)
        cmd.Parameters.AddWithValue("@id_personal", v2)
        cmd.Parameters.AddWithValue("@fechasalida", v3)
        cmd.Parameters.AddWithValue("@motivo", v4)
        cmd.Parameters.AddWithValue("@marcacion", v5)
        cmd.Parameters.AddWithValue("@h_salida", v6)
        cmd.Parameters.AddWithValue("@h_regreso", v7)
        cmd.Parameters.AddWithValue("@estado", v8)
        cmd.Parameters.AddWithValue("@fecharegistro", v9)
        cmd.Parameters.AddWithValue("@usuario", v10)
        cmd.Parameters.AddWithValue("@planilla", 0)
        cmd.Parameters.AddWithValue("@tiposalida", v12)
        cmd.Parameters.AddWithValue("@sw", v13)
        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        sda.Fill(dt)
        Return "OK"
    End Function


    'MUESTRA LA LISTA DE SALIDAS
    Public Class salida
        Public Sub New(ByVal idSalida As String, ByVal fechasalida As String, ByVal motivo As String, ByVal marcacion As String, ByVal h_salida As String, ByVal h_regreso As String, ByVal estado As String, ByVal tiposalida As String)
            Me.idSalida = idSalida
            Me.fechasalida = fechasalida
            Me.motivo = motivo
            Me.marcacion = marcacion
            Me.h_salida = h_salida
            Me.h_regreso = h_regreso
            Me.estado = estado
            Me.tiposalida = tiposalida
        End Sub

        Public Property idSalida As String
        Public Property fechasalida As String
        Public Property motivo As String
        Public Property marcacion As String
        Public Property h_salida As String
        Public Property h_regreso As String
        Public Property estado As String
        Public Property tiposalida As String
    End Class

    <WebMethod(EnableSession:=True)> _
    Public Shared Function ListaDePermisos(ByVal v1 As String) As Object
        Dim persona_select As List(Of salida) = New List(Of salida)()
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select idSalida, CONVERT (char(10),fechaSalida,103) as fechaSalida ,motivo,marcacion,h_salida,h_regreso,estado,tiposalida from salidas where idpersonal=" + v1 + "order by fechaSalida desc,estado desc"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                persona_select.Add(New salida(dt.Rows(i)("idSalida").ToString, dt.Rows(i)("fechasalida").ToString(), dt.Rows(i)("motivo").ToString(), dt.Rows(i)("marcacion").ToString(), dt.Rows(i)("h_salida").ToString(), dt.Rows(i)("h_regreso").ToString(), dt.Rows(i)("estado").ToString(), dt.Rows(i)("tiposalida").ToString()))
            Next
            con.Close()
        End If

        Dim json As Object = New With {Key .data = persona_select}
        Return json
    End Function



    'ANULAR PERMISO
    <WebMethod(EnableSession:=True)> _
    Public Shared Function AnularPermisos(ByVal v1 As String) As String
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "update salidas set estado='ANULADO'  WHERE idSalida='" + v1 + "'"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        Return "ok"
    End Function



    'BUSCA MAYOR SALIDA
    <WebMethod(EnableSession:=True)> _
    Public Shared Function Maxsalida(ByVal v1 As String) As String
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select max(idSalida) as mayor from salidas where idpersonal='" + v1 + "'"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        Return dt.Rows(0).Item(0).ToString
    End Function


    <WebMethod(EnableSession:=True)> _
    Public Shared Function BuscarMayorSalida(ByVal v1 As String) As List(Of String)
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

        'Dim json As Object = New With {Key .data = persona_select}
        'Return json
    End Function


End Class
