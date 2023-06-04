MyBox = MsgBox("Script para calcular el Prorrateo",266304,"Prorrateo")
qss2 = InputBox("Hogar: S/n ", "Hogar o movil?", "")
if qss2="s"  then
MyBox = MsgBox("Script para calcular el Prorrateo del servicio hogar",266304,"Prorrateo de hogar")

qss = InputBox("Desea usar un mes diferente al actual?: S/n ", "Manual o automatico", "")
if qss="s"  then
   wscript.echo "Ha seleccionado ingresar datos manuales "
   Ndo = CInt(InputBox("Ingrese las unidades NDO: ", "Cantidad Nueva NDO", ""))
   tvb = CInt(InputBox("Ingrese las unidades TVBox: ", "Cantidad Nueva TVBox", ""))
   sumadi = Ndo + tvb
   df = InputBox("Ingrese el dia final del mes actual: ", "Ultimo dÃa del mes", "")
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
else
MyBox = MsgBox("Script para calcular el Prorrateo movil",266304,"Prorrateo movil")

tAc = CDbl(InputBox("Ingrese la tarifa actual: ", "Tarifa actual", ""))
ciclo = CInt(InputBox("Ingrese el ciclo del cliente: ", " Ciclo", ""))
ciclo2 = ciclo + 13
tNa = CDbl(InputBox("Ingrese la tarifa nueva: ", " Tarifa Nueva", ""))


sub LastMonth()
dim lassDay, fstCurMonth, lassMonth
   fstCurMonth="01/" & Month(date) & "/" & Year(Date)
   lassMonth=DateAdd("m",1,fstCurMonth)
   lassDay=DateAdd("d",-1,lassMonth)
   fdia = CInt(Day (lassDay))
   dia = CInt(Day (Date))
   resd = dia - ciclo
   
   resd2 = resd - fdia
   if resd2 <= 1 then
   resd2 = resd2*-1
   else
   resd2
   end if
   
   tNa2 = tNa/fdia*resd2
   tAc2 = tAc/fdia*ciclo2
   sumt = (tNa2 + tAc2 - tAc) + tNa
   
   wscript.echo "El cliente debe pagar: " & sumt
End Sub
call LastMonth
end if
