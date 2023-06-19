#!/bin/bash

select i in "Backup" "Sync" "Cleanup" "Updates" "EXIT"
do
    case $i in
    "Backup")
        ./test.sh
        echo 
        echo "s-a exe test.sh"
    ;;
    "Sync")
        echo "Sync neimplementat"
    ;;
    "Cleanup")
        echo "Cleanup neimplementat"
    ;;
    "Updates")
        echo "Updates neimplementat"
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