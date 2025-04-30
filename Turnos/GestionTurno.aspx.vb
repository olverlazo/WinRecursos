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
Partial Class Turnos_GestionTurno
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
        Public Sub New(ByVal nombres As String, ByVal ci As String, ByVal categoria As String, ByVal contrato As String, ByVal fuente As String, ByVal cargo As String, ByVal bloque As String, ByVal servicio As String)
            Me.nombres = nombres
            Me.ci = ci
            Me.categoria = categoria
            Me.contrato = contrato
            Me.fuente = fuente
            Me.cargo = cargo
            Me.bloque = bloque
            Me.servicio = servicio
        End Sub

        Public Property nombres As String
        Public Property ci As String
        Public Property categoria As String
        Public Property contrato As String
        Public Property fuente As String
        Public Property cargo As String
        Public Property bloque As String
        Public Property servicio As String
    End Class

    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarLista(ByVal v1 As String) As Object
        Dim dt As New DataTable()
        Dim lista As List(Of persona) = New List(Of persona)()
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
                        lista.Add(New persona(dt.Rows(i)("nombres").ToString, dt.Rows(i)("ci").ToString(), dt1.Rows(0).Item(0).ToString, dt1.Rows(0).Item(1).ToString, dt1.Rows(0).Item(2).ToString, dt2.Rows(0).Item(0).ToString, dt2.Rows(0).Item(1).ToString, dt2.Rows(0).Item(2).ToString))
                    End If
                Else
                    lista.Add(New persona(dt.Rows(i)("nombres").ToString, dt.Rows(i)("ci").ToString(), dt.Rows(i)("profesion").ToString(), "", "", "", "", ""))
                End If

            Next
        End If
        conn.Close()
        Dim json As Object = New With {Key .data = lista}
        Return json
    End Function
End Class
