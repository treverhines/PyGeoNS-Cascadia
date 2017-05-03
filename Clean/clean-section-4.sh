#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N clean-section-4
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o clean-section-4.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=10:00:00
cd $PBS_O_WORKDIR


# this script cleans data in the north-central-west section of the
# Pacific Northwest

FILE="data-2017-05-03.h5"
MIN_LON="-130.0"
MAX_LON="-121.0"
MIN_LAT="45.0"
MAX_LAT="47.0"

mkdir -p work/section-4/2017-2018
mkdir -p work/section-4/2016-2017
mkdir -p work/section-4/2015-2016
mkdir -p work/section-4/2014-2015
mkdir -p work/section-4/2013-2014
mkdir -p work/section-4/2012-2013
mkdir -p work/section-4/2011-2012
mkdir -p work/section-4/2010-2011
mkdir -p work/section-4/2009-2010

#for yr in 2009 2010 2011 2012 2013 2014 2015 2016 2017
for yr in 2009 2017
  do
  yrp1=$((yr+1))
  pygeons crop $FILE \
          --min-lat $MIN_LAT \
          --min-lon $MIN_LON \
          --max-lat $MAX_LAT \
          --max-lon $MAX_LON \
          --start-date $yr-01-01 \
          --stop-date $yrp1-01-01 \
          --output-stem work/section-4/$yr-$yrp1/data \
          -vv &>> work/section-4.log
  pygeons autoclean work/section-4/$yr-$yrp1/data.h5 \
          --output-stem work/section-4/$yr-$yrp1/data.clean \
          -vv &>> work/section-4.log
  done

pygeons merge work/section-4/2009-2010/data.clean.h5 \
              work/section-4/2010-2011/data.clean.h5 \
              work/section-4/2011-2012/data.clean.h5 \
              work/section-4/2012-2013/data.clean.h5 \
              work/section-4/2013-2014/data.clean.h5 \
              work/section-4/2014-2015/data.clean.h5 \
              work/section-4/2015-2016/data.clean.h5 \
              work/section-4/2016-2017/data.clean.h5 \
              work/section-4/2017-2018/data.clean.h5 \
        --output-stem work/section-4/data.clean.merged \
        -vv &>> work/section-4.log
