#!/bin/bash

if grep -q -w "C" tmp.xyz && grep -q -w "H" tmp.xyz && grep -q -w "O" tmp.xyz;
then
sed '/fix/ipair_coeff * * ffield.reax.cho C H O' input_tmp > input;
elif grep -q -w "C" tmp.xyz && grep -q -w "H" tmp.xyz;
then
sed '/fix/ipair_coeff * * ffield.reax.cho C H' input_tmp > input;
elif grep -q -w "C" tmp.xyz && grep -q -w "O" tmp.xyz;
then
sed '/fix/ipair_coeff * * ffield.reax.cho C O' input_tmp > input;
elif grep -q -w "H" tmp.xyz && grep -q -w "O" tmp.xyz;
then
sed '/fix/ipair_coeff * * ffield.reax.cho H O' input_tmp > input;
elif grep -q -w "H" tmp.xyz tmp.xyz;
then
sed '/fix/ipair_coeff * * ffield.reax.cho H' input_tmp > input;
elif grep -q -w "C" tmp.xyz tmp.xyz;
then
sed '/fix/ipair_coeff * * ffield.reax.cho C' input_tmp > input;
else
sed '/fix/ipair_coeff * * ffield.reax.cho O' input_tmp > input;
fi
