set emailObj = CreateObject("CDO.Message")
emailObj.From = "claroco2022@gmail.com"
emailObj.To = "martinciro11@gmail.com"
emailObj.Subject = "Test CDO"
emailObj.TextBody = "Test CDO"

Set emailConfig = emailObj.Configuration

emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.gmail.com"
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2  
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1  
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = true 
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "claroco2022@gmail.com"
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "lheqccivhbcupgdr"

emailConfig.Fields.Update

emailObj.Send

If err.number = 0 then Msgbox "Done"
