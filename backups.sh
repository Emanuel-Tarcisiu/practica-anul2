#!/bin/bash

#default face backup la dir user-ului emy
#rsync timeshift
if [[ ! $1 ]]
then
    echo "NU ai introdus un director default!"
    exit 1
fi

numeDir=`echo $1|sed "s/.*\///"`
#echo $numeDir" si calea "$1

file=`ls /home|egrep -ow "backups"`

if [[ ! $file ]]
then
    sudo mkdir /home/backups
fi

exec_backup() {
        numeFis=`echo $1|sed "s/.*\///"`
        data=`stat $1|egrep Modify|cut -f2 -d' '`
        ora=`stat $1|egrep Modify|cut -f3 -d' '|cut -f1 -d'.'`
        if [[ -d $1 ]]
        then
            ext=$numeFis"+dir_"$data"_"$ora".tar"
        else
            ext=$numeFis"+f_"$data"_"$ora".tar"
        fi

        sudo tar cvf /home/backups/$ext $1
        echo
        echo "Backup teminat cu SUCCES!"
}

check_backup() {
    numeFis=`echo $1|sed "s/.*\///"`
    echo "EXISTA backup pentru $numeFis:"
    ls -l /home/backups|egrep $numeFis

    dataAUX=`stat $1|egrep Modify|cut -f2 -d' '`
    oraAUX=`stat $1|egrep Modify|cut -f3 -d' '|cut -f1 -d'.'`

    data=`ls /home/backups|egrep $numeFis|cut -f2 -d'_'`
    ora=`ls /home/backups|egrep $numeFis|cut -f3 -d'_'|sed "s/\..*//"`

    if [[ $ora != $oraAUX ]]
    then
        aux=`ls /home/backups|egrep $numeFis`
        sudo rm -v /home/backups/$aux

        file=`ls /home/backups|egrep $numeFis`
        if [[ $file ]]
        then
            echo "NU a fost inlaturat backup-ul invechit cum trebuie!"
            exit 1
        fi

        echo "Vechiul backup a fost inlaturat!"

        exec_backup $1
        echo "Backup-ul a fost actualizat!"
    elif [[ $data != $dataAUX ]]
    then
        aux=`ls /home/backups|egrep $numeFis`
        sudo rm -v /home/backups/$aux

        file=`ls /home/backups|egrep numeFis`
        if [[ $file ]]
        then
            echo "NU a fost inlaturat backup-ul invechit cum trebuie!"
            exit 1
        fi

        echo "Vechiul backup a fost inlaturat!"

        exec_backup $1
        echo "Backup-ul a fost actualizat!"
    else
        echo "Backup up-to-date!"
    fi
}

file=`ls /home/backups|egrep -o $numeDir`

if [[ $file ]]
then
    check_backup $1
else    
    exec_backup $1
fi


while true
do
    read -p "Vrei sa faci un backup la un fisier specific?[y/n]:" raspuns

    if [[ $raspuns = "y" || $raspuns = "Y" ]]
    then
        read -p "Calea absoluta a fisierului: " calea
        file=`echo $calea|sed "s/.*\///"`
        echo $file
        aux=`ls /home/backups|egrep -o "$file"`
        if [[ $file ]]
        then
            check_backup $calea
        else    
            exec_backup $calea
        fi
    elif [[ $raspuns = "n" || $raspuns = "N" ]]
        then
        break
    else
        echo "Input GRESIT!"
    fi
done

echo "Scritp-ul de backup se inchide!"