#!/usr/bin/env python
import urllib
from pygeons.mp import parmap
import os

if not os.path.exists('csv'):
  os.makedirs('csv')
  
f = open('url.txt','r')
urls = f.read().strip().split('\n')

def download(url):
  ref_i = url.split('.')[-2]
  agc = url.split('.')[-3]

  if ref_i != 'nam08':
    return

  if agc != 'pbo':
    return

  fid = url.strip().split('/')[-1]
  print('downloading station data file from %s' % url)
  try:
    buff = urllib.urlopen(url)
  except IOError:
    print('An error has occurred when trying to access %s' % url)
    return 

  pos_string = buff.read()
  buff.close()
  f = open('csv/' + fid,'w')
  f.write(pos_string)
  f.close()

parmap(download,urls,workers=4)

