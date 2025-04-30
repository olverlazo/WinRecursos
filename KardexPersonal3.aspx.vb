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

Partial Class KardexPersonal3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Session("idusuario").ToString = "" Then
                Response.Redirect("~/Default.aspx")
            End If
        End If
    End Sub


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

    
    <WebMethod> _
    Public Shared Function funcion_personal(ByVal v1 As String) As List(Of String)
        Dim dt As New DataTable()
        Dim conn As New SqlConnection()
        Dim cmd As New SqlCommand()
        Dim persona_select As List(Of String) = New List(Of String)()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = "GET_PERSONAL"
        cmd.Parameters.AddWithValue("@idpersonal", 0)
        cmd.Parameters.AddWithValue("@documento", v1)
        cmd.Parameters.AddWithValue("@complemento", 0)
        cmd.Parameters.AddWithValue("@expedido", 0)
        cmd.Parameters.AddWithValue("@nombre", 0)
        cmd.Parameters.AddWithValue("@ap_paterno", 0)
        cmd.Parameters.AddWithValue("@ap_materno", 0)
        cmd.Parameters.AddWithValue("@sexo", 0)
        cmd.Parameters.AddWithValue("@f_nacimiento", "01/01/2000")
        cmd.Parameters.AddWithValue("@direccion", 0)
        cmd.Parameters.AddWithValue("@telefono", 0)
        cmd.Parameters.AddWithValue("@correo", "")
        cmd.Parameters.AddWithValue("@c_seguro", "")
        cmd.Parameters.AddWithValue("@m_seguro", "")
        cmd.Parameters.AddWithValue("@e_afiliado", "")
        cmd.Parameters.AddWithValue("@c_afiliado", "")
        cmd.Parameters.AddWithValue("@f_ing_sis_salud", "01/01/2000")
        cmd.Parameters.AddWithValue("@d_contraloria", "")
        cmd.Parameters.AddWithValue("@d_risaj", "")
        cmd.Parameters.AddWithValue("@f_risaj", "")
        cmd.Parameters.AddWithValue("@d_sipasse", "")
        cmd.Parameters.AddWithValue("@f_sipasse", "")
        cmd.Parameters.AddWithValue("@d_libreta", "")
        cmd.Parameters.AddWithValue("@f_asig_vacacion", "")
        cmd.Parameters.AddWithValue("@fuente_verif_vacacion", "")
        cmd.Parameters.AddWithValue("@n_estudio", "")
        cmd.Parameters.AddWithValue("@profesion", "")
        cmd.Parameters.AddWithValue("@mat_profesion", "")
        cmd.Parameters.AddWithValue("@mat_especialidad", "")
        cmd.Parameters.AddWithValue("@foto", "")
        cmd.Parameters.AddWithValue("@estado", "")
        cmd.Parameters.AddWithValue("@id_biometrico", 0)
        cmd.Parameters.AddWithValue("@file", "")
        cmd.Parameters.AddWithValue("@r1", 0)
        cmd.Parameters.AddWithValue("@r2", 0)
        cmd.Parameters.AddWithValue("@r3", 0)
        cmd.Parameters.AddWithValue("@r4", 0)
        cmd.Parameters.AddWithValue("@f_registro_personal", "01/01/2000")
        cmd.Parameters.AddWithValue("@usuario_r_personal", "")
        cmd.Parameters.AddWithValue("@sw", 5)
        Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
        End Using
        persona_select.Add(dt.Rows(0).Item(0).ToString)
        persona_select.Add(dt.Rows(0).Item(1).ToString) 'carnet
        persona_select.Add(dt.Rows(0).Item(2).ToString) 'complemento
        persona_select.Add(dt.Rows(0).Item(3).ToString) ' ciudad
        persona_select.Add(dt.Rows(0).Item(4).ToString) 'nombres
        persona_select.Add(dt.Rows(0).Item(5).ToString) ' paterno
        persona_select.Add(dt.Rows(0).Item(6).ToString) ' materno
        persona_select.Add(dt.Rows(0).Item(7).ToString) ' sexo

        Dim iDate As String = dt.Rows(0).Item(8)
        Dim oDate As DateTime = DateTime.Parse(iDate)

        Dim nuevafecha As String = oDate.Day & "/" & oDate.Month & "/" & oDate.Year

        persona_select.Add(nuevafecha) 'f_nacimiento
        persona_select.Add(dt.Rows(0).Item(9).ToString) 'direccion
        persona_select.Add(dt.Rows(0).Item(10).ToString) 'telefono
        persona_select.Add(dt.Rows(0).Item(11).ToString) 'correo
        persona_select.Add(dt.Rows(0).Item(12).ToString) 'caja de seguro
        persona_select.Add(dt.Rows(0).Item(13).ToString) 'matricula seguro
        persona_select.Add(dt.Rows(0).Item(14).ToString) 'afp
        persona_select.Add(dt.Rows(0).Item(15).ToString) 'nua/cua
        persona_select.Add(dt.Rows(0).Item(23).ToString) 'cas
        persona_select.Add(dt.Rows(0).Item(25).ToString) 'nivel de estudio
        persona_select.Add(dt.Rows(0).Item(26).ToString) 'profecion
        persona_select.Add(dt.Rows(0).Item(27).ToString) 'matricula prodfecional
        Return persona_select
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

   
    <WebMethod(EnableSession:=True)> _
    Public Shared Function funcion_ingresar(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String, ByVal v7 As String, ByVal v8 As String, ByVal v9 As String, ByVal v10 As String, ByVal v11 As String, ByVal v12 As String, ByVal v13 As String, ByVal v14 As String, ByVal v15 As String, ByVal v16 As String, ByVal v17 As String, ByVal v18 As String, ByVal v19 As String, ByVal v20 As String, ByVal v21 As String, ByVal v22 As String, ByVal v23 As String, ByVal v24 As String, ByVal v25 As String, ByVal v26 As String, ByVal v27 As String, ByVal v28 As String, ByVal v29 As String, ByVal v30 As String, ByVal v31 As String, ByVal v32 As String, ByVal v33 As String, ByVal v34 As String, ByVal v35 As String, ByVal v36 As String, ByVal v37 As String, ByVal v38 As String, ByVal v39 As String) As String

        Dim msg As String = ""

        If Not IsDate(Date.ParseExact(v9, "dd/MM/yyyy", System.Globalization.DateTimeFormatInfo.InvariantInfo)) Then
            msg = msg + "- La fecha de nacimiento es incorrecta " + vbCr
        End If
        If Len(v24) > 0 Then
            If Not IsDate(v24) Then
                msg = msg + "- La fecha de C.A.S. es incorrecta " + vbCr
            End If
        End If

        If v1 = 0 Then
            Dim dt1 As New DataTable()
            Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                Using cmd1 As New SqlCommand("SELECT documento from personal where documento=" + v2, con)
                    con.Open()
                    Dim da As New SqlDataAdapter(cmd1)
                    da.Fill(dt1)
                    If dt1.Rows.Count > 0 Then
                        msg = msg + "- El C.I. " + v2 + " ya existe en la base de datos" + vbCr
                    End If
                End Using
            End Using

            Dim dt2 As New DataTable()
            Using con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                Using cmd2 As New SqlCommand("select documento from personal where nombre='" + v5 + "' AND ap_paterno='" + v6 + "' AND ap_materno='" + v7 + "'", con1)
                    con1.Open()
                    Dim da2 As New SqlDataAdapter(cmd2)
                    da2.Fill(dt2)
                    If dt2.Rows.Count > 0 Then
                        msg = msg + "- El nombre " + v5 + " " + v6 + " " + v7 + " ya existe en la base de datos" + vbCr
                    End If
                End Using
            End Using
        Else
            Dim dt1 As New DataTable()
            Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                Using cmd1 As New SqlCommand("SELECT idpersonal from personal where documento=" + v2, con)
                    con.Open()
                    Dim da As New SqlDataAdapter(cmd1)
                    da.Fill(dt1)
                    If dt1.Rows.Count > 0 Then
                        If dt1.Rows(0)("idpersonal") <> v1 Then
                            msg = msg + "- El C.I. " + v2 + " ya existe en la base de datos" + vbCr
                        End If
                    End If
                End Using
            End Using

            Dim dt2 As New DataTable()
            Using con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                Using cmd2 As New SqlCommand("select idpersonal from personal where nombre='" + v5 + "' AND ap_paterno='" + v6 + "' AND ap_materno='" + v7 + "'", con1)
                    con1.Open()
                    Dim da2 As New SqlDataAdapter(cmd2)
                    da2.Fill(dt2)
                    If dt2.Rows.Count > 0 Then
                        If dt2.Rows(0)("idpersonal") <> v1 Then
                            msg = msg + "- El nombre " + v5 + " " + v6 + " " + v7 + " ya existe en la base de datos" + vbCr
                        End If
                    End If
                End Using
            End Using
        End If
        If Len(msg) = 0 Then
            Dim dt As New DataTable()
            Dim conn As New SqlConnection()
            Dim cmd As New SqlCommand()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString
            cmd.Connection = conn
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "GET_PERSONAL"
            cmd.Parameters.AddWithValue("@idpersonal", v1)
            cmd.Parameters.AddWithValue("@documento", v2)
            cmd.Parameters.AddWithValue("@complemento", Trim(UCase(v3)))
            cmd.Parameters.AddWithValue("@expedido", v4)
            cmd.Parameters.AddWithValue("@nombre", Trim(UCase(v5)))
            cmd.Parameters.AddWithValue("@ap_paterno", Trim(UCase(v6)))
            cmd.Parameters.AddWithValue("@ap_materno", Trim(UCase(v7)))
            cmd.Parameters.AddWithValue("@sexo", v8)
            cmd.Parameters.AddWithValue("@f_nacimiento", v9)
            cmd.Parameters.AddWithValue("@direccion", Trim(UCase(v10)))
            cmd.Parameters.AddWithValue("@telefono", v11)
            cmd.Parameters.AddWithValue("@correo", v12)
            cmd.Parameters.AddWithValue("@c_seguro", v13)
            cmd.Parameters.AddWithValue("@m_seguro", Trim(UCase(v14)))
            cmd.Parameters.AddWithValue("@e_afiliado", v15)
            cmd.Parameters.AddWithValue("@c_afiliado", v16)
            cmd.Parameters.AddWithValue("@f_ing_sis_salud", v17)
            cmd.Parameters.AddWithValue("@d_contraloria", v18)
            cmd.Parameters.AddWithValue("@d_risaj", v19)
            cmd.Parameters.AddWithValue("@f_risaj", v20)
            cmd.Parameters.AddWithValue("@d_sipasse", v21)
            cmd.Parameters.AddWithValue("@f_sipasse", v22)
            cmd.Parameters.AddWithValue("@d_libreta", v23)
            cmd.Parameters.AddWithValue("@f_asig_vacacion", v24)
            cmd.Parameters.AddWithValue("@fuente_verif_vacacion", v25)
            cmd.Parameters.AddWithValue("@n_estudio", v26)
            cmd.Parameters.AddWithValue("@profesion", Trim(UCase(v27)))
            cmd.Parameters.AddWithValue("@mat_profesion", Trim(UCase(v28)))
            cmd.Parameters.AddWithValue("@mat_especialidad", Trim(UCase(v29)))
            cmd.Parameters.AddWithValue("@foto", v30)
            cmd.Parameters.AddWithValue("@estado", v31)
            cmd.Parameters.AddWithValue("@id_biometrico", v32)
            cmd.Parameters.AddWithValue("@file", v33)
            cmd.Parameters.AddWithValue("@r1", v34)
            cmd.Parameters.AddWithValue("@r2", v35)
            cmd.Parameters.AddWithValue("@r3", v36)
            cmd.Parameters.AddWithValue("@r4", v37)
            cmd.Parameters.AddWithValue("@f_registro_personal", v38)
            cmd.Parameters.AddWithValue("@usuario_r_personal", v39)
            If v1 = 0 Then
                cmd.Parameters.AddWithValue("@sw", 1)
            Else
                cmd.Parameters.AddWithValue("@sw", 2)
            End If
            Dim sda As SqlDataAdapter = New SqlDataAdapter(cmd)
            sda.Fill(dt)
            Return "OK"
        Else
            Return msg
        End If
    End Function



   
End Class
