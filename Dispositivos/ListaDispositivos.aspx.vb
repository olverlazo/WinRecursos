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


Partial Class Dispositivos_ListaDispositivos
    Inherits System.Web.UI.Page
    Public Shared tmarcacion As DataTable = New DataTable() 'DIM
    Public Shared IP, nombre, puerto As String 'DIM

    Dim tusuario As DataTable = New DataTable()
    Public Shared dispositivo1 As New zkemkeeper.CZKEM

    Dim idwErrorCode As Integer

    Dim strIDDispositivo As String
    Public Shared iddispositivo As Integer ' DIM
    Dim tmarcaciones As DataTable = New DataTable()
    Public Shared tmarcacion_nuevo As DataTable = New DataTable()
    Dim strIPBaseDatos, strPuertoDB, strUsuarioDB, strPasswordDB, strDataBase As String



    Private Sub Descargar_marcacion(ByVal strIDDispositivo As String)

        Dim strMarcacion As String = ""
        Dim capacidad As Integer = 0
        Dim contar As Integer = 0

        tmarcacion_nuevo.Clear()
        tmarcacion_nuevo = tmarcacion
        Try
            If tmarcacion_nuevo.Rows.Count > 0 Then
                Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                    connection.Open()
                    Using transaction As SqlTransaction = connection.BeginTransaction()
                        Using bulkCopy As SqlBulkCopy = New SqlBulkCopy(connection, SqlBulkCopyOptions.Default, transaction)
                            Try
                                bulkCopy.DestinationTableName = "dbo.marcacion"
                                bulkCopy.WriteToServer(tmarcacion_nuevo)
                                transaction.Commit()
                            Catch ex As Exception
                                transaction.Rollback()
                                connection.Close()
                                lblfecha1.Text = ex.Message
                                Throw
                            End Try
                            bulkCopy.Close()
                        End Using
                    End Using
                    connection.Close()
                End Using
                regdescarga.Text = tmarcacion_nuevo.Rows.Count

                Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                con.Open()
                Dim consulta1 As String = "INSERT marcaciones SELECT ci_personal,ENCRYPTBYPASSPHRASE(ci_personal+CONVERT(NVARCHAR, fecha,120)+CONVERT(NVARCHAR, fecha_dascargo,120)+CAST(id_dispositivo AS VARCHAR(10)),CONVERT(NVARCHAR, fecha,120)),fecha,fecha_dascargo ,id_dispositivo FROM marcacion where id_dispositivo='" + strIDDispositivo + "' and fecha > (select MAX(fecha_biomatrico) FROM marcaciones WHERE id_dispositivo='" + strIDDispositivo + "')"
                Dim cmd1 As New SqlCommand(consulta1, con)
                cmd1.ExecuteNonQuery()
                con.Close()
            Else
                lblfecha1.Text = "NO EXISTEN DATOS"
            End If
            dispositivo1.Disconnect()
            descargar.Enabled = False
            bnConectar.Enabled = False

        Catch ex As Exception
            lblfecha1.Text = ex.Message
            dispositivo1.Disconnect()
            descargar.Enabled = False
            bnConectar.Enabled = False
        End Try


    End Sub


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



    Public Sub filtrar_marcacion(ByVal strIDDispositivo As String)
        Dim dm As System.Data.DataTable = New System.Data.DataTable()

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        con.Open()
        Dim consulta As String = "SELECT MAX(fecha_biomatrico) as fecha FROM marcaciones WHERE id_dispositivo='" + strIDDispositivo + "'"
        Dim cmd As New SqlCommand(consulta, con)
        Using RDR = cmd.ExecuteReader()
            dm.Load(RDR)
        End Using
        con.Close()

        tmarcacion_nuevo = tmarcacion.[Select]("fecha>'" & Convert.ToDateTime(dm.Rows(0)(0)).ToString("yyyy-MM-dd HH:mm:ss") & "'").CopyToDataTable()
    End Sub




    Public Function obtener_marcacion(ByVal strIDDispo As String) As Integer
        Dim id As String
        Dim verif, inout, year, month, day, hour, min, sec As Integer, code As Integer = 1, s_marcacion As Integer = 0
        Dim strMarcacion As String = ""
        Dim dm As System.Data.DataTable = New System.Data.DataTable()
        Dim dm1 As System.Data.DataTable = New System.Data.DataTable()
        tmarcacion.Rows.Clear()
        dm.Clear()
        dm1.Clear()
        Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            connection.Open()
            Dim consulta As String = "SELECT CONVERT (date, SYSDATETIME())"
            Using cmd As New SqlCommand(consulta, connection)
                Using RDR = cmd.ExecuteReader()
                    dm.Load(RDR)
                End Using
            End Using
        End Using

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        con.Open()
        Dim consulta1 As String = "SELECT MAX(fecha_biomatrico) as fecha FROM marcaciones WHERE id_dispositivo='" + strIDDispo + "'"
        Dim cmd1 As New SqlCommand(consulta1, con)
        Using RDR1 = cmd1.ExecuteReader()
            dm1.Load(RDR1)
        End Using
        con.Close()


        'dispositivo1.Connect_Net(IP, Convert.ToInt32(puerto))
        dispositivo1.MachineNumber = Convert.ToInt32(strIDDispo)
        dispositivo1.ReadAllGLogData(dispositivo1.MachineNumber)


        'ScriptManager.RegisterClientScriptBlock(Me, GetType(String), "toast", "cargar()", True)

        Dim fecha_bio As DateTime
        While dispositivo1.SSR_GetGeneralLogData(dispositivo1.MachineNumber, id, verif, inout, year, month, day, hour, min, sec, code)
            Dim dr As DataRow = tmarcacion.NewRow()
            fecha_bio = New DateTime(year, month, day, hour, min, sec)
            If fecha_bio > Convert.ToDateTime(dm1.Rows(0)(0)).ToString("yyyy-MM-dd HH:mm:ss") Then
                dr("ci_personal") = id
                dr("fecha") = New DateTime(year, month, day, hour, min, sec)
                dr("fecha_descargo") = CDate(dm.Rows(0)(0)).ToString("yyyy-MM-dd")
                dr("id_dispositivo") = dispositivo1.MachineNumber
                tmarcacion.Rows.Add(dr)
            End If
            s_marcacion += 1
        End While

        ''filtrar_marcacion(dispositivo1.MachineNumber)
        Descargar_marcacion(dispositivo1.MachineNumber)

        'ScriptManager.RegisterClientScriptBlock(Me, GetType(String), "toast", "fgp_loader.remove();", True)
        Return s_marcacion
    End Function


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'tmarcacion.Columns.Add("ci_personal", GetType(String))
        'tmarcacion.Columns.Add("fecha", GetType(DateTime))
        'tmarcacion.Columns.Add("fecha_descargo", GetType(Date))
        'tmarcacion.Columns.Add("id_dispositivo", GetType(Integer))



        If Not IsPostBack Then
            If Session("idusuario").ToString = "" Then
                Response.Redirect("~/Default.aspx")
            End If
            tmarcacion.Reset()
            'tmarcacion.Columns.Add("id", GetType(String))
            'tmarcacion.Columns.Add("nombre", GetType(String))
            'tmarcacion.Columns.Add("password", GetType(String))
            'tmarcacion.Columns.Add("privilegio", GetType(Integer))
            'tmarcacion.Columns.Add("statu", GetType(Boolean))


            tmarcacion.Columns.Add("ci_personal", GetType(String))
            tmarcacion.Columns.Add("fecha", GetType(DateTime))
            tmarcacion.Columns.Add("fecha_descargo", GetType(Date))
            tmarcacion.Columns.Add("id_dispositivo", GetType(Integer))

        End If

    End Sub


    Private Sub bnConectar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles bnConectar.Click
        ScriptManager.RegisterClientScriptBlock(Me, GetType(String), "toast", "mensaje()", True)
        Dim datos_dispo As DataTable

        iddispositivo = Request.Form("dispositivo")
        datos_dispo = lista.[Select]("id_dispositivo='" & iddispositivo & "'").CopyToDataTable()

        nombre = datos_dispo.Rows(0)(1)
        IP = datos_dispo.Rows(0)(2)
        puerto = datos_dispo.Rows(0)(3)
        Label1.Text = nombre

        Try
            If dispositivo1.Connect_Net(IP, Convert.ToInt32(puerto)) Then
                Dim serial, codigo As String, mac As String = ""
                dispositivo1.GetSerialNumber(dispositivo1.MachineNumber, serial)
                dispositivo1.GetProductCode(dispositivo1.MachineNumber, codigo)
                dispositivo1.GetDeviceMAC(dispositivo1.MachineNumber, mac)
                modelo.Text = codigo
                ns.Text = serial
                dmac.Text = mac
                descargar.Enabled = True
                bnConectar.Enabled = False
                bnDesconectar.Enabled = True
                ndisp.Text = iddispositivo
                Label2.Text = "Dispositivo Conectado"
                Label2.ForeColor = Color.White
                Label2.BackColor = Color.Green
                'dispositivo1.Disconnect()
                'totalmar.Text = obtener_marcacion(ndisp.Text)
            Else
                Dim idwErrorCode As Integer = 0
                dispositivo1.GetLastError(idwErrorCode)
                lblfecha1.Text = idwErrorCode.ToString()
                Return
            End If

        Catch ex As Exception
            'MessageBox.Show(ex.Message)
            Label1.Text = ex.Message
        End Try
    End Sub



    Protected Sub descargar_Click(sender As Object, e As EventArgs) Handles descargar.Click
        Try
            totalmar.Text = obtener_marcacion(ndisp.Text)
        Catch ex As Exception
            Label1.Text = ex.Message
        End Try


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

    Protected Sub bnDesconectar_Click(sender As Object, e As EventArgs) Handles bnDesconectar.Click
        bnConectar.Enabled = True
        descargar.Enabled = False
        bnDesconectar.Enabled = False

        ndisp.Text = ""
        Label1.Text = ""
        modelo.Text = ""
        ns.Text = ""
        dmac.Text = ""
        totalmar.Text = ""
        regdescarga.Text = ""

        Label2.Text = "Dispositivo Desconectado"
        Label2.ForeColor = Color.White
        Label2.BackColor = Color.Red
    End Sub

    Protected Sub bnConectar_Load(sender As Object, e As EventArgs) Handles bnConectar.Load
        Label2.Text = "Dispositivo Desconectado"
        Label2.ForeColor = Color.White
        Label2.BackColor = Color.Red
    End Sub




    ''TODO CON JAVA

    <WebMethod(EnableSession:=True)> _
    Public Shared Function muestra(ByVal v1 As String) As Object
        Dim datos_dispo As DataTable
        Dim lista_muestra As List(Of String) = New List(Of String)()


        iddispositivo = v1
        datos_dispo = lista.[Select]("id_dispositivo='" & iddispositivo & "'").CopyToDataTable()

        nombre = datos_dispo.Rows(0)(1)
        IP = datos_dispo.Rows(0)(2)
        puerto = datos_dispo.Rows(0)(3)
        'Label1.Text = nombre


        If PING(IP) Then
            Try
                If dispositivo1.Connect_Net(IP, Convert.ToInt32(puerto)) Then
                    Dim serial, codigo As String, mac As String = ""
                    dispositivo1.GetSerialNumber(dispositivo1.MachineNumber, serial)
                    dispositivo1.GetProductCode(dispositivo1.MachineNumber, codigo)
                    dispositivo1.GetDeviceMAC(dispositivo1.MachineNumber, mac)

                    lista_muestra.Add(nombre)
                    lista_muestra.Add(codigo)
                    lista_muestra.Add(serial)
                    lista_muestra.Add(mac)
                    lista_muestra.Add("1")
                    lista_muestra.Add("0")
                    lista_muestra.Add("1")
                    lista_muestra.Add(iddispositivo)
                    lista_muestra.Add("Dispositivo Conectado")
                    lista_muestra.Add("Color.White")
                    lista_muestra.Add("Color.White")
                Else
                    Dim idwErrorCode As Integer = 0
                    dispositivo1.GetLastError(idwErrorCode)
                    lista_muestra.Add(idwErrorCode.ToString())
                    Return lista_muestra
                End If
            Catch ex As Exception
                lista_muestra.Add(ex.Message)
            End Try
        Else
            lista_muestra.Add("false")
        End If
        Return lista_muestra

    End Function


    <WebMethod(EnableSession:=True)> _
    Public Shared Function dascarga(ByVal strIDDispo As String) As Object
        Dim lista_datos As List(Of String) = New List(Of String)()

        Dim id As String
        Dim verif, inout, year, month, day, hour, min, sec As Integer, code As Integer = 1, s_marcacion As Integer = 0
        Dim strMarcacion As String = ""
        Dim dm As System.Data.DataTable = New System.Data.DataTable()
        Dim dm1 As System.Data.DataTable = New System.Data.DataTable()
        tmarcacion.Rows.Clear()
        Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            connection.Open()
            Dim consulta As String = "SELECT CONVERT (date, SYSDATETIME())"
            Using cmd As New SqlCommand(consulta, connection)
                Using RDR = cmd.ExecuteReader()
                    dm.Load(RDR)
                End Using
            End Using
        End Using

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        con.Open()
        Dim consulta1 As String = "SELECT MAX(fecha_biomatrico) as fecha FROM marcaciones WHERE id_dispositivo='" + strIDDispo + "'"
        Dim cmd1 As New SqlCommand(consulta1, con)
        Using RDR1 = cmd1.ExecuteReader()
            dm1.Load(RDR1)
        End Using
        con.Close()

        'dispositivo1.Disconnect()
        'If dispositivo1.Connect_Net(IP, Convert.ToInt32(puerto)) Then
        dispositivo1.MachineNumber = Convert.ToInt32(strIDDispo)
        dispositivo1.ReadAllGLogData(dispositivo1.MachineNumber)

        Dim fecha_bio As DateTime
        While dispositivo1.SSR_GetGeneralLogData(dispositivo1.MachineNumber, id, verif, inout, year, month, day, hour, min, sec, code)
            Dim dr As DataRow = tmarcacion.NewRow()
            fecha_bio = New DateTime(year, month, day, hour, min, sec)
            If fecha_bio > Convert.ToDateTime(dm1.Rows(0)(0)).ToString("yyyy-MM-dd HH:mm:ss") Then
                dr("ci_personal") = id
                dr("fecha") = New DateTime(year, month, day, hour, min, sec)
                dr("fecha_descargo") = CDate(dm.Rows(0)(0)).ToString("yyyy-MM-dd")
                dr("id_dispositivo") = dispositivo1.MachineNumber
                tmarcacion.Rows.Add(dr)
            End If
            s_marcacion += 1
        End While
        lista_datos.Add(s_marcacion)


        'End If
        ''DESCARGAR MARCACIONES
        strMarcacion = ""
        Dim capacidad As Integer = 0
        Dim contar As Integer = 0


        tmarcacion_nuevo = tmarcacion
        Try
            If tmarcacion_nuevo.Rows.Count > 0 Then
                Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                    connection.Open()
                    Using transaction As SqlTransaction = connection.BeginTransaction()
                        Using bulkCopy As SqlBulkCopy = New SqlBulkCopy(connection, SqlBulkCopyOptions.Default, transaction)
                            Try
                                bulkCopy.DestinationTableName = "dbo.marcacion"
                                bulkCopy.WriteToServer(tmarcacion_nuevo)
                                transaction.Commit()
                            Catch ex As Exception
                                transaction.Rollback()
                                connection.Close()
                                'lblfecha1.Text = ex.Message
                                Throw
                            End Try
                        End Using
                    End Using
                End Using
                lista_datos.Add(tmarcacion_nuevo.Rows.Count)

                'Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                con.Open()
                Dim consulta11 As String = "INSERT marcaciones SELECT ci_personal,ENCRYPTBYPASSPHRASE(ci_personal+CONVERT(NVARCHAR, fecha,120)+CONVERT(NVARCHAR, fecha_dascargo,120)+CAST(id_dispositivo AS VARCHAR(10)),CONVERT(NVARCHAR, fecha,120)),fecha,fecha_dascargo ,id_dispositivo FROM marcacion where id_dispositivo='" + strIDDispo + "' and fecha > (select MAX(fecha_biomatrico) FROM marcaciones WHERE id_dispositivo='" + strIDDispo + "')"
                Dim cmd11 As New SqlCommand(consulta11, con)
                cmd11.ExecuteNonQuery()
                con.Close()
            Else
                lista_datos.Add("NO EXISTEN DATOS")
            End If
            dispositivo1.Disconnect()
        Catch ex As Exception
            lista_datos.Add(ex.Message)
            dispositivo1.Disconnect()
            lista_datos.Clear()
            lista_datos.Add("error")
            Return lista_datos
        End Try



        Return lista_datos
    End Function



End Class
