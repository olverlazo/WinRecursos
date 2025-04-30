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
Partial Class KardexPersonal
    Inherits System.Web.UI.Page

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
End Class
