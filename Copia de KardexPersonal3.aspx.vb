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




Partial Class KardexPersonal3
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
    Public Class seguros
        Public Property seguros_id() As Integer
            Get
                Return id
            End Get
            Set(value As Integer)
                id = value
            End Set
        End Property
        Private id As Integer
        Public Property seguros_descripcion() As String
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
    Public Shared Function funcion_Seguros(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String) As List(Of seguros)
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim lista As List(Of seguros) = New List(Of seguros)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_CAJA_SEGURO"
        cmd.Parameters.AddWithValue("@ID_CAJA", v1)
        cmd.Parameters.AddWithValue("@CODIGO", v2)
        cmd.Parameters.AddWithValue("@DESCRIPCION", v3)
        cmd.Parameters.AddWithValue("@sw", v4)
        Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            If dt.Rows.Count > 0 Then
                For i As Integer = 0 To dt.Rows.Count - 1
                    lista.Add(New seguros() With {.seguros_id = Convert.ToInt32(dt.Rows(i)("id")), .seguros_descripcion = dt.Rows(i)("descripcion").ToString()})
                Next
            End If
        End Using
        Return lista
    End Function

    Public Class estudio
        Public Property estudio_id() As Integer
            Get
                Return id
            End Get
            Set(value As Integer)
                id = value
            End Set
        End Property
        Private id As Integer
        Public Property estudio_descripcion() As String
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
    Public Shared Function funcion_estudio(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String) As List(Of estudio)
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim lista As List(Of estudio) = New List(Of estudio)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_NIVEL_ESTUDIO"
        cmd.Parameters.AddWithValue("@ID", v1)
        cmd.Parameters.AddWithValue("@CODIGO", v2)
        cmd.Parameters.AddWithValue("@DESCRIPCION", v3)
        cmd.Parameters.AddWithValue("@sw", v4)
        Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            If dt.Rows.Count > 0 Then
                For i As Integer = 0 To dt.Rows.Count - 1
                    lista.Add(New estudio() With {.estudio_id = Convert.ToInt32(dt.Rows(i)("id")), .estudio_descripcion = dt.Rows(i)("descripcion").ToString()})
                Next
            End If
        End Using
        Return lista
    End Function


    <WebMethod(EnableSession:=True)> Public Shared Function funcion_ingresar(ByVal texto As String) As String
        'Public Shared Function funcion_ingresar(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String, ByVal v7 As String, ByVal v8 As String, ByVal v9 As String, ByVal v10 As String, ByVal v11 As String, ByVal v12 As String, ByVal v13 As String, ByVal v14 As String, ByVal v15 As String, ByVal v16 As String, ByVal v17 As String, ByVal v18 As String, ByVal v19 As String, ByVal v20 As String, ByVal v21 As String, ByVal v22 As String, ByVal v23 As String, ByVal v24 As String, ByVal v25 As String, ByVal v26 As String, ByVal v27 As String, ByVal v28 As String, ByVal v29 As String, ByVal v30 As HttpPostedFileBase, ByVal v31 As String, ByVal v32 As String, ByVal v33 As String, ByVal v34 As String, ByVal v35 As String, ByVal v36 As String, ByVal v37 As String, ByVal v38 As String, ByVal v39 As String) As String
        Return texto


        'Dim dt As New DataTable()
        'Dim conn As New SqlConnection()
        'Dim cmd As New SqlCommand()
        'conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        'cmd.Connection = conn
        'cmd.CommandType = CommandType.StoredProcedure
        'cmd.CommandText = "GET_PERSONAL"
        'cmd.Parameters.AddWithValue("@idpersonal", v1)
        'cmd.Parameters.AddWithValue("@documento", v2)
        'cmd.Parameters.AddWithValue("@complemento", v3)
        'cmd.Parameters.AddWithValue("@expedido", v4)
        'cmd.Parameters.AddWithValue("@nombre", v5)
        'cmd.Parameters.AddWithValue("@ap_paterno", v6)
        'cmd.Parameters.AddWithValue("@ap_materno", v7)
        'cmd.Parameters.AddWithValue("@sexo", v8)
        'cmd.Parameters.AddWithValue("@f_nacimiento", v9)
        'cmd.Parameters.AddWithValue("@direccion", v10)
        'cmd.Parameters.AddWithValue("@telefono", v11)
        'cmd.Parameters.AddWithValue("@correo", v12)
        'cmd.Parameters.AddWithValue("@c_seguro", v13)
        'cmd.Parameters.AddWithValue("@m_seguro", v14)
        'cmd.Parameters.AddWithValue("@e_afiliado", v15)
        'cmd.Parameters.AddWithValue("@c_afiliado", v16)
        'cmd.Parameters.AddWithValue("@f_ing_sis_salud", v17)
        'cmd.Parameters.AddWithValue("@d_contraloria", v18)
        'cmd.Parameters.AddWithValue("@d_risaj", v19)
        'cmd.Parameters.AddWithValue("@f_risaj", v20)
        'cmd.Parameters.AddWithValue("@d_sipasse", v21)
        'cmd.Parameters.AddWithValue("@f_sipasse", v22)
        'cmd.Parameters.AddWithValue("@d_libreta", v23)
        'cmd.Parameters.AddWithValue("@f_asig_vacacion", v24)
        'cmd.Parameters.AddWithValue("@fuente_verif_vacacion", v25)
        'cmd.Parameters.AddWithValue("@n_estudio", v26)
        'cmd.Parameters.AddWithValue("@profesion", v27)
        'cmd.Parameters.AddWithValue("@mat_profesion", v28)
        'cmd.Parameters.AddWithValue("@mat_especialidad", v29)
        'cmd.Parameters.AddWithValue("@foto", v30)
        'cmd.Parameters.AddWithValue("@estado", v31)
        'cmd.Parameters.AddWithValue("@id_biometrico", v32)
        'cmd.Parameters.AddWithValue("@file", v33)
        'cmd.Parameters.AddWithValue("@r1", v34)
        'cmd.Parameters.AddWithValue("@r2", v35)
        'cmd.Parameters.AddWithValue("@r3", v36)
        'cmd.Parameters.AddWithValue("@r4", v37)
        'cmd.Parameters.AddWithValue("@f_registro_personal", v38)
        'cmd.Parameters.AddWithValue("@usuario_r_personal", v39)
        'cmd.Parameters.AddWithValue("@sw", 1)




        'Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
        'sda.Fill(dt)






        ' Return texto
    End Function

End Class
