#!/bin/bash

if [ "$#" -lt 2 ]; then
  exit 1
fi
find $2 | while read name
do
  echo $name | cut -d '/' -f 2
  grep -n $1 $name | cut -d ':' -f -1
done
