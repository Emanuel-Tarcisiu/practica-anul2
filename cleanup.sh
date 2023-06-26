#!/bin/bash

#default goleste cahe-ul pentru un utlizator, fisierul comun pentru fisiere temp si fisierele cu extensia .log din var/log

if [[ ! $1 ]]
then
    echo "NU ai trimis niciun argument!"
    exit 1
fi

sudo rm -rvf $1/.cache/*
echo "$1/.cache a fost golit!"

file=`ls /home |egrep -ow "temp_files"`

if [[ ! $file ]]
then
    sudo mkdir /home/temp_files
    chmod 777 /home/temp_files
    echo "A fost creat un director comun pentru utilizatori, pentru fisiere temporare!"
else
    cond=`ls /home/temp_files`
    if [[ $cond ]]
    then
        sudo rm -rvf /home/temp_files/*
        echo "/home/temp_files a fost golit!"
    else
        echo "temp_files este deja gol!"
    fi
fi


sudo find /var/log -type f -name "*.log" -ctime +2 -exec rm -v {} \;
echo
echo "Au fost sterse fisierele mai vechi de 2 zile din /var/log!"

echo
echo "Scriptul de cleanup se inchide!"