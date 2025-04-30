Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Linq
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Collections.Generic
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO
Imports System
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Globalization

Imports System.Web.Script.Serialization

Imports System.Web.Script.Services

Imports System.Net
Imports System.Diagnostics

Imports System.Web.UI.Page


Imports MySql.Data

Partial Class EV_ddjj
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("idusuario").ToString = "" Then
                Response.Redirect("~/DefaultPersonal.aspx")
            End If
        End If
    End Sub

    <WebMethod> _
    Public Shared Function impcontrato(ByVal v1 As String) As List(Of String)
        Dim dt As New DataTable()
        Dim dtfecha As New DataTable()
        Dim persona_select As List(Of String) = New List(Of String)()
        Dim consulta As String = "SELECT * FROM contratos  where id_personal='" + v1 + "' and estado='ACTIVO'"
        Dim Contexto As HttpContext = HttpContext.Current
        Try
            Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                Using cmd As New SqlCommand(consulta, con)
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
                        persona_select.Add(dt.Rows(0).Item(6).ToString) ' materno
                        persona_select.Add(dt.Rows(0).Item(7).ToString) ' sexo
                        persona_select.Add(dt.Rows(0).Item(8).ToString) ' sexo
                        persona_select.Add(dt.Rows(0).Item(9).ToString) 'direccion
                        persona_select.Add(dt.Rows(0).Item(10).ToString) 'telefono
                        persona_select.Add(dt.Rows(0).Item(11).ToString) 'correo
                        persona_select.Add(dt.Rows(0).Item(12).ToString) 'caja de seguro

                        con.Close()
                        Return persona_select
                    Else
                        persona_select.Add("error")
                        Return persona_select
                    End If
                End Using
            End Using
        Catch ex As Exception
            'Contexto.Response.ContentType = "application/json"
            'Contexto.Response.Write(consulta)
            'Contexto.Response.End()
            persona_select.Add("error" + ex.Message)
            Return persona_select
        End Try
    End Function


    <WebMethod> _
    Public Shared Function impcargo(v1 As String, v2 As String) As List(Of String)
        Dim dt As New DataTable()
        Dim dtfecha As New DataTable()
        Dim persona_select As List(Of String) = New List(Of String)()
        Dim consulta As String = "select *,(select servicio  from servicio where id_UServicios=cargos.id_servicio) as servicio from cargos where id_personal='" + v1 + "' and estado='ACTIVO' and id_contrato='" + v2 + "'"
        Dim Contexto As HttpContext = HttpContext.Current
        Try
            Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                Using cmd As New SqlCommand(consulta, con)
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
                        persona_select.Add(dt.Rows(0).Item(6).ToString) ' materno
                        persona_select.Add(dt.Rows(0).Item(7).ToString) ' sexo
                        persona_select.Add(dt.Rows(0).Item(8).ToString) ' sexo
                        persona_select.Add(dt.Rows(0).Item(9).ToString) 'direccion
                        persona_select.Add(dt.Rows(0).Item(10).ToString) 'telefono
                        persona_select.Add(dt.Rows(0).Item(11).ToString) 'correo
                        con.Close()
                        Return persona_select
                    Else
                        persona_select.Add("error")
                        Return persona_select
                    End If
                End Using
            End Using
        Catch ex As Exception
            'Contexto.Response.ContentType = "application/json"
            'Contexto.Response.Write(consulta)
            'Contexto.Response.End()
            persona_select.Add("error" + consulta)
            Return persona_select
        End Try
    End Function


End Class
