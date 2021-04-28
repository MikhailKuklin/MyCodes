# MyCodes
This folder contains simple bash scripts for processing output data from software for solid state chemistry and physics, ML, and HPC clusters in general.

List below is probably outdated. Check scrips for more info.

Last time updated: 28.04.2020

**pos2cry.sh**

Scipt is used for extracting structural information of 3D structures from USPEX code 9.4.4 version and creating input CRYSTAL17 files
Step 1: create a folder inside of "results" folder of USPEX and copy there gatheredPOSCARS_order file
Step 2: run the script by "pos2cry [number of structure in the gatheredPOSCARS_order file structural information of which you want to extract] [next number]. For example, for structure #24: pos2cry 24 25 
Step 3: script will show you the space group of the crystal structure and will create CRYSTAL17 input file with the modified coordinates in the format required for CRYSTAL17 calculations

**pypos.py

Python script to create poscars files in a loop including dE as E(VASP)-E(isolated atoms)-E(LAMPPS). More details in the script. Python 3.

**pylmp.py

Script is used for creating data files for LAMPPS program by using ase interface if you have .xyz file(s). Python 3.

Code is adapted to particular .xyz files and "charge" atom_style (column of charge "0." is added to data file), so, one needs to modify script for its own goals i.e. "head" command removes unnecessary lines from .xyz files 

**get_mean_hirsh_vol.py

Give mean values for Hirshfeld volumes of elements presented in xyz database files. xyz database is created from output files from Vasp and Hirshfeld volumes added as a column. Python 3.

**induce_dist.py

Inducing random distortion to the structures from xyz databases.

**summary_branch.sh

Script gives summary for the calculations implemented using Quip - Turbogap - VASP generating database of the structures.

**ch_only_qm9.py

Extract structures from xyz which contain only C and H. Python 3.

**checkcalcs.sh

Check status of calculations submitted on CSC clusters puhti and mahti (Finland).

**addmasses.sh

Script adds atomic masses to LAMPPS data file depending on the structure. Works only for C-H-O, but can be easily modified.

**addpot.sh

Script adds correct line to LAMPPS input file for setting up ReaxFF calculation depending on the structure. Works only for C-H-O, but can be easily modified.

**addpotcar.sh

Script adds pseudopotentials in correct order to POTCAR file, VASP. 

**seqnumb.sh

Script renames all files in the folder to sequantial numbers.
