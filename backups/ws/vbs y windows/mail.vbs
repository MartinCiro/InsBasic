Sub EnviarCorreoConAdjuntos()
    Dim emailObj As Object
    Set emailObj = CreateObject("CDO.Message")
    
    ' Configuración del correo
    emailObj.From = "claroco2022@gmail.com"
    emailObj.To = "sebastian.villegas@tekniikan.com"
    emailObj.Subject = "Test CDO"
    emailObj.TextBody = "Test CDO"
    
    ' Configuración del servidor SMTP
    Set emailConfig = emailObj.Configuration
    emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.gmail.com"
    emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
    emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
    emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
    emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
    emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "claroco2022@gmail.com"
    emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "lheqccivhbcupgdr"
    emailConfig.Fields.Update
    
    ' Adjuntar archivos
    Dim attachmentPath As String
    attachmentPath = "C:\Users\User\Music\tutorial\illustrator\final.pdf" ' Ruta de tu archivo a adjuntar
    emailObj.AddAttachment attachmentPath
    
    ' Envío del correo
    emailObj.Send
    
    If Err.Number = 0 Then
        MsgBox "Correo enviado con éxito."
    Else
        MsgBox "Error al enviar el correo: " & Err.Description
    End If
End Sub

