#!/bin/bash

if [ -z $2 ]; then
    echo "0"
    exit 0
fi

if ! [[ $2 =~ [[:digit:]] ]]; then
     echo "Error.."
    exit 1
fi
sum=0
var=0

for i in $@
do
case "$1" in
    "-s")
        sum=$(echo ""$sum" + "$i"" | bc)
     ;;
    "-e")
        if [ $(($i % 2)) == 0 ]; then
              sum=$(echo ""$sum" + "$i"" | bc)
          fi
      ;;
     "-o")
         if [ $(($i % 2)) != 0 ]; then
              sum=$(echo ""$sum" + "$i"" | bc)
          fi
      ;;
      "-m")
          var=$(echo ""$var" + "$i"" | bc)
       ;;
     *)
       echo "Error.."
       exit 1
       ;;
esac

   done


   if [ $1 == "-m" ]; then
       shift 1
       sum=$(echo ""$var" / "$#"" | bc)
   fi

echo $sum
