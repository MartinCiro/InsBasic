#!/bin/bash
archivo="n.txt"
while IFS= read -r linea
do
  adb uninstall "$linea"
  echo $linea
done < "$archivo"