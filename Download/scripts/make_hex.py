#!/usr/bin/env python
import matplotlib.pyplot as plt
import numpy as np

dy = 0.4
dx = dy*2.0/np.sqrt(3)
dx *= 1.4

lons = np.arange(-126.0,-116.0,dx)
lats = np.arange(39.0,50.5,dy)
lons_grid,lats_grid = np.meshgrid(lons,lats)
lons_grid[::2,:] += dx/2.0
lons,lats = lons_grid.flatten(),lats_grid.flatten()
ids = np.array(['I%04d' % i for i in range(lons.shape[0])])
out = np.array([ids,lons,lats]).T
np.savetxt('hex.txt',out,fmt='%s')
