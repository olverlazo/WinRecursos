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
Imports ThoughtWorks.QRCode
Imports ThoughtWorks.QRCode.Codec
Imports ThoughtWorks.QRCode.Codec.Data
Imports System.Web.Script.Serialization

Imports System.Web.Script.Services

Imports System.Net
Imports System.Diagnostics

Imports System.Web.UI.Page

Imports MySql.Data.MySqlClient
Imports MySql.Data
Partial Class MasterPage2
    Inherits System.Web.UI.MasterPage



    Public Class menu
        Public Sub New(ByVal codigoMenu As String, ByVal codigoMenuPadre As String, ByVal icono As String, ByVal link As String, ByVal lugar As String, ByVal menu As String, ByVal mostrarEnMenu As String)
            Me.codigoMenu = codigoMenu
            Me.codigoMenuPadre = codigoMenuPadre
            Me.icono = icono
            Me.link = link
            Me.lugar = lugar
            Me.menu = menu
            Me.mostrarEnMenu = mostrarEnMenu
        End Sub

        Public Property codigoMenu As String
        Public Property codigoMenuPadre As String
        Public Property icono As String
        Public Property link As String
        Public Property lugar As String
        Public Property menu As String
        Public Property mostrarEnMenu As String
    End Class



    Public Class menu1
        Public Property codigoMenu1() As Integer
            Get
                Return codigoMenu
            End Get
            Set(value As Integer)
                codigoMenu = value
            End Set
        End Property
        Private codigoMenu As Integer
        Public Property codigoMenuPadre1() As String
            Get
                Return codigoMenuPadre
            End Get
            Set(value As String)
                codigoMenuPadre = value
            End Set
        End Property
        Private codigoMenuPadre As String
    End Class
    <WebMethod(EnableSession:=True)> _
    Public Function ObtenerTodoMenu() As List(Of Menu)
        Dim v1 As Integer = Session("idusuario")

        Dim dt As New DataTable()
        Dim menu_lista As List(Of menu) = New List(Of menu)()
        Dim menu_lista1 As List(Of menu1) = New List(Of menu1)()

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        'Dim cmd As New SqlCommand("select codigoMenu,codigoMenuPadre,icono,link,lugar,menu,mostrarEnMenu from dbo.AccesoMenu where id_personal=" + v1 + "'", con)
        Dim cmd As New SqlCommand("select codigoMenu,codigoMenuPadre,icono,link,lugar,menu,mostrarEnMenu from dbo.AccesoMenu ", con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                'menu_lista.Add(New menu(dt.Rows(i)("codigoMenu").ToString, dt.Rows(i)("codigoMenuPadre").ToString, dt.Rows(i)("icono").ToString(), dt.Rows(i)("link").ToString(), dt.Rows(i)("lugar").ToString(), dt.Rows(i)("menu").ToString(), dt.Rows(i)("mostrarEnMenu").ToString()))
                menu_lista.Add(New menu(dt.Rows(i)("codigoMenu").ToString, dt.Rows(i)("codigoMenuPadre").ToString, dt.Rows(i)("icono").ToString(), dt.Rows(i)("link").ToString(), dt.Rows(i)("lugar").ToString(), dt.Rows(i)("menu").ToString(), dt.Rows(i)("mostrarEnMenu").ToString()))
                menu_lista1.Add(New menu1() With {.codigoMenu1 = Convert.ToInt32(dt.Rows(i)("codigoMenu")), .codigoMenuPadre1 = dt.Rows(i)("codigoMenuPadre").ToString()})
            Next
            con.Close()
        End If
        Dim json As Object = New With {Key .data = menu_lista}

        Return menu_lista


    End Function
End Class



