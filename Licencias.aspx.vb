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


Partial Class Licencias
    Inherits System.Web.UI.Page

    Dim carnet As String

    Dim datos As List(Of String) = New List(Of String)()

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



    'MUESTRA LA LISTA DE LICENCIAS
    Public Class salida
        Public Sub New(ByVal idlicencia As String, ByVal fechalicencia As String, ByVal motivo As String, ByVal tipolicencia As String, ByVal resumen As String, ByVal fechaini As String, ByVal fechafin As String, ByVal estado As String)
            Me.idlicencia = idlicencia
            Me.fechalicencia = fechalicencia
            Me.motivo = motivo
            Me.tipolicencia = tipolicencia
            Me.resumen = resumen
            Me.fechaini = fechaini
            Me.fechafin = fechafin
            Me.estado = estado
        End Sub

        Public Property idlicencia As String
        Public Property fechalicencia As String
        Public Property motivo As String
        Public Property tipolicencia As String
        Public Property resumen As String
        Public Property fechaini As String
        Public Property fechafin As String
        Public Property estado As String


    End Class
    <WebMethod(EnableSession:=True)> _
    Public Shared Function ListaDeLicencias(ByVal v1 As String) As Object
        Dim persona_select As List(Of salida) = New List(Of salida)()
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select idlicencia, CONVERT (char(10),fechalicencia,103) as fechalicencia ,motivo,tipolicencia ,resumen,CONVERT (char(10),fechaini,103) as fechaini,CONVERT (char(10),fechafin,103) as fechafin,estado from licencias where idpersonal=" + v1 + " order by fechalicencia asc, estado desc"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                persona_select.Add(New salida(dt.Rows(i)("idlicencia").ToString, dt.Rows(i)("fechalicencia").ToString(), dt.Rows(i)("motivo").ToString(), dt.Rows(i)("tipolicencia").ToString(), dt.Rows(i)("resumen").ToString(), dt.Rows(i)("fechaini").ToString(), dt.Rows(i)("fechafin").ToString(), dt.Rows(i)("estado").ToString()))
            Next
            con.Close()
        End If

        Dim json As Object = New With {Key .data = persona_select}
        Return json
    End Function


    <WebMethod(EnableSession:=True)> _
    Public Shared Function funcion_ingresar_licencia(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String, ByVal v7 As String, ByVal v8 As String, ByVal v9 As String, ByVal v10 As String, ByVal v11 As String) As String
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_LICENCIA"
        cmd.Parameters.AddWithValue("@idlicencia", v1)
        cmd.Parameters.AddWithValue("@idpersonal", v2)
        cmd.Parameters.AddWithValue("@fechalicencia", v3)
        cmd.Parameters.AddWithValue("@motivo", v4)
        cmd.Parameters.AddWithValue("@tipolicencia", v5)
        cmd.Parameters.AddWithValue("@resumen", v6)
        cmd.Parameters.AddWithValue("@fechaini", v7)
        cmd.Parameters.AddWithValue("@fechafin", v8)
        cmd.Parameters.AddWithValue("@usuario", v9)
        cmd.Parameters.AddWithValue("@estado", v10)
        cmd.Parameters.AddWithValue("@sw", v11)
        Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        sda.Fill(dt)
        conn.Close()
        Return "OK"
    End Function



    'BUSCA MAYOR SALIDA
    <WebMethod(EnableSession:=True)> _
    Public Shared Function Maxsalida(ByVal v1 As String) As String
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "select max(idlicencia) as mayor from licencias where idpersonal='" + v1 + "'"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        con.Close()
        Return dt.Rows(0).Item(0).ToString
    End Function



    'ANULAR LICENCIA
    <WebMethod(EnableSession:=True)> _
    Public Shared Function AnularLicencias(ByVal v1 As String) As String
        Dim dt As New DataTable()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim consulta As String = "update licencias set estado='ANULADO'  WHERE idlicencia='" + v1 + "'"
        Dim cmd As New SqlCommand(consulta, con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        con.Close()
        Return "ok"
    End Function
End Class
