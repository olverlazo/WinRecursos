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


Partial Class Ev_Archivos

    Inherits System.Web.UI.Page
    'Dim sw As Boolean = True
    Dim mensaje As String
    Public Function GuardarArchivo(ByVal file As HttpPostedFile, ByVal nombre As String, ByVal tipo As String, ByVal formato As String) As String
        Dim rutatotal As String = "~/temp/" + nombre
        Dim ruta As String = Server.MapPath(rutatotal)
        'If Not Directory.Exists(ruta) Then Directory.CreateDirectory(ruta)
        Dim archivo As String = String.Format("{0}\{1}", ruta, nombre + tipo + formato)
        'Label2.Text = rutatotal
        file.SaveAs(archivo)
        Return "OK"
    End Function

   



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim sw As Boolean = True
        Dim archivo As String
        Dim tipos() As String = {"ci", "cont1", "car1", "foto", "hv"}

        'If (Session("datos")(1) Is Nothing) Then
        If (String.IsNullOrEmpty(Session("datos")(1))) Then
            ClientScript.RegisterStartupScript(Me.GetType(), "Error", "mostrarMensaje1();", True)
        Else
            archivo = Session("datos")(1)

            Try
                'Get the HttpFileCollection
                Dim hfCollection As HttpFileCollection = Request.Files
                For i As Integer = 0 To hfCollection.Count - 1
                    'Get the specific HttpPostedFile by index
                    Dim hPostedFile As HttpPostedFile = hfCollection(i)
                    If hPostedFile.ContentLength > 0 Then
                        'Upload/save to the server
                        'hPostedFile.SaveAs(Server.MapPath("~/temp/" + archivo) & "\" & System.IO.Path.GetFileName(hPostedFile.FileName))
                        If i = 3 Then
                            GuardarArchivo(hPostedFile, archivo, tipos(i), ".jpg")
                        Else
                            GuardarArchivo(hPostedFile, archivo, tipos(i), ".pdf")
                        End If
                        'Report the file was uploaded - you can customize this part -
                        'Response.Write((("<b>File: </b>" & hPostedFile.FileName & " <b>Size:</b> ") & hPostedFile.ContentLength & " <b>Type:</b> ") & hPostedFile.ContentType & " Uploaded Successfully <br/>")
                    Else
                        sw = False
                    End If
                Next


                If sw Then
                    'ClientScript.RegisterStartupScript(Me.GetType(), "Error", "alert(Se guardaron todos lo archivos);", True)
                    Session("form4") = "OK"
                    Response.Redirect("\EV_Djurada.aspx")
                Else
                    Label2.Text = "carge archivos"
                    ClientScript.RegisterStartupScript(Me.GetType(), "Error", "mostrarMensaje();", True)
                End If

                'TOOD: report if a error was fired.
            Catch ex As Exception
                Label2.Text = ex.Message + "cargar archivos"
            End Try

        End If


    End Sub

    Private Sub borrarArchivo(ByVal direccion As String, ByVal tipo As String, ByVal formato As String)
        Try
            Dim RutaArch As String
            'RutaArch = MapPath(".") & direccion
            RutaArch = MapPath(".") + "/temp/" + direccion + "/" + direccion + tipo + formato
            Dim Archivo As FileInfo = New FileInfo(RutaArch)
            If Archivo.Exists Then
                File.Delete(RutaArch)
            Else
                Throw New FileNotFoundException()
            End If
        Catch excepcion As FileNotFoundException
            Label2.Text += excepcion.Message + "no existe archivos"
        End Try
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
