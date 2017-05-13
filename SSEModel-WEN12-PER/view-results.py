#!/usr/bin/env python
import numpy as np
from pygeons.io.parser import _get_field
from pygeons.main.gpstation import fogm
import os
import matplotlib.pyplot as plt
np.random.seed(0)

names = ['2009a','2010a','2011a','2011b','2012a','2013a','2013b','2014a','2015a','2016a','2017a']
files = ['sse/%s/data.reml.txt' % i for i in names]


params0 = {'east':[],'north':[],'vertical':[]}
params1 = {'east':[],'north':[],'vertical':[]}
params2 = {'east':[],'north':[],'vertical':[]}

for f in files:
  buff = open('%s' % f,'r')
  content = buff.read()
  buff.close()
  content = content[content.find('REML RESULTS'):]
  content = content[content.find('network :'):]
  units = _get_field('parameter units',content).strip().split(',')
  for dir in ['east','north','vertical']:
    params = _get_field('optimal %s parameters' % dir,content).strip().split(',')
    if np.isfinite(float(params[0])):
      params0[dir] += [float(params[0])]

    if np.isfinite(float(params[1])):
      params1[dir] += [float(params[1])]
      
    if np.isfinite(float(params[2])):
      params2[dir] += [float(params[2])]

east_p0 = params0['east']
north_p0 = params0['north']
vertical_p0 = params0['vertical']
east_p1 = params1['east']
north_p1 = params1['north']
vertical_p1 = params1['vertical']
east_p2 = params2['east']
north_p2 = params2['north']
vertical_p2 = params2['vertical']

stats_box = {'facecolor':'w','alpha':0.8,'boxstyle':'round','edgecolor':'0.8'}

fig,axs = plt.subplots(3,3,figsize=(11,6))

axs[0][0].hist(east_p0,5,color='C0',alpha=0.8)
text = 'median : %.3g\nIQR : %.3g - %.3g' % ((np.median(east_p0),) + tuple(np.percentile(east_p0,[25,75])))
axs[0][0].text(0.05,0.68,text,transform=axs[0][0].transAxes,bbox=stats_box)
axs[0][0].grid(c='0.5',alpha=0.5)
axs[0][0].set_ylabel('count')
axs[0][0].set_xlabel('east [%s]' % units[0])


axs[1][0].hist(north_p0,5,color='C0',alpha=0.8)
text = 'median : %.3g\nIQR : %.3g - %.3g' % ((np.median(north_p0),) + tuple(np.percentile(north_p0,[25,75])))
axs[1][0].text(0.05,0.68,text,transform=axs[1][0].transAxes,bbox=stats_box)
axs[1][0].grid(c='0.5',alpha=0.5)
axs[1][0].set_ylabel('count')
axs[1][0].set_xlabel('north [%s]' % units[0])

axs[2][0].hist(vertical_p0,5,color='C0',alpha=0.8)
text = 'median : %.3g\nIQR : %.3g - %.3g' % ((np.median(vertical_p0),) + tuple(np.percentile(vertical_p0,[25,75])))
axs[2][0].text(0.05,0.68,text,transform=axs[2][0].transAxes,bbox=stats_box)
axs[2][0].grid(c='0.5',alpha=0.5)
axs[2][0].set_ylabel('count')
axs[2][0].set_xlabel('vertical [%s]' % units[0])


axs[0][1].hist(east_p1,5,color='C0',alpha=0.8)
text = 'median : %.3g\nIQR : %.3g - %.3g' % ((np.median(east_p1),) + tuple(np.percentile(east_p1,[25,75])))
axs[0][1].text(0.05,0.68,text,transform=axs[0][1].transAxes,bbox=stats_box)
axs[0][1].grid(c='0.5',alpha=0.5)
axs[0][1].set_ylabel('count')
axs[0][1].set_xlabel('east [%s]' % units[1])

