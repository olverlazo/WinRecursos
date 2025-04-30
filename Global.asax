<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
       
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub
        
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
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
        
        
        Dim listaAcceso As List(Of String) = New List(Of String)()
        Session("listaAcceso") = listaAcceso
        
        Dim lista As List(Of String) = New List(Of String)()
        Session("lista") = lista
        
        Dim persona As List(Of String) = New List(Of String)()
        Session("datos") = persona
                
        Dim laboral As List(Of String) = New List(Of String)()
        Session("datos_laboral") = laboral
        
        Dim listacargo As List(Of String) = New List(Of String)()
        Session("datos_cargo") = listacargo
        
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub
       
</script>