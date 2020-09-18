#!/bin/bash

# copy python to create LAMMPS data file by ase
export PYTHONPATH=$PYTHONPATH:/projappl/project_2000634/ase/ase-3.20.0b1

# modify xyz file from qm9 database so that it is readable by ase and then add masses field required by LAMMPS
# specorder is needed to ensure symbols in alphabetic order and correct masses for them
head -n -3 tmp.xyz > new.xyz
echo "from ase.io import read,write; atoms=read(\"new.xyz\"); atoms.center(vacuum=20); \
        write(\"new.lammps-data\", atoms, specorder=None)" | python3
cp new.lammps-data tmp1

# add masses of C, H, and O depending on the composition
{
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
fi
}

sh addmasses.sh

# here and below transformation for adding charges column to data file as required by LAMPPS for ReaxFF
{ sed -n '/Atoms/, $p' tmp2 > tmp3
  sed -n -i '3,1000p' tmp3
  awk '{print $1, $2, "0.", $3, $4, $5}' tmp3 > tmp4
  sed '1i\\' tmp4
} > tmp5

grep -B 9999999 "Atoms" tmp2 > tmp6
cat tmp6 tmp5 > input_structure

# remove tmp files
rm tmp1 tmp2 tmp3 tmp4 tmp5 tmp6
rm new*
