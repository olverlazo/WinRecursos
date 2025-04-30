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
Public Class WebService2
    Inherits System.Web.Services.WebService

    ' BUSCAR  USUARIO
    <WebMethod(EnableSession:=True)> _
    Public Function login1(ByVal v1 As String, ByVal v2 As String) As List(Of String)
        Dim dt As New DataTable()
        Dim dtfecha As New DataTable()
        'Dim i As Integer
        Dim persona_select As List(Of String) = New List(Of String)()
        Dim consulta As String = "select * from personal where documento ='" + v1 + "' and f_nacimiento='" + v2 + "'"
        Dim Contexto As HttpContext = HttpContext.Current
        Try
            Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
                'Using cmd As New SqlCommand("select * from personalPass where usuario ='" + v1 + "' and pasword='" + v2 + "'", con)

                Using cmd As New SqlCommand(consulta, con)
                    Dim cmdfecha As New SqlCommand("Select CONVERT(varchar,GETDATE(),103) +' '+CONVERT(varchar,GETDATE(),8) as [DD/MM/YYYY]", con)
                    con.Open()
                    Dim da As New SqlDataAdapter(cmd)
                    Dim dafecha As New SqlDataAdapter(cmdfecha)
                    da.Fill(dt)
                    dafecha.Fill(dtfecha)
                    If dt.Rows.Count > 0 Then
                        Session("idusuario") = dt.Rows(0).Item(1).ToString
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
                        persona_select.Add(dt.Rows(0).Item(16).ToString) 'cas
                        persona_select.Add(dt.Rows(0).Item(17).ToString) 'nivel de estudio
                        persona_select.Add(dt.Rows(0).Item(18).ToString) 'profecion
                        persona_select.Add(dt.Rows(0).Item(19).ToString) 'matricula prodfecional
                        persona_select.Add(dt.Rows(0).Item(20).ToString) ' materno
                        persona_select.Add(dt.Rows(0).Item(21).ToString) ' sexo
                        persona_select.Add(dt.Rows(0).Item(22).ToString) 'f_nacimiento
                        persona_select.Add(dt.Rows(0).Item(23).ToString) 'direccion
                        persona_select.Add(dt.Rows(0).Item(24).ToString) 'telefono
                        persona_select.Add(dt.Rows(0).Item(25).ToString) 'correo
                        persona_select.Add(dt.Rows(0).Item(26).ToString) 'caja de seguro
                        persona_select.Add(dt.Rows(0).Item(27).ToString) 'matricula seguro
                        persona_select.Add(dt.Rows(0).Item(28).ToString) 'afp
                        persona_select.Add(dt.Rows(0).Item(29).ToString) 'nua/cua
                        persona_select.Add(dt.Rows(0).Item(30).ToString) 'cas
                        persona_select.Add(dt.Rows(0).Item(31).ToString) 'nivel de estudio
                        persona_select.Add(dt.Rows(0).Item(32).ToString) 'profecion
                        persona_select.Add(dt.Rows(0).Item(33).ToString) 'matricula prodfecional
                        persona_select.Add(dt.Rows(0).Item(34).ToString) 'caja de seguro
                        persona_select.Add(dt.Rows(0).Item(35).ToString) 'matricula seguro
                        persona_select.Add(dt.Rows(0).Item(36).ToString) 'afp
                        persona_select.Add(dt.Rows(0).Item(37).ToString) 'nua/cua
                        persona_select.Add(dt.Rows(0).Item(38).ToString) 'cas
                        persona_select.Add(dtfecha.Rows(0).Item(0).ToString)


                        Session("datos") = persona_select
                        Session("idusuario") = dt.Rows(0).Item(0).ToString
                        'laboral(dt.Rows(0).Item(1).ToString)


                        Dim NombreArchivo As String = ""
                        Dim rutatotal As String = "temp/" + Session("datos")(1)
                        Dim ruta As String = Server.MapPath(rutatotal)
                        If Not Directory.Exists(ruta) Then Directory.CreateDirectory(ruta)
                        con.Close()
                        Return persona_select
                    Else
                        persona_select.Add("error")
                        persona_select.Add(consulta)
                        Session("datos") = persona_select
                        Return persona_select
                    End If
                End Using
            End Using
        Catch ex As Exception
            Contexto.Response.ContentType = "application/json"
            Contexto.Response.Write(consulta)
            Contexto.Response.End()

        End Try


       
    End Function

    ' Public Function actualizar_session(ByVal ParamArray Cadena() As List(Of String)) As String
    <WebMethod(EnableSession:=True)> _
    Public Function actualizar_session(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String, ByVal v7 As String, ByVal v8 As String, ByVal v9 As String, ByVal v10 As String, ByVal v11 As String, ByVal v12 As String, ByVal v13 As String, ByVal v14 As String, ByVal v15 As String, ByVal v16 As String, ByVal v17 As String, ByVal v18 As String) As String
        Try
            Session("datos")(4) = v1.ToUpper
            Session("datos")(5) = v2.ToUpper
            Session("datos")(6) = v3.ToUpper
            Session("datos")(1) = v4.ToUpper
            Session("datos")(2) = v5.ToUpper
            Session("datos")(3) = v6.ToUpper
            Session("datos")(8) = v7.ToUpper
            Session("datos")(7) = v8.ToUpper
            Session("datos")(9) = v9.ToUpper
            Session("datos")(10) = v10.ToUpper
            Session("datos")(11) = v11.ToLower
            Session("datos")(12) = v12.ToUpper
            Session("datos")(13) = v13.ToUpper
            Session("datos")(14) = v14.ToUpper
            Session("datos")(15) = v15.ToUpper
            Session("datos")(25) = v16.ToUpper
            Session("datos")(26) = v17.ToUpper
            Session("datos")(27) = v18.ToUpper

            'Dim cadena As String
            'Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)

            'con.Open()
            'cadena = "update personalTmp set documento=" & Session("datos")(1) & ",complemento='" & Session("datos")(2) & "',expedido='" & Session("datos")(3) & "',nombre='" & Session("datos")(4) & "',ap_paterno='" & Session("datos")(5) & "',ap_materno='" & Session("datos")(6) & "',sexo='" & Session("datos")(7) & "',f_nacimiento='" & Session("datos")(8) & "',direccion='" & Session("datos")(9) & "',telefono=" & Session("datos")(10) & ",correo='" & Session("datos")(11) & "',c_seguro='" & Session("datos")(12) & "',m_seguro='" & Session("datos")(13) & "',e_afiliado='" & Session("datos")(14) & "',c_afiliado='" & Session("datos")(15) & "',n_estudio='" & Session("datos")(25) & "',profesion='" & Session("datos")(26) & "',mat_profesion='" & Session("datos")(27) & "',r4='1',f_registro_personal='" & Session("datos")(39) & "',usuario_r_personal='" & Session("datos")(0) & "' where idpersonal=" & Session("datos")(0)
            'Dim cmd As New SqlCommand(cadena, con)
            'cmd.ExecuteNonQuery()
            'con.Close()

            Session("form1") = "OK"
            Return "OK"
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function


    <WebMethod(EnableSession:=True)> _
    Public Function laboral(ByVal v1 As String) As List(Of String)
        Dim dt As New DataTable()
        Dim persona_select As List(Of String) = New List(Of String)()
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            Using cmd As New SqlCommand("SELECT * FROM (SELECT tb_Cargo.id AS id_cargo,n_documento,personalPass.idpersonal AS id_personal,documento,complemento,expedido,nombre,ap_paterno,ap_materno,c_horaria,t_personal,categoria AS t_funcionario,n_item,f_financiamiento,f_ingreso,f_retiro,motivo_retiro,cargo,u_servicio,tb_cargo.id_uservicio,tb_Cargo.id_entidad,tb_contratos.estado,statu,tb_entidad.entidad FROM personalPass , tb_contratos, tb_uservicio, categoria, tb_tpersonal, ffinanciamiento, tb_cargo,tb_entidad WHERE tb_cargo.id IN (SELECT MIN(id) FROM tb_cargo t1,tb_contratos t2 WHERE t1.id_contrato = t2.n_documento GROUP BY id_contrato) AND personalPass.documento = tb_cargo.id_personal AND tb_contratos.n_documento=tb_cargo.id_contrato AND tb_uservicio.id = tb_cargo.id_uservicio AND categoria.id=tb_contratos.id_categoria AND tb_tpersonal.id=tb_contratos.id_tpersonal AND ffinanciamiento.id=tb_contratos.id_ffinanciamiento and tb_entidad.id=tb_cargo.id_entidad AND personalPass.documento='" + v1 + "')  as primera where primera.f_ingreso=(select max(f_ingreso) from (SELECT tb_entidad.id,tb_Cargo.id AS id_cargo,n_documento,personalPass.idpersonal AS id_personal,documento,complemento,expedido,nombre,ap_paterno,ap_materno,c_horaria,t_personal,categoria AS t_funcionario,n_item,f_financiamiento,f_ingreso,f_retiro,motivo_retiro,cargo,u_servicio,tb_cargo.id_uservicio,tb_Cargo.id_entidad,tb_contratos.estado,statu FROM personalPass, tb_contratos, tb_uservicio, categoria, tb_tpersonal, ffinanciamiento, tb_cargo,tb_entidad  WHERE tb_cargo.id IN (SELECT MIN(id) FROM tb_cargo t1,tb_contratos t2 WHERE t1.id_contrato = t2.n_documento GROUP BY id_contrato) AND personalPass.documento = tb_cargo.id_personal AND tb_contratos.n_documento=tb_cargo.id_contrato AND tb_uservicio.id = tb_cargo.id_uservicio AND categoria.id=tb_contratos.id_categoria AND tb_tpersonal.id=tb_contratos.id_tpersonal AND ffinanciamiento.id=tb_contratos.id_ffinanciamiento and tb_entidad.id=tb_cargo.id_entidad  AND personalPass.documento='" + v1 + "') as p)", con)
                con.Open()
                Dim da As New SqlDataAdapter(cmd)
                da.Fill(dt)
                If dt.Rows.Count > 0 Then
                    persona_select.Add(1)
                    persona_select.Add(dt.Rows(0).Item(1).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(2).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(3).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(4).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(5).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(6).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(7).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(8).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(9).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(10).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(11).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(12).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(13).ToString)
                    persona_select.Add(dt.Rows(0).Item(14).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(15).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(16).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(17).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(18).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(19).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(20).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(21).ToString.ToUpper)
                    persona_select.Add(dt.Rows(0).Item(22).ToString.ToUpper)
                    'DATOS PARA CONTRATO
                    persona_select.Add(dt.Rows(0).Item(23).ToString) 'ENTIDAD
                    Session("datos_laboral") = persona_select
                    con.Close()
                    Return persona_select
                Else
                    persona_select.Add("error")
                    Session("datos_laboral") = persona_select
                    Return persona_select
                End If

            End Using
        End Using
    End Function

    'GUARDAR BASE
    Public Function Nulo(ByVal valor As String) As String
        If valor.Length = 0 Then
            Return "null"
        Else
            If valor.ToLower = "null" Then
                Return "null"
            Else
                Return "'" & valor & "'"
            End If
        End If
    End Function


    <WebMethod(EnableSession:=True)> _
    Public Function guardarbase() As String
        Dim cadena As String

        Try
            Dim dt As New DataTable()
            Dim dt1 As New DataTable()
            Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)


            con.Open()
            cadena = "update personal set documento=" & Session("datos")(1) & ",complemento='" & Session("datos")(2) & "',expedido='" & Session("datos")(3) & "',nombre='" & Session("datos")(4) & "',ap_paterno='" & Session("datos")(5) & "',ap_materno='" & Session("datos")(6) & "',sexo='" & Session("datos")(7) & "',f_nacimiento='" & Session("datos")(8) & "',direccion='" & Session("datos")(9) & "',telefono=" & Session("datos")(10) & ",correo='" & Session("datos")(11) & "',c_seguro='" & Session("datos")(12) & "',m_seguro='" & Session("datos")(13) & "',e_afiliado='" & Session("datos")(14) & "',c_afiliado='" & Session("datos")(15) & "',n_estudio='" & Session("datos")(25) & "',profesion='" & Session("datos")(26) & "',mat_profesion='" & Session("datos")(27) & "',r4='1',f_registro_personal='" & Session("datos")(39) & "',usuario_r_personal='" & Session("datos")(0) & "' where idpersonal=" & Session("datos")(0)

            Dim cmd As New SqlCommand(cadena, con)
            cmd.ExecuteNonQuery()


            If (Session("datos_laboral")(6).Length = 0) Then
                cadena = "insert into CONTRATOS (id_personal,id_categoria,id_tipocontrato,item,id_FFinanciamiento,carga_horaria,fecha_inicio,estado,usuario,fecha) values (" & Session("datos")(0) & "," & Session("datos_laboral")(1) & "," & Session("datos_laboral")(0) & "," & Session("datos_laboral")(4) & "," & Session("datos_laboral")(2) & "," & Session("datos_laboral")(3) & ",'" & Session("datos_laboral")(5) & "','ACTIVO'," & Session("datos")(0) & ",'" & Session("datos")(39) & "')"
            Else
                cadena = "insert into CONTRATOS (id_personal,id_categoria,id_tipocontrato,item,id_FFinanciamiento,carga_horaria,fecha_inicio,fecha_retiro,estado,usuario,fecha) values (" & Session("datos")(0) & "," & Session("datos_laboral")(1) & "," & Session("datos_laboral")(0) & "," & Session("datos_laboral")(4) & "," & Session("datos_laboral")(2) & "," & Session("datos_laboral")(3) & ",'" & Session("datos_laboral")(5) & "','" & Session("datos_laboral")(6) & "','ACTIVO'," & Session("datos")(0) & ",'" & Session("datos")(39) & "')"
            End If



            Dim cmd1 As New SqlCommand(cadena, con)
            cmd1.ExecuteNonQuery()

            cadena = "select id_contrato  from contratos where id_personal=" & Session("datos")(0) & " and estado='ACTIVO'"
            Dim cmdcontrato As New SqlCommand(cadena, con)
            Dim da As New SqlDataAdapter(cmdcontrato)
            da.Fill(dt)


            cadena = "select idpersonal from personal where idpersonal=" & Session("datos")(0) & " and r4='1'"
            Dim sipersonal As New SqlCommand(cadena, con)
            Dim da1 As New SqlDataAdapter(sipersonal)
            da1.Fill(dt1)

            Dim id_contrato As String
            If dt.Rows.Count = 0 Or dt1.Rows.Count = 0 Then
                Return "error"
            Else
                id_contrato = dt.Rows(0).Item(0).ToString
            End If



            If (Session("datos_laboral")(6).Length = 0) Then
                cadena = "insert into Cargos (id_contrato,id_personal,id_bloque,id_servicio,cargo,fecha_ini,estado,usuario,fecha) values (" & id_contrato & "," & Session("datos")(0) & "," & Session("datos_cargo")(0) & "," & Session("datos_cargo")(1) & ",'" & Session("datos_cargo")(2) & "','" & Session("datos_cargo")(3) & "','ACTIVO'," & Session("datos")(0) & ",'" & Session("datos")(39) & "')"
            Else
                cadena = "insert into Cargos (id_contrato,id_personal,id_bloque,id_servicio,cargo,fecha_ini,fecha_fin,estado,usuario,fecha) values (" & id_contrato & "," & Session("datos")(0) & "," & Session("datos_cargo")(0) & "," & Session("datos_cargo")(1) & ",'" & Session("datos_cargo")(2) & "','" & Session("datos_cargo")(3) & "','" & Session("datos_cargo")(4) & "','ACTIVO'," & Session("datos")(0) & ",'" & Session("datos")(39) & "')"
            End If



            Dim cmd3 As New SqlCommand(cadena, con)
            cmd3.ExecuteNonQuery()

            con.Close()
            Return "OK"
        Catch ex As Exception
            Return "error"

        End Try

    End Function


    <WebMethod(EnableSession:=True)> _
    Public Function guardarbase1() As String
        Dim cadena As String
        Try
            Dim dt As New DataTable()
            Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)
            con.Open()
            cadena = "update personal set documento=" & Session("datos")(1) & ",complemento='" & Session("datos")(2) & "',expedido='" & Session("datos")(3) & "',nombre='" & Session("datos")(4) & "',ap_paterno='" & Session("datos")(5) & "',ap_materno='" & Session("datos")(6) & "',sexo='" & Session("datos")(7) & "',f_nacimiento='" & Session("datos")(8) & "',direccion='" & Session("datos")(9) & "',telefono=" & Session("datos")(10) & ",correo='" & Session("datos")(11) & "',c_seguro='" & Session("datos")(12) & "',m_seguro='" & Session("datos")(13) & "',e_afiliado='" & Session("datos")(14) & "',c_afiliado='" & Session("datos")(15) & "',n_estudio='" & Session("datos")(25) & "',profesion='" & Session("datos")(26) & "',mat_profesion='" & Session("datos")(27) & "',r4='1',f_registro_personal='" & Session("datos")(39) & "',usuario_r_personal='" & Session("datos")(0) & "' where idpersonal=" & Session("datos")(0)
            Dim cmd1 As New SqlCommand(cadena, con)
            cmd1.ExecuteNonQuery()


            Dim cmd As New SqlCommand()

            cmd.Connection = con
            cmd.CommandType = CommandType.StoredProcedure
            cmd.CommandText = "actualizar"
            cmd.Parameters.AddWithValue("@idpersonal", Session("datos")(0))
            Using sda As SqlDataAdapter = New SqlDataAdapter(cmd)
                sda.Fill(dt)
                If dt.Rows.Count > 0 Then
                    Return dt.Rows(0)("dato")
                End If
            End Using
        Catch ex As Exception
            Return "error"
        End Try

    End Function




    <WebMethod()> _
    Public Sub GuardarArchivoContrato1()
        'Create the Directory.
        Dim folderPath As String = HttpContext.Current.Server.MapPath("~/temp/")
        If Not Directory.Exists(folderPath) Then
            Directory.CreateDirectory(folderPath)
        End If

        'Fetch the File.
        Dim postedFile As HttpPostedFile = HttpContext.Current.Request.Files(0)

        'Fetch the File Name.
        Dim fileName As String = HttpContext.Current.Request.Form("fileName") + Path.GetExtension(postedFile.FileName)

        'Save the File.
        postedFile.SaveAs(folderPath & fileName)

        'Send OK Response to Client.
        HttpContext.Current.Response.StatusCode = CInt(HttpStatusCode.OK)
        HttpContext.Current.Response.Write(fileName)
        HttpContext.Current.Response.Flush()
    End Sub




    'ACTUALIZA VARIABLE DE SESSION LABORAL
    <WebMethod(EnableSession:=True)> _
    Public Function actualizar_session_laboral(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String, ByVal v7 As String) As String
        Try
            Dim persona_select As List(Of String) = New List(Of String)()
            persona_select.Add(v1)
            persona_select.Add(v2)
            persona_select.Add(v3)
            persona_select.Add(v4)
            persona_select.Add(v5)
            persona_select.Add(v6)
            persona_select.Add(v7)
            Session("datos_laboral") = persona_select



            Dim cadena As String
            Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)

            con.Open()
            cadena = "delete contratosTmp where id_personal='" & Session("datos")(0) & "'"
            Dim cmd As New SqlCommand(cadena, con)
            cmd.ExecuteNonQuery()
            con.Close()

            con.Open()
            If (v7.Length = 0) Then
                cadena = "insert into CONTRATOStmp (id_personal,id_categoria,id_tipocontrato,item,id_FFinanciamiento,carga_horaria,fecha_inicio,estado,usuario,fecha) values (" & Session("datos")(0) & "," & Session("datos_laboral")(1) & "," & Session("datos_laboral")(0) & "," & Session("datos_laboral")(4) & "," & Session("datos_laboral")(2) & "," & Session("datos_laboral")(3) & ",'" & Session("datos_laboral")(5) & "','ACTIVO'," & Session("datos")(0) & ",'" & Session("datos")(39) & "')"
            Else
                cadena = "insert into CONTRATOStmp (id_personal,id_categoria,id_tipocontrato,item,id_FFinanciamiento,carga_horaria,fecha_inicio,fecha_retiro,estado,usuario,fecha) values (" & Session("datos")(0) & "," & Session("datos_laboral")(1) & "," & Session("datos_laboral")(0) & "," & Session("datos_laboral")(4) & "," & Session("datos_laboral")(2) & "," & Session("datos_laboral")(3) & ",'" & Session("datos_laboral")(5) & "','" & Session("datos_laboral")(6) & "','ACTIVO'," & Session("datos")(0) & ",'" & Session("datos")(39) & "')"
            End If

            Dim cmd11 As New SqlCommand(cadena, con)
            cmd11.ExecuteNonQuery()
            con.Close()

            Session("form2") = "OK"
            Return "OK"
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function

    <WebMethod(EnableSession:=True)> _
    Public Function actualizar_cargo(ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String, ByVal v6 As String) As String
        'ByVal v1 As String, ByVal v2 As String, ByVal v3 As String, ByVal v4 As String, ByVal v5 As String
        Try
            Dim persona_select_cargo As List(Of String) = New List(Of String)()
            persona_select_cargo.Add(v1)
            persona_select_cargo.Add(v2)
            persona_select_cargo.Add(v3)
            persona_select_cargo.Add(v4)
            persona_select_cargo.Add(v5)

            Session("unidad") = v6
            Session("datos_cargo") = persona_select_cargo


            Dim cadena As String
            Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("BDRRHHConnectionString").ConnectionString)

            con.Open()
            cadena = "delete cargosTmp where id_personal='" & Session("datos")(0) & "'"
            Dim cmd As New SqlCommand(cadena, con)
            cmd.ExecuteNonQuery()
            con.Close()

            con.Open()
            If (v5.Length = 0) Then
                cadena = "insert into cargosTmp (id_personal,id_bloque,id_servicio,cargo,fecha_ini,estado,usuario,fecha) values (" & Session("datos")(0) & "," & Session("datos_cargo")(0) & "," & Session("datos_cargo")(1) & ",'" & Session("datos_cargo")(2) & "','" & Session("datos_cargo")(3) & "','ACTIVO'," & Session("datos")(0) & ",'" & Session("datos")(39) & "')"
            Else
                cadena = "insert into cargosTmp (id_personal,id_bloque,id_servicio,cargo,fecha_ini,fecha_fin,estado,usuario,fecha) values (" & Session("datos")(0) & "," & Session("datos_cargo")(0) & "," & Session("datos_cargo")(1) & ",'" & Session("datos_cargo")(2) & "','" & Session("datos_cargo")(3) & "','" & Session("datos_cargo")(4) & "','ACTIVO'," & Session("datos")(0) & ",'" & Session("datos")(39) & "')"
            End If

            Dim cmd11 As New SqlCommand(cadena, con)
            cmd11.ExecuteNonQuery()
            con.Close()


            Session("form3") = "OK"
            Return "OK"
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function

    <WebMethod(EnableSession:=True)> _
    Public Function salirsistema() As String
        Session("idusuario") = ""
        Session("datos") = ""

        Session("contador") = 0
        Session("idusuario") = ""
        Session("idpersonal") = ""
        Session("unidad") = ""

        Session("carnet") = ""

        Session("form1") = ""
        Session("form2") = ""
        Session("form3") = ""
        Session("form4") = ""

        Session("idsalida") = ""


        Session("lista") = ""


        Session("datos") = ""


        Session("datos_laboral") = ""


        Session("datos_cargo") = ""


        Return Session("idusuario")
    End Function
End Class