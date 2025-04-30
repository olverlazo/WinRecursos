
Partial Class DefaultPersonal
    Inherits System.Web.UI.Page


    Protected Overrides Sub InitializeCulture()
        Dim Culture As String = "en"
        Dim ci As New System.Globalization.CultureInfo(Culture)
        Threading.Thread.CurrentThread.CurrentCulture = ci
        Threading.Thread.CurrentThread.CurrentUICulture = ci
        MyBase.InitializeCulture()
    End Sub


End Class
