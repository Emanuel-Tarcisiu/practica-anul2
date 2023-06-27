#!/bin/bash

#grupul local default pt care facem sync e munca

membrii=`cat /etc/group|egrep munca|cut -f4 -d':'`

IFS=','

for i in $membrii
do
    cond=`sudo ls /home/$i|egrep dir_munca`
    if [[ ! $cond ]]
    then
        sudo mkdir /home/$i/dir_munca
        sudo chown -R $i:munca /home/$i/dir_munca
        echo "A fost creat directorul pentru munca pentru user-ul: $i"
    fi
done

cmn="0"
cine="0"
for i in $membrii
do
    mtime_aux=`sudo stat -c %Y /home/$i/dir_munca`

    if [[ $cmn < $mtime_aux ]]
    then
        cond=`sudo ls /home/$i/dir_munca`
        if [[ $cond ]]
        then
            cmn=$mtime_aux
            cine=$i
        fi
    fi
done

for i in $membrii
do
    if [[ $i != $cine ]]
    then
        sudo rm -r /home/$i/dir_munca
        sudo cp -r /home/$cine/dir_munca /home/$i
    fi
done

IFS=' '

echo "Sync intre statii:"
read -p "IP destinatie= " ipul
rsync -avz /home/emy/dir_sync/ cosmin_vasilache@$ipul:/home/cosmin_vasilache/remote_sync

#echo "$cine are cea mai noua vers $cmn"
echo
echo "Scriptul de sync se inchide!"
#client ssh pe amandoua