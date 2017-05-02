#!/usr/bin/env python
import numpy as np
import h5py 
import sys
import subprocess as sp

filename = sys.argv[1]
keep_station = sys.argv[2:]
print('creating data file for stations %s' % ', '.join(keep_station))

f = h5py.File(filename,'r')
all_stations = f['id'][...]
f.close()
toss_stations = [i for i in all_stations if i not in keep_station]
toss_stations = ' '.join(toss_stations)

output_stem = '-'.join(keep_station)
sp.call('pygeons crop %s --stations %s --output-stem %s -vv' 
        % (filename,toss_stations,output_stem),shell=True)
