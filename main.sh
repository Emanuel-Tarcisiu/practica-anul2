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
        ./sync.sh
        echo
    ;;
    "Cleanup")
        ./cleanup.sh /home/emy
        echo
    ;;
    "Updates")
        sudo ./updates.sh
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