axs[1][1].hist(north_p1,5,color='C0',alpha=0.8)
text = 'median : %.3g\nIQR : %.3g - %.3g' % ((np.median(north_p1),) + tuple(np.percentile(north_p1,[25,75])))
axs[1][1].text(0.05,0.68,text,transform=axs[1][1].transAxes,bbox=stats_box)
axs[1][1].grid(c='0.5',alpha=0.5)
axs[1][1].set_ylabel('count')
axs[1][1].set_xlabel('north [%s]' % units[1])

axs[2][1].hist(vertical_p1,5,color='C0',alpha=0.8)
text = 'median : %.3g\nIQR : %.3g - %.3g' % ((np.median(vertical_p1),) + tuple(np.percentile(vertical_p1,[25,75])))
axs[2][1].text(0.05,0.68,text,transform=axs[2][1].transAxes,bbox=stats_box)
axs[2][1].grid(c='0.5',alpha=0.5)
axs[2][1].set_ylabel('count')
axs[2][1].set_xlabel('vertical [%s]' % units[1])

axs[0][2].hist(east_p2,5,color='C0',alpha=0.8)
text = 'median : %.3g\nIQR : %.3g - %.3g' % ((np.median(east_p2),) + tuple(np.percentile(east_p2,[25,75])))
axs[0][2].text(0.05,0.68,text,transform=axs[0][2].transAxes,bbox=stats_box)
axs[0][2].grid(c='0.5',alpha=0.5)
axs[0][2].set_ylabel('count')
axs[0][2].set_xlabel('east [%s]' % units[2])

axs[1][2].hist(north_p2,5,color='C0',alpha=0.8)
text = 'median : %.3g\nIQR : %.3g - %.3g' % ((np.median(north_p2),) + tuple(np.percentile(north_p2,[25,75])))
axs[1][2].text(0.05,0.68,text,transform=axs[1][2].transAxes,bbox=stats_box)
axs[1][2].grid(c='0.5',alpha=0.5)
axs[1][2].set_ylabel('count')
axs[1][2].set_xlabel('north [%s]' % units[2])

axs[2][2].hist(vertical_p2,5,color='C0',alpha=0.8)
text = 'median : %.3g\nIQR : %.3g - %.3g' % ((np.median(vertical_p2),) + tuple(np.percentile(vertical_p2,[25,75])))
axs[2][2].text(0.05,0.68,text,transform=axs[2][2].transAxes,bbox=stats_box)
axs[2][2].grid(c='0.5',alpha=0.5)
axs[2][2].set_ylabel('count')
axs[2][2].set_xlabel('vertical [%s]' % units[2])


fig.tight_layout()

plt.show()

## plot samples of the median noise models
#fig,ax = plt.subplots(3,1,figsize=(7,6))
#
#dt = 1.0/365.25
#time = np.arange(0.0,7.0,dt)
#
#gp = fogm(np.median(east_p0),np.median(east_p1),convert=False)
#sample = gp.sample(time[:,None])
#ax[0].plot(time,sample,'C0')
#sample = gp.sample(time[:,None])
#ax[0].plot(time,sample,'C1')
#ax[0].grid(c='0.5',alpha=0.5)
#ax[0].set_xlabel('time [yr]')
#ax[0].set_ylabel('easting [mm]')
#
#gp = fogm(np.median(north_p0),np.median(north_p1),convert=False)
#sample = gp.sample(time[:,None])
#ax[1].plot(time,sample,'C0')
#sample = gp.sample(time[:,None])
#ax[1].plot(time,sample,'C1')
#ax[1].grid(c='0.5',alpha=0.5)
#ax[1].set_xlabel('time [yr]')
#ax[1].set_ylabel('northing [mm]')
#
#gp = fogm(np.median(vertical_p0),np.median(vertical_p1),convert=False)
#sample = gp.sample(time[:,None])
#ax[2].plot(time,sample,'C0')
#sample = gp.sample(time[:,None])
#ax[2].plot(time,sample,'C1')
#ax[2].grid(c='0.5',alpha=0.5)
#ax[2].set_xlabel('time [yr]')
#ax[2].set_ylabel('vertical [mm]')
#
#fig.tight_layout()
#
#plt.show()
#
#
