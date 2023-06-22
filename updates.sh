#!/bin/bash

if [[ $EUID -ne 0 ]]
then
   echo "Acest script trebuie rulat cu drepturi de root!"
   exit 1
fi

echo "Cautam update-urile disponibile:"
apt-get update

echo "Selecteaza daca update-urile vor fi instalate:"
apt-get upgrade

#mai trebuie sa rezolvi curl pt github