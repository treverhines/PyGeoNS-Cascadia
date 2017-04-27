#!/usr/bin/env python
# this script removes high sigma values from an HDF5 file
import numpy as np
from pygeons.io.convert import dict_from_hdf5,hdf5_from_dict
import sys
fname = sys.argv[1]
cutoff = 0.02 # 2 cm cutoff
data = dict_from_hdf5(fname)
mask = ((data['north_std_dev'] > cutoff) |
        (data['east_std_dev'] > cutoff) |
        (data['vertical_std_dev'] > cutoff))

data['north'][mask] = np.nan         
data['north_std_dev'][mask] = np.inf

data['east'][mask] = np.nan         
data['east_std_dev'][mask] = np.inf

data['vertical'][mask] = np.nan         
data['vertical_std_dev'][mask] = np.inf

hdf5_from_dict(fname,data)



