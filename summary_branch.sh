#!/bin/bash

echo ''
echo "Working on it ..."

# open folder given as argument
cd $1

# create list of existing folders and extract T from their input files

cd turbogap/t01
ls -1v step* | grep 'step*' > list
sed -i 's/://g' list
for i in $(cat list); do cd $i; grep "t_beg" input; cd ../; done > tbeg
awk '{print $3}' tbeg > tbeg2
rm tbeg
mv tbeg2 ../../training/t01

# create list of existing folders and extract default sigma and number of structures in the database

cd ../../
cd training/t01
ls -1v vasp step* | grep 'step*' > list
sed -i 's/://g' list
sed -i '1 i\vasp' list
for i in $(cat list); do cd $i; grep "default_sigma" training_forces.sh; cd ../; done > defsigma
for i in $(cat list); do cd $i; grep "Lattice" new.xyz | wc -l; cd ../; done > strnum
awk '{print $1}' defsigma > defsigma2
sed -i 's/default_sigma={//' defsigma2

# extract rmse per structure and per atom

for i in $(cat list); do cd $i/runs/run_1; tail -n 1 rmse; cd ../../../; done > tmp2
awk '{print $2}' tmp2 > rmse_qm9
cp ../../../numbers ./
for i in $(cat list); do cp numbers $i/runs/run_1; cd $i/runs/run_1/; paste -d' ' comp numbers > comp2; awk '{print $1/$3,$2/$3}' comp2 > comp3; errors.py comp3 > rmse_pa; rm comp2 comp3; cd ../../../; done
for i in $(cat list); do cd $i/runs/run_1; tail -n 1 rmse_pa; cd ../../../; done > tmp3
awk '{print $2}' tmp3 > rmse_qm9_pa

# print all parameters

echo ''
echo -e "\033[31mFolder\033[0m" "\033[31mT(K)\033[0m " "  \033[31mReg(eV)\033[0m" " \033[31mData\033[0m" " \033[31mRMSE per str\033[0m" "       \033[31mRMSE per atom\033[0m"
echo "--------------------------------------------------------------------"
paste list tbeg2 defsigma2 strnum rmse_qm9 rmse_qm9_pa | column -tc6
echo ''
