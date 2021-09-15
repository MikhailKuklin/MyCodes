# import module and read xyz file

from ase.io import read, write

file=read('last3.xyz', index=":")


# create list of tags

tags = []

for structure in file:
  if structure.info['config_type'] not in tags:
    tags.append(structure.info['config_type'])

# extract unique tags and energy sigma

dict={}

for i in tags:
  dict.setdefault(i, [])

for key in tags:
  for structure in file:
    if structure.info['config_type'] == key and structure.info['energy_sigma'] not in dict.get(key):
      dict[key].append(structure.info['energy_sigma'])

