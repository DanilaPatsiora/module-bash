#!/bin/bash
if [ ! -f "$1" ];then
  exit 1
fi
for i in $@
do
  echo "$(awk 'END{print NR}' $i) $i"
done
