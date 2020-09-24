#!/bin/bash

if grep -q -w "C" new.xyz && grep -q -w "H" new.xyz && grep -q -w "O" new.xyz;
then
cat ../../../POTCARS/C ../../../POTCARS/H ../../../POTCARS/O > POTCAR
elif grep -q -w "C" new.xyz && grep -q -w "H" new.xyz;
then
cat ../../../POTCARS/C ../../../POTCARS/H > POTCAR
elif grep -q -w "C" new.xyz && grep -q -w "O" new.xyz;
then
cat ../../../POTCARS/C ../../../POTCARS/O > POTCAR
elif grep -q -w "H" new.xyz && grep -q -w "O" new.xyz;
then
cat ../../../POTCARS/H ../../../POTCARS/O > POTCAR
elif grep -q -w "C" new.xyz new.xyz;
then
cat ../../../POTCARS/C > POTCAR
elif grep -q -w "H" tmp.xyz new.xyz;
then
cat ../../../POTCARS/H > POTCAR
else
cat ../../../POTCARS/O > POTCAR
fi
