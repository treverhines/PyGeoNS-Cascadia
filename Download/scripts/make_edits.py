#!/usr/bin/env python
import numpy as np
import sys
step_file = sys.argv[1]
print('making "edits.log"')
fstep = open(step_file,'r')
fout = open('edits.log','w')

# manual edits
#fout.write('outliers CSHR 2014-08-22 2014-10-25\n')
#fout.write('outliers CSHR 2010-11-30 2011-04-01\n')
#fout.write('outliers HOLB 2016-05-06 2016-06-06\n')
#fout.write('outliers LINH 2015-12-16 2016-01-04\n')
#fout.write('outliers P024 2009-12-24 2010-01-22\n')
#fout.write('outliers P064 2012-01-12 2012-05-02\n')
#fout.write('outliers P064 2011-02-22 2011-05-16\n')
#fout.write('outliers P379 2012-12-01 2013-03-10\n')
#fout.write('outliers P379 2009-12-14 2010-06-24\n')
#fout.write('outliers P384 2012-12-22 2012-12-31\n')
#fout.write('jump     P389 2016-07-19 10\n')
#fout.write('outliers P390 2012-05-01 2012-05-01\n')
#fout.write('outliers P399 2012-12-18 2013-01-23\n')
#fout.write('outliers P399 2012-03-06 2012-04-13\n')
#fout.write('outliers P430 2015-04-19 2016-07-07\n')
#fout.write('jump     P432 2015-03-07 45\n')
#fout.write('outliers P443 2014-02-17 2014-03-09\n')
#fout.write('outliers P443 2015-07-09 2015-10-28\n')
#fout.write('outliers P443 2011-02-13 2011-05-13\n')
#fout.write('jump     P452 2016-01-08 52\n')
#fout.write('outliers P688 2011-02-17 2011-06-01\n')
#fout.write('outliers P688 2012-02-15 2012-05-04\n')
#fout.write('outliers P688 2012-12-02 2013-04-04\n')
#fout.write('outliers P688 2015-10-24 2016-01-22\n')
#fout.write('outliers P692 2014-10-08 2015-01-10\n')
#fout.write('outliers P697 2010-01-31 2017-04-14\n')
#fout.write('outliers P699 2010-06-03 2014-08-18\n')
#fout.write('outliers P703 2011-02-13 2011-03-31\n')
#fout.write('outliers P703 2012-03-08 2012-04-20\n')
#fout.write('outliers P703 2012-11-27 2013-01-15\n')
#fout.write('outliers P705 2011-02-20 2011-05-19\n')
#fout.write('outliers P705 2012-03-03 2012-04-25\n')
#fout.write('outliers P705 2012-10-19 2013-04-01\n')
#fout.write('outliers P705 2016-10-29 2017-01-07\n')
#fout.write('outliers P735 2012-12-10 2013-01-08\n')
#fout.write('outliers P735 2010-01-23 2010-01-28\n')
#fout.write('outliers P737 2010-11-06 2010-11-07\n')
#fout.write('outliers P791 2011-03-28 2011-05-28\n')
#fout.write('outliers P791 2012-02-17 2012-05-23\n')
#fout.write('jump     P791 2012-03-11 85\n')
#fout.write('outliers P792 2016-03-16 2016-04-22\n')
#fout.write('jump     PUPU 2013-06-02 10\n')
#fout.write('jump     SC00 2013-08-10 5\n')
#fout.write('jump     SC00 2011-07-03 4\n')
#fout.write('outliers SC00 2011-07-24 2011-08-10\n')
#fout.write('outliers SEDR 2012-05-08 2012-05-08\n')
#
## add an outlier lines for high elevation stations during the winter
#stations = ['WSLR','P693','P699','P690','P697','P695','SC03','P689','P694','PMAR','P792','P024']
#stations = ['WSLR','P024']
#years = np.arange(2000,2020)
#for s in stations:
#  for y in years:
#    fout.write('outliers %s %s-11-01 %s-04-01\n' % (s,y,y+1))
month_dict = {'JAN':'01',
              'FEB':'02', 
              'MAR':'03', 
              'APR':'04', 
              'MAY':'05', 
              'JUN':'06', 
              'JUL':'07', 
              'AUG':'08', 
              'SEP':'09', 
              'OCT':'10', 
              'NOV':'11', 
              'DEC':'12'}

for l in fstep:
  dat = l.strip().split()
  name,date = dat[0],dat[1]
  year = date[:2]
  if int(year) > 50:
    year = '19' + year
  else:
    year = '20' + year
     
  month = month_dict[date[2:5]]
  day = date[5:]
  date = year + '-' + month + '-' + day
  fout.write('jump %s %s 10\n' % (name,date))

fstep.close()
fout.close()
