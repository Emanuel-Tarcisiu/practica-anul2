#!/bin/bash

echo "Hello there"

select i in "Backup" "Sync" "Cleanup" "Updates" "EXIT"
do
    case $i in
    "Backup")
        ./backups.sh /home/emy
        echo 
    ;;
    "Sync")
        echo "Sync neimplementat"
        echo
    ;;
    "Cleanup")
        echo "Cleanup neimplementat"
        echo
    ;;
    "Updates")
        echo "Updates neimplementat"
        echo
    ;;
    "EXIT")
        echo "Programul se va inchide in 3sec"
        sleep 3
        echo "GATA"
        exit 0
    ;;
    *)
    echo "Input gresit!"
    ;;
    esac
done