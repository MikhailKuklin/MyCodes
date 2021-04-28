#!/usr/bin/env python3

import numpy as np
import sys

# open file as the first argument in command line
file = sys.argv[1]
atoms = open(file)
lines = atoms.readlines()

# extract necessary lines
c = []
h = []
for line in lines:
	if (line.startswith('C')):
		c.append(" ".join(line.replace('C','').split()).split(' '))
	elif (line.startswith('H')):
		h.append(" ".join(line.replace('H', '').split()).split(' '))
		
# make arrays
carbon = np.array(c).astype(float)
hydrogen = np.array(h).astype(float)

# print results
print(f"Mean for Hirshfeld volumes of carbon atoms:  {np.mean(carbon[:,3])}")
print(f"Mean for Hirshfeld volumes of hydrogen atoms:  {np.mean(hydrogen[:,3])}")
