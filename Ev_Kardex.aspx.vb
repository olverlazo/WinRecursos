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
Imports System.Web.UI.Page
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization

Partial Class Ev_Kardex
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Private Sub GuardarArchivo(ByVal file As HttpPostedFile)
        Dim ruta As String = Server.MapPath("~/temp")
        If Not Directory.Exists(ruta) Then Directory.CreateDirectory(ruta)
        Dim archivo As String = String.Format("{0}\{1}", ruta, file.FileName)
        'If System.IO.File.Exists(archivo) Then
        '    Label2.Text = String.Format("Ya existe una imagen con nombre""{0}"".", file.FileName)
        'Else
        '    file.SaveAs(archivo)
        'End If
    End Sub





End Class
