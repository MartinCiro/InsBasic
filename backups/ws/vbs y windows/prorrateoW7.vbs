MyBox = MsgBox("Script para calcular el Prorrateo",266304,"Prorrateo")

qss = InputBox("Desea usar un mes diferente al actual?: S/n ", "Manual o automatico", "")
if qss="s"  then
   wscript.echo "Ha seleccionado ingresar datos manuales "
   Ndo = CInt(InputBox("Ingrese las unidades NDO: ", "Cantidad Nueva NDO", ""))
   tvb = CInt(InputBox("Ingrese las unidades TVBox: ", "Cantidad Nueva TVBox", ""))
   sumadi = Ndo + tvb
   df = InputBox("Ingrese el dia final del mes actual: ", "Ultimo día del mes", "")
   dst = InputBox("Ingrese los dias transcurridos: ", "Cantidad de dias transcurridos desde la instalacion", "")
   NdoD = CInt(Ndo*10000)
   tvbD = CInt(tvb*15000)
   sum = CInt(NdoD+tvbD)
   ins = 36000*sumadi
   renM = InputBox("Ingrese la renta mensual actual: ", "Actualmente Paga", "")
   rentaIn = CDbl(renM+sum)
   final = CDbl(sum/df*dst+rentaIn+ins)
   final2 = CStr(final)
   wscript.echo "El cliente debe pagar: " & final2
else
wscript.echo "Ha seleccionado fecha automatica"
Ndo = CInt(InputBox("Ingrese las unidades NDO: ", "Cantidad Nueva NDO", ""))
tvb = CInt(InputBox("Ingrese las unidades TVBox: ", "Cantidad Nueva TVBox", ""))
sumadi = Ndo + tvb
ciclo = InputBox("Ingrese el ciclo: ", "Ciclo", "")
Instalacion = InputBox("Ingrese el dia de instalacion: ", "Instalacion", "")
rest = CInt(Instalacion-ciclo)
NdoD = CInt(Ndo*10000)
tvbD = CInt(tvb*15000)
sum = CInt(NdoD+tvbD)
ins = 36000*sumadi
renM = InputBox("Ingrese la renta mensual actual: ", "Actualmente Paga", "")
rentaIn = CDbl(renM+sum)
sub LastMonth()
dim lassDay, fstCurMonth, lassMonth
   fstCurMonth="01/" & Month(date) & "/" & Year(Date)
   lassMonth=DateAdd("m",1,fstCurMonth)
   lassDay=DateAdd("d",-1,lassMonth)
   dst = Day(lassDay-rest)
   df = Day(lassDay)
   final = CDbl(sum/df*dst+rentaIn+ins)
   final2 = CStr(final)
   wscript.echo "El cliente debe pagar: " & final2
End Sub
call LastMonth
end if
