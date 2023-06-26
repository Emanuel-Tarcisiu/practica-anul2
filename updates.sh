#!/bin/bash


#default face update si upgrade la sistem, plus update la o aplicatie de pe github


if [[ $EUID -ne 0 ]]
then
   echo "Acest script trebuie rulat cu drepturi de root!"
   exit 1
fi

read -p "Vrei sa executi instructiunile de update automat?[y/n]:" cond

if [[ $cond = "y" || $cond = "Y" ]]
then
   echo "Cautam update-urile disponibile:"
   apt-get update
   apt-get upgrade
fi


cond=`ls /home/emy/practica|egrep -o "UpdateFile"`

if [[ $cond ]]
then
   download=`curl -SL "https://raw.githubusercontent.com/Emanuel-Tarcisiu/practica-anul2/main/UpdateFile"`
   file_out=`cat /home/emy/practica/UpdateFile`

   case "$download" in
   "$file_out")
      echo "Fisierul este up to date!"
   ;;
   *)
      rm /home/emy/practica/UpdateFile
      wget -P /home/emy/practica "https://raw.githubusercontent.com/Emanuel-Tarcisiu/practica-anul2/main/UpdateFile"
      echo "Fisierul a fost actualizat!"
   ;;
   esac
else
   wget -P /home/emy/practica "https://raw.githubusercontent.com/Emanuel-Tarcisiu/practica-anul2/main/UpdateFile"
   echo "Fisierul a fost creat, iar continutul a fost descarcat!"
fi

echo
echo "Scriptul de updates se inchide!"