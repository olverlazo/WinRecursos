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

' Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class WebService
    Inherits System.Web.Services.WebService

    <WebMethod(EnableSession:=True)> _
    Public Function loginAcceso(ByVal v1 As String, ByVal v2 As String) As List(Of String)
        Dim dt As New DataTable()
        Dim dtfecha As New DataTable()
        'Dim i As Integer
        Dim persona_select As List(Of String) = New List(Of String)()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim cmd As New SqlCommand("select a.idpersonal,a.documento,a.nombre,a.ap_paterno,a.ap_materno,b.usuario,b.password from personal a, usuarios b where a.idpersonal=b.id_personal and b.estado='true' and b.usuario ='" + v1 + "' and b.password='" + v2 + "'", con)
        Dim cmdfecha As New SqlCommand("Select CONVERT(varchar,GETDATE(),103) as [DD/MM/YYYY]", con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        Dim dafecha As New SqlDataAdapter(cmdfecha)
        da.Fill(dt)
        dafecha.Fill(dtfecha)
        If dt.Rows.Count > 0 Then
            Session("idusuario") = dt.Rows(0).Item(0).ToString
            persona_select.Add(dt.Rows(0).Item(0).ToString) 'idpersonal
            persona_select.Add(dt.Rows(0).Item(1).ToString) 'documento
            persona_select.Add(dt.Rows(0).Item(2).ToString) 'nombre
            persona_select.Add(dt.Rows(0).Item(3).ToString) 'paterno
            persona_select.Add(dt.Rows(0).Item(4).ToString) 'materno
            persona_select.Add(dt.Rows(0).Item(5).ToString) 'usuario
            persona_select.Add(dt.Rows(0).Item(6).ToString) 'password
            Session("datos") = persona_select
            con.Close()
            login1(Session("idusuario"))

            Return persona_select
        Else
            persona_select.Add("error")
            Session("datos") = persona_select
            Return persona_select
        End If
    End Function



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




    <WebMethod(EnableSession:=True)> _
    Public Function login1(ByVal v1 As String) As List(Of String)
        Dim dt As New DataTable()
        Dim dtfecha As New DataTable()
        Dim persona_select As List(Of String) = New List(Of String)()
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim cmd As New SqlCommand("select * from usuarios where id_personal='" + v1 + "'", con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            Session("idusuario") = dt.Rows(0).Item(0).ToString
            persona_select.Add(dt.Rows(0).Item(5).ToString) 'idpersonal
            persona_select.Add(dt.Rows(0).Item(6).ToString) 'documento
            persona_select.Add(dt.Rows(0).Item(7).ToString) 'nombre
            persona_select.Add(dt.Rows(0).Item(8).ToString) 'paterno
            persona_select.Add(dt.Rows(0).Item(9).ToString) 'materno
            persona_select.Add(dt.Rows(0).Item(10).ToString) 'usuario
            persona_select.Add(dt.Rows(0).Item(11).ToString) 'password
            persona_select.Add(dt.Rows(0).Item(12).ToString) 'password
            persona_select.Add(dt.Rows(0).Item(13).ToString) 'password
            persona_select.Add(dt.Rows(0).Item(14).ToString) 'idpersonal
            persona_select.Add(dt.Rows(0).Item(15).ToString) 'documento
            persona_select.Add(dt.Rows(0).Item(16).ToString) 'nombre
            persona_select.Add(dt.Rows(0).Item(17).ToString) 'paterno
            persona_select.Add(dt.Rows(0).Item(18).ToString) 'materno
            persona_select.Add(dt.Rows(0).Item(19).ToString) 'usuario
            persona_select.Add(dt.Rows(0).Item(20).ToString) 'password
            persona_select.Add(dt.Rows(0).Item(21).ToString) 'password
            persona_select.Add(dt.Rows(0).Item(22).ToString) 'password
            
            Session("listaAcceso") = persona_select
            con.Close()
            Return persona_select
        Else
            persona_select.Add("error")
            Session("listaAcceso") = persona_select
            Return persona_select
        End If
    End Function


    <WebMethod(EnableSession:=True)> _
    Public Function login(ByVal v1 As String, ByVal v2 As String) As String
        Dim obj As New DS_P_UsuarioTableAdapters.GET_USUARIOTableAdapter
        Dim contar As Integer
        contar = obj.GetData(0, 0, v1, v2, True, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "", "", CDate("01/01/2000"), CDate("01/01/2000"), CDate("01/01/2000"), CDate("01/01/2000"), 4).Rows.Count
        If contar = 0 Then
            Return ("Usuario o contraseña incorrectos")
        Else
            Dim datosusuario As System.Data.DataRow
            Dim datopersonal As System.Data.DataRow
            datosusuario = obj.GetData(0, 0, v1, v2, True, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "", "", CDate("01/01/2000"), CDate("01/01/2000"), CDate("01/01/2000"), CDate("01/01/2000"), 4).Rows(0)
            If datosusuario(4) = True Then
                Dim obj_personal As New DS_PersonalTableAdapters.personalTableAdapter
                datopersonal = obj_personal.GetDataBy(CInt(datosusuario(1).ToString)).Rows(0)
                Session("idusuario") = datosusuario(0)
                Session("reg_lic") = datosusuario(5)
                Session("reg_per") = datosusuario(6)
                Session("reg_mem") = datosusuario(7)
                Session("reg_baj") = datosusuario(8)
                Session("reg_vac") = datosusuario(9)
                Session("usuario") = UCase(datopersonal(4) + " " + datopersonal(5) + " " + datopersonal(6))
                Session("clave") = datosusuario(2)
                Session("pasword") = datosusuario(3)
                Session("centrogestion") = datosusuario(24)
                Return ("OK")
            Else
                Return ("El usuario no esta vigente")
            End If
        End If
    End Function

    Public Class persona
        Public Property nombres() As String
            Get
                Return m_nombres
            End Get
            Set(value As String)
                m_nombres = value
            End Set
        End Property
        Private m_nombres As String

        Public Property ci() As String
            Get
                Return m_ci
            End Get
            Set(value As String)
                m_ci = value
            End Set
        End Property
        Private m_ci As String

        Public Property f_nacimiento() As String
            Get
                Return m_f_nacimiento
            End Get
            Set(value As String)
                m_f_nacimiento = value
            End Set
        End Property
        Private m_f_nacimiento As String

        Public Property direccion() As String
            Get
                Return m_direccion
            End Get
            Set(value As String)
                m_direccion = value
            End Set
        End Property
        Private m_direccion As String

        Public Property telefono() As String
            Get
                Return m_telefono
            End Get
            Set(value As String)
                m_telefono = value
            End Set
        End Property
        Private m_telefono As String

        Public Property profesion() As String
            Get
                Return m_profesion
            End Get
            Set(value As String)
                m_profesion = value
            End Set
        End Property
        Private m_profesion As String
    End Class
    'BUSCAR  PACIENTE
    <WebMethod(EnableSession:=True)> _
    Public Shared Function CargarLista() As Integer
        Dim dt As New DataTable()
        Dim objPersona As New List(Of persona)()
        Dim i As Integer = 1
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            Using cmd As New SqlCommand("select nombre + ' ' + ap_paterno + ' ' + ap_materno as nombres,  CAST(LTRIM(STR([documento] ,50)) AS NVARCHAR(50))+' '+ ISNULL(cast([complemento] as nvarchar(50)),'') +' '+ expedido as ci,CONVERT (char(10),f_nacimiento,103) as f_nacimiento,direccion,telefono,profesion  from dbo.personal", con)
                con.Open()
                Dim da As New SqlDataAdapter(cmd)
                da.Fill(dt)
                If dt.Rows.Count > 0 Then
                    For i = 0 To dt.Rows.Count - 1
                        'objPersona.Add(New persona() With { _
                        '    .nombres = dt.Rows(i)("nombres").ToString, _
                        '    .ci = dt.Rows(i)("ci").ToString(), _
                        '    .f_nacimiento = dt.Rows(i)("f_nacimiento").ToString(), _
                        '    .direccion = dt.Rows(i)("direccion").ToString(), _
                        '    .telefono = dt.Rows(i)("telefono").ToString(), _
                        '    .profesion = dt.Rows(i)("profesion").ToString() _
                        '})
                    Next
                End If
            End Using
        End Using
        'Dim json As Object = New With {Key .data = objPersona}
        'Return json
        Return i


    End Function


    Public Function BuscaContrato(ByVal carnet As String) As String
        Dim dt As New DataTable()
        Dim i As Integer = 1
        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
        Dim cmd As New SqlCommand("select MAX(id_contrato) from contratos where id_personal =(select idpersonal from personal where documento =" + carnet + ")", con)
        con.Open()
        Dim da As New SqlDataAdapter(cmd)
        da.Fill(dt)
        If dt.Rows.Count > 0 Then
            Return dt.Rows(0)(0).ToString
        End If
        con.Close()
    End Function

    Public Function GuardarArchivoContrato(ByVal file As HttpPostedFile, ByVal nombre As String, ByVal tipo As String, ByVal formato As String) As String
        Dim rutatotal As String = "~/temp/" + nombre
        Dim ruta As String = Server.MapPath(rutatotal)
        'If Not Directory.Exists(ruta) Then Directory.CreateDirectory(ruta)
        Dim archivo As String = String.Format("{0}\{1}", ruta, nombre + tipo + formato)
        'Label2.Text = rutatotal
        file.SaveAs(archivo)
        Return "OK"
    End Function

    'GUARDA LA IMAGEN
    <WebMethod(EnableSession:=True)> _
    Public Sub GuardarArchivo()


        'Dim nom As String = BuscaContrato(Session("carnet").ToString) + Session("carnet").ToString
        Dim nom As String = Session("datos")(1) + "cont1"


        Dim Contexto As HttpContext = HttpContext.Current
        Dim ColeccionArchivos As HttpFileCollection = Context.Request.Files
        Dim NombreArchivo As String = ""
        Dim ArchivoActual As Integer
        Dim sizearchivo As Integer
        For ArchivoActual = 0 To ColeccionArchivos.Count - 1 Step ArchivoActual + 1
            'NombreArchivo = ColeccionArchivos(ArchivoActual).FileName
            NombreArchivo = nom + ".pdf"
            sizearchivo = ColeccionArchivos(ArchivoActual).ContentLength
            If sizearchivo <= 500000 Then
                Dim DatosArchivo As String = System.IO.Path.GetFileName(ColeccionArchivos(ArchivoActual).FileName)
                'Dim CarpetaParaGuardar As String = Server.MapPath("temp") + "\\" + "4042122.jpg"
                Dim CarpetaParaGuardar As String = Server.MapPath("temp") + "\\" + NombreArchivo
                ColeccionArchivos(ArchivoActual).SaveAs(CarpetaParaGuardar)
                Contexto.Response.ContentType = "application/json"
                'Contexto.Response.Write("{\n'success\n':true,\n'msg\n':\n'" + NombreArchivo + "\n'}")
                'Dim json As String = New JavaScriptSerializer().Serialize(New With {
                '.name = NombreArchivo
                '})
                Contexto.Response.Write(NombreArchivo)
                Contexto.Response.End()
            Else
                Contexto.Response.ContentType = "application/json"
                Contexto.Response.Write(NombreArchivo)
                Contexto.Response.End()
            End If
        Next
    End Sub




    <WebMethod(EnableSession:=True)> _
    Public Sub GuardarArchivoPRUEBA()

        Dim Contexto As HttpContext = HttpContext.Current
        Dim ColeccionArchivos As HttpFileCollection = Context.Request.Files
        Dim ci As String = HttpContext.Current.Request.Form("dato")



        Dim rutatotal1 As String = "temp/" + ci
        Dim ruta1 As String = Server.MapPath(rutatotal1)
        If Not Directory.Exists(ruta1) Then Directory.CreateDirectory(ruta1)


        Dim tipos As String
        Dim dt2 As New DataTable()
        Using con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            Using cmd2 As New SqlCommand("select id_contrato from contratos where estado='ACTIVO' AND id_personal=(select idpersonal from personal where documento ='" + ci + "')", con1)
                con1.Open()
                Dim da2 As New SqlDataAdapter(cmd2)
                da2.Fill(dt2)
                If dt2.Rows.Count > 0 Then
                    tipos = dt2.Rows(0)("id_contrato").ToString()
                End If
                con1.Close()
            End Using
        End Using


        'Dim nom As String = BuscaContrato(Session("carnet").ToString) + Session("carnet").ToString
        Dim nom As String = Session("datos")(0) + "cont1"





        Dim NombreArchivo As String = ""
        Dim ArchivoActual As Integer
        Dim sizearchivo As Integer


        NombreArchivo = tipos + ci + "cont.pdf"
        For ArchivoActual = 0 To ColeccionArchivos.Count - 1 Step ArchivoActual + 1
            'NombreArchivo = ColeccionArchivos(ArchivoActual).FileName
            'NombreArchivo = nom + ".pdf"

            sizearchivo = ColeccionArchivos(ArchivoActual).ContentLength
            If sizearchivo <= 1000000 Then
                Dim DatosArchivo As String = System.IO.Path.GetFileName(ColeccionArchivos(ArchivoActual).FileName)
                'Dim CarpetaParaGuardar As String = Server.MapPath("temp") + "\\" + "4042122.jpg"
                'Dim CarpetaParaGuardar As String = Server.MapPath("temp") + "\\" + NombreArchivo

                Dim CarpetaParaGuardar As String = Server.MapPath("temp\" + ci) + "\\" + NombreArchivo
                ColeccionArchivos(ArchivoActual).SaveAs(CarpetaParaGuardar)


                Contexto.Response.ContentType = "application/json"

                'Contexto.Response.Write("{\n'success\n':true,\n'msg\n':\n'" + NombreArchivo + "\n'}")
                'Dim json As String = New JavaScriptSerializer().Serialize(New With {
                '.name = NombreArchivo
                '})
                Contexto.Response.Write("\" + ci + "\" + NombreArchivo)
                Contexto.Response.End()
            Else
                Contexto.Response.ContentType = "application/json"
                Contexto.Response.Write(NombreArchivo)
                Contexto.Response.End()
            End If
        Next

    End Sub



    <WebMethod(EnableSession:=True)> _
    Public Sub GuardarArchivoPRUEBAcargo()

        Dim Contexto As HttpContext = HttpContext.Current
        Dim ColeccionArchivos As HttpFileCollection = Context.Request.Files
        Dim ci As String = HttpContext.Current.Request.Form("dato")



        Dim rutatotal1 As String = "temp/" + ci
        Dim ruta1 As String = Server.MapPath(rutatotal1)
        If Not Directory.Exists(ruta1) Then Directory.CreateDirectory(ruta1)


        Dim tipos As String
        Dim dt2 As New DataTable()
        Using con1 As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            Using cmd2 As New SqlCommand("select id_cargo from cargos where estado='ACTIVO' AND id_personal=(select idpersonal from personal where documento ='" + ci + "')", con1)
                con1.Open()
                Dim da2 As New SqlDataAdapter(cmd2)
                da2.Fill(dt2)
                If dt2.Rows.Count > 0 Then
                    tipos = dt2.Rows(0)("id_cargo").ToString()
                End If
                con1.Close()
            End Using
        End Using


        'Dim nom As String = BuscaContrato(Session("carnet").ToString) + Session("carnet").ToString
        Dim nom As String = Session("datos")(0) + "car"



        Dim NombreArchivo As String = ""
        Dim ArchivoActual As Integer
        Dim sizearchivo As Integer


        NombreArchivo = tipos + ci + "car.pdf"
        For ArchivoActual = 0 To ColeccionArchivos.Count - 1 Step ArchivoActual + 1
            'NombreArchivo = ColeccionArchivos(ArchivoActual).FileName
            'NombreArchivo = nom + ".pdf"

            sizearchivo = ColeccionArchivos(ArchivoActual).ContentLength
            If sizearchivo <= 1000000 Then
                Dim DatosArchivo As String = System.IO.Path.GetFileName(ColeccionArchivos(ArchivoActual).FileName)
                'Dim CarpetaParaGuardar As String = Server.MapPath("temp") + "\\" + "4042122.jpg"
                'Dim CarpetaParaGuardar As String = Server.MapPath("temp") + "\\" + NombreArchivo

                Dim CarpetaParaGuardar As String = Server.MapPath("temp\" + ci) + "\\" + NombreArchivo
                ColeccionArchivos(ArchivoActual).SaveAs(CarpetaParaGuardar)


                Contexto.Response.ContentType = "application/json"

                'Contexto.Response.Write("{\n'success\n':true,\n'msg\n':\n'" + NombreArchivo + "\n'}")
                'Dim json As String = New JavaScriptSerializer().Serialize(New With {
                '.name = NombreArchivo
                '})
                'Contexto.Response.Write("\" + ci + "\" + NombreArchivo)
                'Contexto.Response.End()
            Else
                Contexto.Response.ContentType = "application/json"
                Contexto.Response.Write(NombreArchivo)
                Contexto.Response.End()
            End If
        Next

    End Sub


    <WebMethod(EnableSession:=True)> _
    Public Function GuardarArchivoContrato1() As String
        Dim Contexto As HttpContext = HttpContext.Current
        Contexto.Response.ContentType = "application/json"
        Contexto.Response.Write("ok")
        Contexto.Response.End()
        Return "ok"


        'Try
        '    'Get the HttpFileCollection
        '    Dim Contexto As HttpContext = HttpContext.Current
        '    Dim hfCollection As HttpFileCollection = Contexto.Request.Files
        '    For i As Integer = 0 To hfCollection.Count - 1
        '        'Get the specific HttpPostedFile by index
        '        Dim hPostedFile As HttpPostedFile = hfCollection(i)
        '        If hPostedFile.ContentLength > 0 Then
        '            'Upload/save to the server
        '            hPostedFile.SaveAs(Server.MapPath("~/temp/") & "\" & System.IO.Path.GetFileName(hPostedFile.FileName))

        '            'Report the file was uploaded - you can customize this part -

        '            'Contexto.Response.ContentType = "application/json"
        '            'Contexto.Response.Write((("<b>File: </b>" & hPostedFile.FileName & " <b>Size:</b> ") & hPostedFile.ContentLength & " <b>Type:</b> ") & hPostedFile.ContentType & " Uploaded Successfully <br/>")
        '            'Contexto.Response.End()
        '        End If
        '    Next
        '    'TOOD: report if a error was fired.
        'Catch ex As Exception

        'End Try
    End Function


    Public Function subir(ByVal archivo As FileUpload, ByVal documento As String, ByVal formato As String, ByVal donde As String) As String
        Try
            If archivo.HasFile Then
                ' Se verifica que la extensión sea de un formato válido
                Dim ext As String = archivo.PostedFile.FileName
                ext = ext.Substring(ext.LastIndexOf(".") + 1).ToLower()
                'string[] formatos = new string[] { "jpg", "jpeg", "bmp", "png", "gif" };
                Dim formatos = New String() {formato}
                If Array.IndexOf(formatos, ext) < 0 Then
                    'Label2.Text = "Formato de imagen inválido."
                    'ClientScript.RegisterStartupScript(Me.GetType(), "mostrar mensaje", "ventanaanuncio1();", True)

                    Return "El archivo debe ser en formato ." + formato + ext
                Else
                    If archivo.PostedFile.ContentLength > 500000 Then
                        'ClientScript.RegisterStartupScript(Me.GetType(), "mostrar mensaje", "ventanaanuncio3();", True)

                        Return "El tamaño del archivo  debe ser menor a 500 Kb"
                    Else
                        'GuardarArchivo(archivo.PostedFile, (Session("datos")(1)), documento.ToLower(), formato)
                        Return "SI"
                    End If
                End If
            Else
                Return "Debe seleccionar un archivo"
            End If
        Catch ex As Exception

            Return ex.Message
        End Try
    End Function
    Public Function borrarArchivo(ByVal direccion As String, ByVal tipo As String, ByVal formato As String) As String
        Try
            Dim RutaArch As String
            'RutaArch = MapPath(".") & direccion
            RutaArch = Server.MapPath(".") + "/temp/" + direccion + "/" + direccion + tipo + formato
            Dim Archivo As FileInfo = New FileInfo(RutaArch)
            If Archivo.Exists Then
                File.Delete(RutaArch)
            Else
                Throw New FileNotFoundException()
            End If

            Return "OK"
        Catch excepcion As FileNotFoundException
            Return excepcion.Message + "no existe archivos"
        End Try
    End Function




    'GUARDA LA IMAGEN
    <WebMethod(EnableSession:=True)> _
    Public Sub GuardarArchivoContrato()

        'Dim nom As String = BuscaContrato(Session("carnet").ToString) + Session("carnet").ToString
        Dim nom As String = Session("datos")(1) + "cont1.pdf"

        'Dim NombreArchivo As String = ""
        'Dim rutatotal As String = "temp/" + Session("datos")(1)
        'Dim ruta As String = Server.MapPath(rutatotal)
        'If Not Directory.Exists(ruta) Then Directory.CreateDirectory(ruta)
        'NombreArchivo = String.Format("{0}\\{1}", ruta, nom + ".pdf")
        Dim Contexto As HttpContext = HttpContext.Current

        Dim CarpetaParaGuardar As String
        Try

            Dim ColeccionArchivos As HttpFileCollection = Context.Request.Files

            Dim ArchivoActual As Integer
            Dim sizearchivo As Integer

            For ArchivoActual = 0 To ColeccionArchivos.Count - 1 Step ArchivoActual + 1
                'NombreArchivo = ColeccionArchivos(ArchivoActual).FileName
                'NombreArchivo = nom + ".pdf"
                sizearchivo = ColeccionArchivos(ArchivoActual).ContentLength
                If sizearchivo <= 500000 Then
                    Dim DatosArchivo As String = System.IO.Path.GetFileName(ColeccionArchivos(ArchivoActual).FileName)


                    Dim rutatotal As String = "~/temp/" + Session("datos")(1)
                    Dim ruta As String = Server.MapPath(rutatotal)
                    'If Not Directory.Exists(ruta) Then Directory.CreateDirectory(ruta)
                    Dim archivo As String = String.Format("{0}\{1}", ruta, Session("datos")(1) + "cont1.pdf")

                    'CarpetaParaGuardar = Server.MapPath("temp/" + Session("datos")(1)) + "\\" + nom
                    'CarpetaParaGuardar = Server.MapPath(rutatotal) + "\\" + NombreArchivo

                    'Dim Archivo As FileInfo = New FileInfo(CarpetaParaGuardar)
                    'If Archivo.Exists Then
                    '    File.Delete(CarpetaParaGuardar)
                    'Else
                    '    Throw New FileNotFoundException()
                    'End If


                    'Dim CarpetaParaGuardar As String = Server.MapPath(rutatotal)
                    ColeccionArchivos(ArchivoActual).SaveAs(archivo)
                    Session("form2") = "OK"
                    Contexto.Response.ContentType = "application/json"
                    'Contexto.Response.Write("{\n'success\n':true,\n'msg\n':\n'" + NombreArchivo + "\n'}")
                    'Dim json As String = New JavaScriptSerializer().Serialize(New With {
                    '.name = NombreArchivo
                    '})
                    Contexto.Response.Write(Session("datos")(1) + "/" + nom)
                    Contexto.Response.End()
                    Return
                Else
                    Contexto.Response.ContentType = "application/json"
                    Contexto.Response.Write("Cargue archivo menor a 500KB")
                    Contexto.Response.End()
                End If
            Next
        Catch ex As Exception
            Contexto.Response.ContentType = "application/json"
            Contexto.Response.Write(ex.Message)
            Contexto.Response.End()
        End Try
    End Sub


    <WebMethod(EnableSession:=True)> _
    Public Sub GuardarArchivoCargo()


        'Dim nom As String = BuscaContrato(Session("carnet").ToString) + Session("carnet").ToString
        Dim nom As String = Session("datos")(1) + "car1.pdf"

        'Dim NombreArchivo As String = ""
        'Dim rutatotal As String = "temp/" + Session("datos")(1)
        'Dim ruta As String = Server.MapPath(rutatotal)
        'If Not Directory.Exists(ruta) Then Directory.CreateDirectory(ruta)
        'NombreArchivo = String.Format("{0}\\{1}", ruta, nom + ".pdf")
        Dim Contexto As HttpContext = HttpContext.Current

        Dim CarpetaParaGuardar As String
        'Try

        Dim ColeccionArchivos As HttpFileCollection = Context.Request.Files

        Dim ArchivoActual As Integer
        Dim sizearchivo As Integer

        For ArchivoActual = 0 To ColeccionArchivos.Count - 1 Step ArchivoActual + 1
            'NombreArchivo = ColeccionArchivos(ArchivoActual).FileName
            'NombreArchivo = nom + ".pdf"
            sizearchivo = ColeccionArchivos(ArchivoActual).ContentLength
            If sizearchivo <= 500000 Then
                Dim DatosArchivo As String = System.IO.Path.GetFileName(ColeccionArchivos(ArchivoActual).FileName)
                CarpetaParaGuardar = Server.MapPath("temp/" + Session("datos")(1)) + "\\" + nom
                'CarpetaParaGuardar = Server.MapPath(rutatotal) + "\\" + NombreArchivo


                'Dim Archivo As FileInfo = New FileInfo(CarpetaParaGuardar)
                'If Archivo.Exists Then
                '    File.Delete(CarpetaParaGuardar)
                'Else
                '    Throw New FileNotFoundException()
                'End If


                'Dim CarpetaParaGuardar As String = Server.MapPath(rutatotal)
                ColeccionArchivos(ArchivoActual).SaveAs(CarpetaParaGuardar)
                Session("form3") = "OK"
                Contexto.Response.ContentType = "application/json"
                'Contexto.Response.Write("{\n'success\n':true,\n'msg\n':\n'" + NombreArchivo + "\n'}")
                'Dim json As String = New JavaScriptSerializer().Serialize(New With {
                '.name = NombreArchivo
                '})
                Contexto.Response.Write(Session("datos")(1) + "/" + nom)
                Contexto.Response.End()
            Else
                Contexto.Response.ContentType = "application/json"
                Contexto.Response.Write("Cargue archivo menor a 500KB")
                Contexto.Response.End()
            End If
        Next
        'Catch ex As Exception
        '    Contexto.Response.ContentType = "application/json"
        '    Contexto.Response.Write("error")
        '    Contexto.Response.End()
        'End Try


    End Sub



    '<WebMethod(EnableSession:=True)> _
    'Public Sub GuardarArchivoCargo()


    '    'Dim nom As String = BuscaContrato(Session("carnet").ToString) + Session("carnet").ToString
    '    Dim nom As String = Session("datos")(1) + "car1"


    '    Dim rutatotal As String = "~/temp/" + Session("datos")(1)
    '    Dim ruta As String = Server.MapPath(rutatotal)
    '    If Not Directory.Exists(ruta) Then Directory.CreateDirectory(ruta)
    '    'Dim archivo As String = String.Format("{0}\{1}", ruta, Session("datos")(1) + "cont1" + ".pdf")
    '    Dim Contexto As HttpContext = HttpContext.Current
    '    Try

    '        Dim ColeccionArchivos As HttpFileCollection = Context.Request.Files
    '        Dim NombreArchivo As String = ""
    '        Dim ArchivoActual As Integer
    '        Dim sizearchivo As Integer
    '        Dim CarpetaParaGuardar As String
    '        For ArchivoActual = 0 To ColeccionArchivos.Count - 1 Step ArchivoActual + 1
    '            'NombreArchivo = ColeccionArchivos(ArchivoActual).FileName
    '            NombreArchivo = nom + ".pdf"
    '            sizearchivo = ColeccionArchivos(ArchivoActual).ContentLength
    '            If sizearchivo <= 500000 Then
    '                Dim DatosArchivo As String = System.IO.Path.GetFileName(ColeccionArchivos(ArchivoActual).FileName)
    '                'Dim CarpetaParaGuardar As String = Server.MapPath("temp") + "\\" + NombreArchivo
    '                CarpetaParaGuardar = Server.MapPath("temp\" + Session("datos")(1)) + "\\" + NombreArchivo


    '                Dim Archivo As FileInfo = New FileInfo(CarpetaParaGuardar)
    '                If Archivo.Exists Then
    '                    File.Delete(CarpetaParaGuardar)
    '                Else
    '                    Throw New FileNotFoundException()
    '                End If


    '                'Dim CarpetaParaGuardar As String = Server.MapPath(rutatotal)
    '                ColeccionArchivos(ArchivoActual).SaveAs(CarpetaParaGuardar)
    '                Contexto.Response.ContentType = "application/json"
    '                'Contexto.Response.Write("{\n'success\n':true,\n'msg\n':\n'" + NombreArchivo + "\n'}")
    '                'Dim json As String = New JavaScriptSerializer().Serialize(New With {
    '                '.name = NombreArchivo
    '                '})
    '                Contexto.Response.Write(NombreArchivo)
    '                Contexto.Response.End()
    '            Else
    '                Contexto.Response.ContentType = "application/json"
    '                Contexto.Response.Write(NombreArchivo)
    '                Contexto.Response.End()
    '            End If
    '        Next
    '    Catch ex As Exception
    '        Contexto.Response.ContentType = "application/json"
    '        Contexto.Response.Write(ex.Message)
    '        Contexto.Response.End()

    '    End Try




    'End Sub


    <WebMethod(EnableSession:=True)> _
    Public Function salirsistema() As String
        Session("idusuario") = ""
        Session("datos") = ""
        Return Session("idusuario")
    End Function
End Class