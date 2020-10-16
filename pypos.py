#!/usr/bin/env python3

# create poscars for calculated vasp structures including energy difference as E(VASP) - E(isolated atoms) - E(LAMPPS)

from ase.io import read, write

# open file with collected LAMPPS energies (kcal/mole)
f = open("l14", "r")
lines=f.readlines()

for i in range(0,39): #specify range of files
	u=i+1
	atoms=read("OUTCAR_run_%i" % u)
	e0={'H':-1.11747855, 'C':-1.37068744, 'O':-1.90850492} # energy of isolated atoms
	e_coh=0
	for a in range(len(atoms)):
		e_coh +=e0[atoms[a].symbol]
	for n in range(len(lines)):
		if n == i:
			e_lmp=float(lines[i])*0.0433634
	e_dft1= atoms.get_potential_energy(force_consistent=True)
	e_dft=e_dft1-e_coh-e_lmp
	atoms.info["energy_diff"]=e_dft
	write("poscar_test.xyz", atoms, append=True)
