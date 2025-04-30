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
Partial Class KardexPersonal2
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

    'FUNCION DE RPUEBA
    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarLista1(ByVal v1 As String, ByVal v2 As String) As Object
        Dim dt As New DataTable()
        Dim lista As List(Of persona) = New List(Of persona)()

        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            Using cmd As New SqlCommand("select nombre + ' ' + ap_paterno + ' ' + ap_materno as nombres,  CAST(LTRIM(STR([documento] ,50)) AS NVARCHAR(50))+' '+ ISNULL(cast([complemento] as nvarchar(50)),'') +' '+ expedido as ci,CONVERT (char(10),f_nacimiento,103) as f_nacimiento,direccion,telefono,profesion  from dbo.personal where nombre LIKE '%" + v1 + "%'", con)
                con.Open()
                Dim da As New SqlDataAdapter(cmd)
                da.Fill(dt)
                If dt.Rows.Count > 0 Then
                    'For i As Integer = 0 To dt.Rows.Count - 2
                    For i As Integer = 0 To dt.Rows.Count - 1               'objPersona.Add(New persona() With
                        '    .nombres = dt.Rows(i)("nombres").ToString, _
                        '    .ci = dt.Rows(i)("ci").ToString(), _
                        '    .f_nacimiento = dt.Rows(i)("f_nacimiento").ToString(), _
                        '    .direccion = dt.Rows(i)("direccion").ToString(), _
                        '    .telefono = dt.Rows(i)("telefono").ToString(), _
                        '    .profesion = dt.Rows(i)("profesion").ToString() _
                        '})
                        lista.Add(New persona(dt.Rows(i)("nombres").ToString, dt.Rows(i)("ci").ToString(), dt.Rows(i)("f_nacimiento").ToString(), dt.Rows(i)("direccion").ToString(), dt.Rows(i)("telefono").ToString(), dt.Rows(i)("profesion").ToString()))
                        'lista.Add(New persona(i + 1, "eveSDFGFDSGSFDGSFDGFDSGlyn", "45DSFGSFDGDSFG6", "34435", "dfhgdfgfdg", "54654DS6"))
                    Next
                End If
            End Using
        End Using


        'Dim i As Integer = 1215
        'Dim lista As List(Of persona) = New List(Of persona)()
        'lista.Add(New persona(dt.Rows(i)("nombres").ToString, dt.Rows(i)("ci").ToString(), dt.Rows(i)("f_nacimiento").ToString(), dt.Rows(i)("direccion").ToString(), dt.Rows(i)("telefono").ToString(), dt.Rows(i)("profesion").ToString()))
        'lista.Add(New persona("1", "luis", "456", "SDFSFD", "NVB345NBVN", "546546"))
        'lista.Add(New persona("1", "evelyn", "456", "SDFSFD", "NVBNB678VN", "546546"))
        'lista.Add(New persona("1", "pepe", "456", "SDFSFD", "345NVBNBVN", "546546"))
        'lista.Add(New persona("1", "maria", "456", "SDFSFD", "NVBNBVN", "546546"))
        'lista.Add(New persona("1", "andrea", "456", "SDFSFD", "NVBNBV00N", "546546"))
        Dim json As Object = New With {Key .data = lista}


        Return json
    End Function


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
