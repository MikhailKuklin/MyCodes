# MyCodes
This folder contains simple bash scripts for processing output data from CRYSTAL software for solid state chemistry and physics

Script pos2cry

Scipt is used for extracting structural information of 3D structures from USPEX code 9.4.4 version and creating input CRYSTAL17 files
Step 1: create a folder inside of "results" folder of USPEX and copy there gatheredPOSCARS_order file
Step 2: run the script by "pos2cry [number of structure in the gatheredPOSCARS_order file structural information of which you want to extract] [next number]. For example, for structure #24: pos2cry 24 25 
Step 3: script will show you the space group of the crystal structure and will create CRYSTAL17 input file with the modified coordinates in the format required for CRYSTAL17 calculations
