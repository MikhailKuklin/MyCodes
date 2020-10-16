#!/bin/bash

# extract energies from output files (log_test) in folders run_* (LAMMPS)
for i in run_*; do
cd $i && grep -wns "free  energy   TOTEN" OUTCAR | awk '{print $6}' > ../tmp1 && pwd | cut -d "/" -f9 | cut -d "_" -f2 > ../tmp2 && paste -d' ' ../tmp2 ../tmp1 > ../energies_$i
cd ../
done

# collect energies to one file
cat $(ls */energies_* | sort -n -t _ -k 2) > f_energies

#nl tmp3 | awk '{print $2, $1, $3}' > energies

# delete unnecesary files
rm tmp* energies_run_*
