Set MyEmail=CreateObject("CDO.Message")

Const cdoBasic=0 'Do not Authenticate
Const cdoAuth=1 'Basic Authentication

MyEmail.Subject = "Subject"
MyEmail.From    = "claroco2022@gmail.com"
MyEmail.To      = "martinciro11@gmail.com"
MyEmail.TextBody= "TEST MAIL"

MyEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")=2

'SMTP Server
MyEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")="smtp.server.com"

'SMTP Port
MyEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25


MyEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1

'Your UserID on the SMTP server
MyEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "claroco2022@gmail.com"

'Your password on the SMTP server
MyEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "lheqccivhbcupgdr"


'Use SSL for the connection (False or True)
MyEmail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = False

MyEmail.Configuration.Fields.Update
MyEmail.Send

Set MyEmail=nothing 
