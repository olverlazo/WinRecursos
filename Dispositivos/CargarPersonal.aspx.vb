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
Imports zkemkeeper



Imports System.Net.NetworkInformation
Imports System.Text

Partial Class Dispositivos_CargarPersonal
    Inherits System.Web.UI.Page

    Public Shared tmarcacion As DataTable = New DataTable()
    Public Shared IP, nombre, puerto As String

    Dim tusuario As DataTable = New DataTable()
    Public Shared dispositivo1 As New zkemkeeper.CZKEM

    Dim idwErrorCode As Integer

    Dim strIDDispositivo As String
    Public Shared iddispositivo As Integer
    Dim tmarcaciones As DataTable = New DataTable()
    Dim lista_persona As DataSet = New DataSet
    Dim tmarcacion_nuevo As DataTable = New DataTable()
    Dim strIPBaseDatos, strPuertoDB, strUsuarioDB, strPasswordDB, strDataBase As String




    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        tmarcacion.Reset()
        tmarcacion.Columns.Add("id", GetType(String))
        tmarcacion.Columns.Add("nombre", GetType(String))
        tmarcacion.Columns.Add("password", GetType(String))
        tmarcacion.Columns.Add("privilegio", GetType(Integer))
        tmarcacion.Columns.Add("statu", GetType(Boolean))

        If Not IsPostBack Then
            If Session("idusuario").ToString = "" Then
                Response.Redirect("~/Default.aspx")
            End If
        End If


    End Sub


    Public Shared lista As DataTable = New DataTable()
    Public Class datos
        Public Sub New(ByVal id_dispositivo As String, ByVal nombre As String)
            Me.id_dispositivo = id_dispositivo
            Me.nombre = nombre
        End Sub
        Public Property id_dispositivo As String
        Public Property nombre As String
    End Class

    <WebMethod(EnableSession:=True)> _
    Public Shared Function Lista_Dispositivo(ByVal v1 As String) As List(Of datos)
        lista.Reset()

        lista.Columns.Add("id_dispositivo", GetType(Integer))
        lista.Columns.Add("nombre", GetType(String))
        lista.Columns.Add("ip", GetType(String))
        lista.Columns.Add("puerto", GetType(String))
        lista.Columns.Add("numero", GetType(Integer))
        lista.Columns.Add("activo", GetType(String))

        Dim dispo As List(Of datos) = New List(Of datos)()
        dispo.Clear()

        Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            connection.Open()
            Dim consulta As String = "select * from dispositivos order by nombre "
            Using cmd As New SqlCommand(consulta, connection)
                Using RDR = cmd.ExecuteReader()
                    lista.Load(RDR)
                End Using
            End Using
        End Using

        For i As Integer = 0 To lista.Rows.Count - 1
            dispo.Add(New datos(lista.Rows(i)(0), lista.Rows(i)(1)))
        Next
        Return dispo
    End Function




    Public Function obtener_lista(ByVal strIDDispo As String) As Integer
        Dim id, nombre, password, idd As String
        Dim privilegio As Integer, code As Integer = 1, s_marcacion As Integer = 0
        Dim statu As Boolean


        Dim strMarcacion As String = ""
        Dim dm As System.Data.DataTable = New System.Data.DataTable()
        Dim dm1 As System.Data.DataTable = New System.Data.DataTable()
        tmarcacion.Rows.Clear()
        'Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        '    connection.Open()
        '    Dim consulta As String = "SELECT CONVERT (date, SYSDATETIME())"
        '    Using cmd As New SqlCommand(consulta, connection)
        '        Using RDR = cmd.ExecuteReader()
        '            dm.Load(RDR)
        '        End Using
        '    End Using
        'End Using

        'Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        'con.Open()
        'Dim consulta1 As String = "SELECT MAX(fecha_biomatrico) as fecha FROM marcaciones WHERE id_dispositivo='" + strIDDispo + "'"
        'Dim cmd1 As New SqlCommand(consulta1, con)
        'Using RDR1 = cmd1.ExecuteReader()
        '    dm1.Load(RDR1)
        'End Using
        'con.Close()


        'dispositivo1.Connect_Net(IP, Convert.ToInt32(puerto))
        dispositivo1.MachineNumber = Convert.ToInt32(strIDDispo)

        dispositivo1.ReadAllUserID(dispositivo1.MachineNumber)
        'dispositivo1.ReadAllGLogData(dispositivo1.MachineNumber)


        While dispositivo1.SSR_GetAllUserInfo(dispositivo1.MachineNumber, id, nombre, password, privilegio, statu)
            Dim dr As DataRow = tmarcacion.NewRow()
            dr("ci") = id
            dr("nombre") = nombre
            dr("password") = password
            dr("privilegio") = privilegio
            dr("statu") = statu
            tmarcacion.Rows.Add(dr)
            tmarcacion.AcceptChanges()
        End While

        lista_persona.Tables.Add(tmarcacion)
        GridView1.DataSource = tmarcacion
        Me.GridView1.DataBind()


        ''filtrar_marcacion(dispositivo1.MachineNumber)
        'Descargar_marcacion(dispositivo1.MachineNumber)
        Return s_marcacion
    End Function




    Protected Sub bnConectar_Click(sender As Object, e As EventArgs) Handles bnConectar.Click

        Dim datos_dispo As DataTable

        iddispositivo = Request.Form("dispositivo")
        datos_dispo = lista.[Select]("id_dispositivo='" & iddispositivo & "'").CopyToDataTable()
        nombre = datos_dispo.Rows(0)(1)
        IP = datos_dispo.Rows(0)(2)
        puerto = datos_dispo.Rows(0)(3)

        Try
            If dispositivo1.Connect_Net(IP, Convert.ToInt32(puerto)) Then
                Dim mac As String = ""
                'descargar.Enabled = True
                bnConectar.Enabled = False
                bnDesconectar.Enabled = True

                Label2.Text = "Dispositivo Conectado"
                Label1.Text = nombre
                Label2.ForeColor = Color.White
                Label2.BackColor = Color.Green
                obtener_lista(iddispositivo)
                'dispositivo1.Disconnect()
                'totalmar.Text = obtener_marcacion(ndisp.Text)
            Else
                Dim idwErrorCode As Integer = 0
                dispositivo1.GetLastError(idwErrorCode)
                'lblfecha1.Text = idwErrorCode.ToString()
                Return
            End If

        Catch ex As Exception
            Label1.Text = ex.Message
        End Try
    End Sub

    Protected Sub bnDesconectar_Click(sender As Object, e As EventArgs) Handles bnDesconectar.Click
        bnConectar.Enabled = True
        bnDesconectar.Enabled = False

        Label2.Text = "Dispositivo Desconectado"
        Label2.ForeColor = Color.White
        Label2.BackColor = Color.Red

        Label1.Text = ""
        dispositivo1.Disconnect()
    End Sub



    'MUESTRA LA LISTA DE PERSONAL
    Public Class persona_in_biometrico
        Public Sub New(ByVal id As String, ByVal nombre As String, ByVal password As String, ByVal privilegio As String, ByVal statu As String)
            Me.id = ID
            Me.nombre = nombre
            Me.password = password
            Me.privilegio = privilegio
            Me.statu = statu
        End Sub

        Public Property id As String
        Public Property nombre As String
        Public Property password As String
        Public Property privilegio As String
        Public Property statu As String
    End Class


    <WebMethod(EnableSession:=True)> _
    Public Shared Function VerDatos(ByVal v1 As String) As Object

        Dim lista_entrega As List(Of String) = New List(Of String)()
        lista_entrega.Clear()
        Dim datos_dispo As DataTable
        iddispositivo = v1
        datos_dispo = lista.[Select]("id_dispositivo='" & v1 & "'").CopyToDataTable()
        lista_entrega.Add(datos_dispo.Rows(0)(0))
        lista_entrega.Add(datos_dispo.Rows(0)(1))
        lista_entrega.Add(datos_dispo.Rows(0)(2))
        lista_entrega.Add(datos_dispo.Rows(0)(3))
        Return lista_entrega
    End Function

    Public Shared lista_bio As DataTable = New DataTable()
    <WebMethod(EnableSession:=True)> _
    Public Shared Function Lista_Personal(ByVal v1 As String) As Object
        Dim persona_select As List(Of persona_in_biometrico) = New List(Of persona_in_biometrico)()
        persona_select.Clear()
        lista_bio.Reset()

        Dim id, nombre, password As String
        Dim privilegio As Integer
        Dim statu As Boolean
        Dim datos_dispo As DataTable

        iddispositivo = v1
        datos_dispo = lista.[Select]("id_dispositivo='" & iddispositivo & "'").CopyToDataTable()
        nombre = datos_dispo.Rows(0)(1)
        IP = datos_dispo.Rows(0)(2)
        puerto = datos_dispo.Rows(0)(3)
        dispositivo1.MachineNumber = Convert.ToInt32(iddispositivo)

        If PING(IP) Then
            Try
                If dispositivo1.Connect_Net(IP, Convert.ToInt32(puerto)) Then
                    dispositivo1.ReadAllUserID(dispositivo1.MachineNumber)
                    lista_bio.Columns.Add("ci", GetType(Integer))
                    lista_bio.Columns.Add("nombre", GetType(String))
                    While dispositivo1.SSR_GetAllUserInfo(dispositivo1.MachineNumber, id, nombre, password, privilegio, statu)
                        Dim dr1 As DataRow = lista_bio.NewRow()
                        persona_select.Add(New persona_in_biometrico(id, nombre, password, privilegio, statu))                    '
                    End While
                Else
                    Dim idwErrorCode As Integer = 0
                    dispositivo1.GetLastError(idwErrorCode)
                End If

            Catch ex As Exception
                persona_select.Add(New persona_in_biometrico(ex.Message, "false1", "false1", "false1", "false1"))
            End Try
        Else
            persona_select.Add(New persona_in_biometrico("false", "false", "false", "false", "false"))
        End If



        Dim json As Object = New With {Key .data = persona_select}
        Return json
    End Function

    ''FUNCION PARA PING
    Public Shared Function PING(ipAdd As String) As Boolean
        Try
            Dim ipAddress As IPAddress = ipAddress.Parse(ipAdd)

            Dim pingSender As New Ping()
            Dim options As New PingOptions()
            options.DontFragment = True

            ' Create a buffer of 32 bytes of data to be transmitted. 
            Dim data As String = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
            Dim buffer As Byte() = Encoding.ASCII.GetBytes(data)
            Dim timeout As Integer = 120
            Dim reply As PingReply = pingSender.Send(ipAddress, timeout, buffer, options)

            If reply.Status = IPStatus.Success Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False
        End Try
    End Function


    'MUESTRA LA LISTA DE PERSONAL
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

    'AGREGAR PERSONAL AL BIOMETRICO
    <WebMethod(EnableSession:=True)> _
    Public Shared Function DatosPersona(ByVal v1 As String, v2 As String) As String
        dispositivo1.EnableDevice(dispositivo1.MachineNumber, False)
        If (dispositivo1.SSR_SetUserInfo(dispositivo1.MachineNumber, v1, v2, "", 0, True)) Then
            dispositivo1.EnableDevice(dispositivo1.MachineNumber, True)
            Return "OK"
        Else
            dispositivo1.EnableDevice(dispositivo1.MachineNumber, True)
            Return "False"
        End If

    End Function


    'AGREGAR PERSONAL AL BIOMETRICO
    <WebMethod(EnableSession:=True)> _
    Public Shared Function borrahuella(ByVal v1 As String) As String
        If (dispositivo1.SSR_DeleteEnrollDataExt(dispositivo1.MachineNumber, v1, 13)) Then
            Return "OK"
        Else
            Return "False"
        End If
    End Function


    'AGREGAR PERSONAL AL BIOMETRICO
    <WebMethod(EnableSession:=True)> _
    Public Shared Function borrapersona(ByVal v1 As String) As String
        If (dispositivo1.SSR_DeleteEnrollDataExt(dispositivo1.MachineNumber, v1, 12)) Then
            Return "OK"
        Else
            Return "False"
        End If
    End Function
End Class
