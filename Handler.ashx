<%@ WebHandler Language="VB" Class="Handler" %>

Imports System
Imports System.Web
Imports System.Data
Imports System.Collections.Generic
Imports System.Linq
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
Imports Newtonsoft.Json

Public Class Handler : Implements IHttpHandler
    Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        context.Response.ContentType = "text/plain"
        Dim dataTable As DataTable = New DataTable()
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ToString()

        Using adapter As SqlDataAdapter = New SqlDataAdapter("select id_UServicios as id, servicio as text,dependiente as pid from servicio order by text ", connectionString)
            adapter.Fill(dataTable)
        End Using

        Dim nodes As List(Of Node) = New List(Of Node)()

        For Each row As DataRow In dataTable.Rows
            Dim node As Node = New Node()
            node.id = Convert.ToInt32(row("id").ToString())
            node.pid = Convert.ToInt32(row("pid").ToString())
            node.text = row("text").ToString()
            nodes.Add(node)
        Next

        Dim list As List(Of Node) = CreateTreeNodes(nodes)
        context.Response.Write(JsonConvert.SerializeObject(list).Replace("[]", "null"))
    End Sub
    Private Function CreateTreeNodes(ByVal nodes As List(Of Node)) As List(Of Node)
        Dim root As List(Of Node) = nodes.FindAll(Function(node) node.pid = 0)
        Return SortNodes(nodes, root)
    End Function

    Private Function SortNodes(ByVal nodes As List(Of Node), ByVal root As List(Of Node)) As List(Of Node)
        For i As Integer = 0 To root.Count - 1
            Dim children As List(Of Node) = nodes.FindAll(Function(node) node.pid = root(i).id)
            SortNodes(nodes, children)
            root(i).nodes = children
        Next

        Return root
    End Function
    
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property
End Class


Public Class Node
    Public Property id As Integer
    Public Property pid As Integer
    Public Property text As String
    Public nodes As List(Of Node)
End Class
