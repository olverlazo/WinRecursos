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
Imports System.ComponentModel
Imports System.Net.NetworkInformation
Imports System.Text
Partial Class usuarios_usuario
    Inherits System.Web.UI.Page
    <WebMethod(EnableSession:=True)> _
    Public Shared Function get_usuario(v1 As String, v2 As String) As String
        Dim dm As System.Data.DataTable = New System.Data.DataTable()
        Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            connection.Open()
            Dim consulta As String = "update usuarios set password=ltrim(rtrim('" + v2 + "')) where id_personal ='" + v1 + "'"
            Using cmd As New SqlCommand(consulta, connection)
                Using RDR = cmd.ExecuteReader()
                    dm.Load(RDR)
                End Using
            End Using
        End Using

        Return "OK"

    End Function
End Class
