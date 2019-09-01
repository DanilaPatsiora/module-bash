#!/bin/bash

if [ -z $1 ]
then
    exit 1
fi

for i in $@;
do
    if [ $i == $1  ]
    then
        continue
    fi
    echo "$i $(grep $i $1 -c)"
    grep -n "$i" $1 | cut -d : -f 1
done
