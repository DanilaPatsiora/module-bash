#!/bin/bash

if [ $# -lt 2 ];
then
    exit 1
fi

str=""

if [ $1 == "-e" ] || [ $1 == "--email" ];
then
    str=$(grep -m 1  -E -o  "[[:alnum:]]+\@[[:alpha:]]+\.[[:alpha:]]+" $2)

    if [ "$str" == "" ];
    then
        echo "$str"
        exit 1
    fi
fi

if [ $1 == "-u" ] || [ $1 == "--url" ];
then
    str=$(grep -i  -E -o "https:\/\/([[:alnum:]]|\.|\/)+" $2)
    if [ "$str" == "" ];
    then
        echo "$str"
        exit 1
    fi
fi

echo "$str"
