from ase.visualize import view
from ase.io import read, write
import numpy as np

for i in range(1,20): 
  atoms=read("%i.xyz" % i)
  pos=atoms.get_positions()
  a=atoms.numbers
  an=len(a)
# induce random distortion from 0 to 0.1
  dist=np.random.uniform(low=0, high=0.1, size=(an,3))
  atoms.positions=pos+dist
  atoms.center(vacuum=10)
#  write("POSCAR_%i" % i, atoms, sort=True)
  write("new_%i.xyz" % i, atoms)
