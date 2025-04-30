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
Partial Class Ev_Cargo
    Inherits System.Web.UI.Page
    Public Class servicio
        Public Property servicio_id() As Integer
            Get
                Return id
            End Get
            Set(value As Integer)
                id = value
            End Set
        End Property
        Private id As Integer
        Public Property servicio_descripcion() As String
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
    Public Shared Function funcion_Cargos() As List(Of servicio)
        Dim lista As List(Of servicio) = New List(Of servicio)()
        Dim dt As New DataTable()
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            Using cmd1 As New SqlCommand("select id_UServicios,servicio  from servicio order by servicio", con)
                con.Open()
                Dim da As New SqlDataAdapter(cmd1)
                da.Fill(dt)
                If dt.Rows.Count > 0 Then
                    For i As Integer = 0 To dt.Rows.Count - 1
                        lista.Add(New servicio() With {.servicio_id = Convert.ToInt32(dt.Rows(i)("id_UServicios")), .servicio_descripcion = dt.Rows(i)("servicio").ToString()})
                    Next
                End If
            End Using
        End Using
        Return lista
    End Function



End Class
