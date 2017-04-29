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

FILE="data-2017-04-26.h5"
MAX_LON="-121.0"
MAX_LAT="47.0"
MIN_LAT="45.0"

mkdir -p work/section-4/2016-2017
mkdir -p work/section-4/2015-2016
mkdir -p work/section-4/2014-2015
mkdir -p work/section-4/2013-2014
mkdir -p work/section-4/2012-2013
mkdir -p work/section-4/2011-2012
mkdir -p work/section-4/2010-2011

for i in `seq 0 1 6`
  do
  ip1=$((i+1))
  pygeons crop $FILE \
          --max-lon $MAX_LON \
          --min-lat $MIN_LAT \
          --max-lat $MAX_LAT \
          --start-date 201$i-01-01 \
          --stop-date 201$ip1-01-01 \
          --output-stem work/section-4/201$i-201$ip1/data \
          -vv &>> work/section-4.log
  pygeons autoclean work/section-4/201$i-201$ip1/data.h5 \
          --output-stem work/section-4/201$i-201$ip1/data.clean \
          --network-params 5.0 0.05 100.0 \
          -vv &>> work/section-4.log
  done

pygeons merge work/section-4/2010-2011/data.clean.h5 \
              work/section-4/2011-2012/data.clean.h5 \
              work/section-4/2012-2013/data.clean.h5 \
              work/section-4/2013-2014/data.clean.h5 \
              work/section-4/2014-2015/data.clean.h5 \
              work/section-4/2015-2016/data.clean.h5 \
              work/section-4/2016-2017/data.clean.h5 \
        --output-stem work/section-4/data.clean.merged \
        -vv &>> work/section-4.log
