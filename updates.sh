#!/bin/bash

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


cond=`ls /home/emy/practica|egrep -o "update_file.txt"`
download=`curl -SL "https://raw.githubusercontent.com/Emanuel-Tarcisiu/practica-anul2/main/UpdateFile"`

if [[ $cond ]]
then
   file_out=`cat /home/emy/practica/update_file.txt`

   if [[ $download != $file_out ]]
   then
      echo $download > /home/emy/practica/update_file.txt
      echo "Fisierul update_file.txt a fost actualizat!"
   fi
else
   touch /home/emy/practica/update_file.txt
   echo $download > /home/emy/practica/update_file.txt
   echo "Fisierul update_file.txt a fost creat, iar continutul a fost descarcat!"
fi

echo
echo "Scriptul de updates se inchide!"