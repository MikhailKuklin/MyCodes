#!/bin/bash

# this script add masses to LAMMPS data file depending on the elements in the xyz file. Script was written for QM9 database xyz files.
# Works only for CHO, but can be easily modified


if grep -q -w "C" tmp.xyz && grep -q -w "H" tmp.xyz && grep -q -w "O" tmp.xyz;
then
        sed '/Atoms/iMasses\n\n3   15.99900000    # O\n2   1.00800000    # H\n1   12.01100000    # C\n' tmp1 > tmp2;
elif grep -q -w "C" tmp.xyz && grep -q -w "H" tmp.xyz;
then
        sed '/Atoms/iMasses\n\n2   1.00800000    # H\n1   12.01100000    # C\n' tmp1 > tmp2;
elif grep -q -w "C" tmp.xyz && grep -q -w "O" tmp.xyz;
then
        sed '/Atoms/iMasses\n\n2   15.99900000    # O\n1   12.01100000    # C\n' tmp1 > tmp2;
elif grep -q -w "H" tmp.xyz && grep -q -w "O" tmp.xyz;
then
        sed '/Atoms/iMasses\n\n2   15.99900000    # O\n1   1.00800000    # H' tmp1 > tmp2;
elif grep -q -w "H" tmp.xyz tmp.xyz;
then
        sed '/Atoms/iMasses\n\n1   1.00800000    # H' tmp1 > tmp2;
elif grep -q -w "C" tmp.xyz tmp.xyz;
then
        sed '/Atoms/iMasses\n\n1   12.01100000    # C\n' tmp1 > tmp2;
else
        sed '/Atoms/iMasses\n\n1   15.99900000    # O' tmp1 > tmp2;

