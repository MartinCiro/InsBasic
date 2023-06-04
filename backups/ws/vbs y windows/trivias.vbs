num =  CStr(InputBox ("[+] Ingrese el numero de telefono : "))

texto =  InputBox ("Seleccione una opcion" & vbCrLf & "" & vbCrLf & "1.  Airg" & vbCrLf & "2.  RingMedia" & vbCrLf & "3.  JellySocial" & vbCrLf & "4.  Muuvii" & vbCrLf & "5.  Cykadas" & vbCrLf & "6.  3dm" & vbCrLf & "7.  3gmotion" & vbCrLf & "8.  Addyct" & vbCrLf & "9.  ClubApps" & vbCrLf & "10. Oferta Locura" & vbCrLf & "11. Comcel.com.co" & vbCrLf & "12. Wasabi" & vbCrLf & "13. Moob" & vbCrLf & "14. Memoob" & vbCrLf & "15. Nextext" & vbCrLf & "16. Apratel" & vbCrLf & "17. PbCustomerCare" & vbCrLf & "18. Quicklii" & vbCrLf & "19. Satelco" & vbCrLf & "20. MobileAmericas" & vbCrLf & "21. Timwe" & vbCrLf & "22. Pictuday" & vbCrLf & "21. Reclamaciones Colombia" & vbCrLf & "22. pictuday" & vbCrLf & "24. Prueba")

Select case texto
            case   1:
               opcion="support@airg.com"
            case  2:
	       opcion="help.co@ringmedia.mx" 
            case  3:
               opcion="help.co@jellysocial.com"
            case  4:
               opcion="info@muuvii.com"
            case  5:
               opcion="info@cykadas.com"
            case  6:
               opcion="sac.co@3dm.com.co"
            case  7:
               opcion="ayuda@3gmotion.com"
            case  8:
               opcion="servicio_cliente@addyct.com"
            case  9:
               opcion="soporte@clubapps.com.co"
            case  10:
               opcion="info@oferlocura.com.co"
            case  11:
               opcion="SERVICIOC@COMCEL.COM.CO"
            case  12:
               opcion="support@wasabi.com"
            case  13:
               opcion="info@moob.club"
            case  14:
               opcion="info@memoob.com"
            case  15:
               opcion="helpdesk@nextext.mx"
            case  16:
               opcion="helpdesk@nextext.mx"
            case  17:
               opcion="atc@pbcustomercare.com"
            case  18:
               opcion="customer.support@quicklii.co"
            case  19:
               opcion="info@satelco.co"
            case  20:
    	       opcion="it@mobile-americas.com"
            case  21:
               opcion="soporte@timwe.com"
            case  22:
               opcion="help.co@pictuday.com"
            case  23:
               opcion="reclamaciones.colombia@movile.com"
            case  24:
               opcion="martinciro11@gmail.com"
	    case else
	       wscript.echo "No se ha seleccionado ninguna opción", 305
End select

message =("Buen día, estoy tratando de hacer la cancelación de las trivias activas, he enviado la palabra salir a los códigos correspondiente sin éxito al igual que la palabra baja. El número de teléfono es " & num & " Colombia")
wscript.echo "          Se está enviando a: " & vbCrLf & "    " & opcion
set emailObj = CreateObject("CDO.Message")
emailObj.From = "claroco2022@gmail.com"
emailObj.To = opcion
emailObj.Subject = num & " Cancelacion de trivias"
emailObj.TextBody = message


'emailObj.AddAttachment "C:\a\a.txt" 
'emailObj.AddAttachment "C:\a\a.jpg"
'emailObj.AddAttachment "C:\a\a.pdf"

Set emailConfig = emailObj.Configuration

emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.gmail.com"
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2  
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1  
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = true 
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername") = "claroco2022@gmail.com"
emailConfig.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "lheqccivhbcupgdr"

emailConfig.Fields.Update


Sub Main()
    emailObj.Send
    If ErrorOccured Then Exit Sub else Msgbox "[+] Enviado con exito a: " & opcion
End Sub
call main
