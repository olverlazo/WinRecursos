Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports System.Globalization
Imports System.Web.UI


Partial Class MasterPage3
    Inherits System.Web.UI.MasterPage

    Protected Sub InitializeCulture()
        Thread.CurrentThread.CurrentCulture = New CultureInfo("es-ES")
        Thread.CurrentThread.CurrentUICulture = New CultureInfo("es-ES")
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("idusuario").ToString = "" Then
                Response.Redirect("~/DefaultPersonal.aspx")
            End If
        End If
    End Sub


End Class

