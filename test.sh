#!/bin/bash

cd ..
fisier=`ls |egrep -ow "pr.*"`

for i in $fisier
do
    if [[ -f $i ]]
    then
        echo "ii file"
    else
        echo "ii dir"
    fi
done