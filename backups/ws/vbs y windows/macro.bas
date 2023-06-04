REM  *****  BASIC  *****
Sub OpenXLS
Dim oDoc As Object
Dim sUrl As String

Dim Prop(0) as New com.sun.star.beans.PropertyValue

Prop(0).name="FilerName"
Prop(0).value="MS Excel 2006 XML"

sUrl=convertToURL("/media/ciro/vacio/Desktop/codigos.ods")

if fileExists (sUrl) then
	   oDoc = stardesktop.LoadComponentFromURL(sUrl,"_blank",0,Prop())
else
	msgbox "no encontrado"
end if
End Sub
