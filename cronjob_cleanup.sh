#!/bin/bash

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