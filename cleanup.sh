#!/bin/bash

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
    echo "A fost creat un director comun pentru utilizatori, pentru fisiere temporare!"
else
   sudo rm -rvf /home/temp_files/*
   echo "/home/temp_files a fost golit!"
fi
