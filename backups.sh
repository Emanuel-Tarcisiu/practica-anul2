#!/bin/bash

cd ..
fisier=`ls |egrep -ow "pr.*"`

for i in $fisier
do
    if [[ -f $i ]]
    then
        echo "$i ii file"
    else
        echo "$i ii dir"
    fi
done