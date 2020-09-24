#!/bin/bash

ls *.xyz > oldlist.dat

a=1
for i in *.xyz; do
  new=$(printf "%1d.xyz" "$a") #04 pad to length of 4
  yes | mv -i -- "$i" "$new"
  let a=a+1
done

ls *.xyz | sort -n > newlist.dat

paste -d' ' oldlist.dat newlist.dat comparisonlist


